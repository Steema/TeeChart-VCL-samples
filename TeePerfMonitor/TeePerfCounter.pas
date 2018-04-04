{*********************************************}
{ TeeChart, Windows Performance Counters demo }
{ Copyright 2004-2018 by Steema Software      }
{*********************************************}
unit TeePerfCounter;
{$I TeeDefs.inc}

interface

uses {$IFNDEF LINUX}
     Windows,
     {$ENDIF}
     Classes,
     Pdh, PdhMsg, WinPerf,
     TeeProcs, TeEngine, Chart;

type
  TCounterPathBuffer=Array [0..MAX_PATH + 1] of Char;

  TCounterItem=class(TInterfacedObject, ITeeEventListener)
  private
    FSeries       : TChartSeries;
    FScale        : Double;
    FTimeInterval : Boolean;

    InInterval    : Boolean;
    procedure SetSeries(Value:TChartSeries);
    procedure SetScale(const AValue: Double);
  protected
    procedure TeeEvent(Event:TTeeEvent);
  public
    Query       : HQUERY;
    Counter     : HCOUNTER;
    PathBuffer  : TCounterPathBuffer;
    Description : TStringList;

    Constructor Create(Chart:TCustomChart; Path:TCounterPathBuffer; English:Boolean=False; TimeInterval:Boolean=False);
    Destructor Destroy; override;

    Function ChangeType(NewType:TChartSeriesClass):TChartSeries;
    Function GetCounterInfo:String;
    procedure Refresh;

    class Function PerfDialog(Handle:HWND; var PathBuffer:TCounterPathBuffer):Boolean;
    property Scale:Double read FScale write SetScale;
    property Series : TChartSeries read FSeries write SetSeries;
  end;

implementation

uses
  SysUtils, TeCanvas, Series;

const
  PdhLib = 'pdh.dll';

var PdhAddEnglishCounter:function(hQuery: HQUERY; szFullCounterPath: PChar;
  dwUserData: DWORD_PTR; var phCounter: HCOUNTER): Longint; stdcall;

function PdHErrorMessage(ErrorCode: Integer): string;

var
  tmp    : HInst;
  Len    : Integer;
  Buffer : array[0..255] of Char;
begin
  tmp:=TeeLoadLibrary(PdhLib);

  if tmp<>0 then
  try
    Len := FormatMessage(FORMAT_MESSAGE_FROM_HMODULE or
      FORMAT_MESSAGE_ARGUMENT_ARRAY, Pointer(tmp), ErrorCode, 0, Buffer,
      SizeOf(Buffer), nil);

    while (Len > 0) and
          {$IFDEF D12}
          CharInSet(Buffer[Len - 1],[#0..#32, '.'])
          {$ELSE}
          (Buffer[Len - 1] in [#0..#32, '.'])
          {$ENDIF} do
             Dec(Len);

    SetString(Result, Buffer, Len);
  finally
    TeeFreeLibrary(tmp);
  end;
end;

procedure PdhCheck(const Error: Longint);
var tmpError : String;
begin
  if Error <> ERROR_SUCCESS then
  begin
    tmpError:=SysErrorMessage(Error);

    if tmpError='' then
       tmpError:=PdhErrorMessage(Error);

    raise Exception.Create('Error: ' + IntToHex(Error,8)+' '+tmpError);
  end;
end;

Constructor TCounterItem.Create(Chart:TCustomChart; Path:TCounterPathBuffer; English:Boolean=False; TimeInterval:Boolean=False);
begin
  FScale:=1;
  FTimeInterval:=TimeInterval;
  InInterval:=True;

  Description:=TStringList.Create;

  PathBuffer:=Path;
  PdhCheck(PdhOpenQuery(nil, 0, Query));

  if English and (@PdhAddEnglishCounter<>nil) then
     PdhCheck(PdhAddEnglishCounter(Query, PathBuffer, 0, Counter))
  else
     PdhCheck(PdhAddCounter(Query, PathBuffer, 0, Counter));

  Series:=Chart.AddSeries(TFastLineSeries);
  Series.Clear;
end;

Destructor TCounterItem.Destroy;
begin
  Series.Free;
  Description.Free;
  PdhCloseQuery(Query);
  inherited;
end;

Function TCounterItem.GetCounterInfo:String;
var InfoSize,
    BufferSize  : DWORD;
    FullPath    : String;
    CounterPathElem: TPdhCounterPathElements;
    CounterInfo : PPdhCounterInfo;
begin
  InfoSize := 0;
  PdhGetCounterInfo(Counter, True, @InfoSize, nil);

  CounterInfo := AllocMem(InfoSize);

  PdhCheck(PdhGetCounterInfo(Counter, True, @InfoSize, CounterInfo));

  Description.Clear;
  Description.Add(string(CounterInfo^.szExplainText));

  CounterPathElem.szMachineName := CounterInfo^.Union.szMachineName;
  CounterPathElem.szObjectName := CounterInfo^.Union.szObjectName;
  CounterPathElem.szInstanceName := CounterInfo^.Union.szInstanceName;
  CounterPathElem.szParentInstance := CounterInfo^.Union.szParentInstance;

  CounterPathElem.dwInstanceIndex := DWORD(-1);
  CounterPathElem.szCounterName := CounterInfo^.Union.szCounterName;

  BufferSize := 0;
  PdhMakeCounterPath(@CounterPathElem, nil, BufferSize, 0);

  SetLength(FullPath, BufferSize);
  PdhCheck(PdhMakeCounterPath(@CounterPathElem, PChar(FullPath), BufferSize, 0));

  FreeMem(CounterInfo);

  while FullPath[Length(FullPath)]=#0 do Delete(FullPath,Length(FullPath),1);

  result:=FullPath;
end;

procedure TCounterItem.Refresh;
var CounterValue : TPdhFmtCounterValue;
    tmp : DWord;
begin
  if Assigned(Series) then
  begin
    // Tell PDH to collect the data
    PdhCheck(PdhCollectQueryData(Query));

    InInterval:=not InInterval;

    if (not FTimeInterval) or InInterval then
    begin
      // Get the countervalue in int64 format
      tmp:=DWord(PdhGetFormattedCounterValue(Counter, PDH_FMT_DOUBLE, nil, CounterValue));

      if tmp<>PDH_INVALID_DATA then
      begin
        PdhCheck(tmp);

        // Display value
        case CounterValue.CStatus of
          PDH_CSTATUS_NEW_DATA,
          PDH_CSTATUS_VALID_DATA:
                  if Series.YMandatory then
                     Series.AddXY(Now,CounterValue.doubleValue)
                  else
                     Series.AddXY(CounterValue.doubleValue,Now);

      //    else
      //      EdiCounterValue.Text := 'Invalid data';
        end;
      end;
    end;
  end;
end;

class Function TCounterItem.PerfDialog(Handle:HWND; var PathBuffer:TCounterPathBuffer):Boolean;
var BrowseData : TPdhBrowseDlgConfig;
    tmpRes     : Integer;
begin
  with BrowseData do
  begin
    // The dialog will only allow the user to select a single, local counter
    dwConfigFlags := PDH_CF_SINGLECOUNTERPERADD or PDH_CF_SINGLECOUNTERPERDIALOG or PDH_CF_LOCALCOUNTERSONLY;
    // Force parent/child relationship
    hWndOwner := Handle;
    // Do not use a logfile or WMI but "normal" performance data
    szDataSource := nil;
    // The buffer in which the full path of the selected counter is returned
    szReturnPathBuffer := PathBuffer;
    // The length of the buffer
    cchReturnPathLength := MAX_PATH;
    // We don't use a callback
    pCallBack := nil;
    // So we don't need an argument either
    dwCallBackArg := 0;
    // And status is OK
    CallBackStatus := 0;
    // Assume the user is a genuine wiz. The dialog allows switching of level
    dwDefaultDetailLevel := PERF_DETAIL_WIZARD;
    // Caption of the dialog
    szDialogBoxCaption := 'Single Counter - Select one';
  end;

  // Show the dialog which allows the user to select a counter
  tmpRes:=PdhBrowseCounters(BrowseData);
  result:=tmpRes <> -2147481639;

  if result then PdhCheck(tmpRes);
end;

procedure TCounterItem.TeeEvent(Event: TTeeEvent);
begin
  if Event is TTeeSeriesEvent then
  if TTeeSeriesEvent(Event).Event=seRemove then
     if TTeeSeriesEvent(Event).Series=Self.Series then
        Self.Series:=nil;
end;

procedure TCounterItem.SetSeries(Value: TChartSeries);
begin
  FSeries:=Value;

  if Assigned(FSeries) then
  begin
    Series.Title:=GetCounterInfo;

    if Series.YMandatory then
       Series.XValues.DateTime:=True
    else
       Series.YValues.DateTime:=True;

    if Series.YMandatory then
       Series.GetHorizAxis.DateTimeFormat:='hh:mm:ss'
    else
       Series.GetVertAxis.DateTimeFormat:='hh:mm:ss';
  end;
end;

function TCounterItem.ChangeType(NewType: TChartSeriesClass): TChartSeries;
begin
  result:=ChangeSeriesType(TChartSeries(FSeries),NewType);
end;

procedure TCounterItem.SetScale(const AValue: Double);
var t : Integer;
begin
  if FScale<>AValue then
  begin
    with Series,MandatoryValueList do
    for t:=0 to Count-1 do
        Value[t]:=Value[t]*(1/FScale)*AValue;

    FScale:=AValue;

    Series.Repaint;
  end;
end;

procedure TryLoadPDH;
const
  FuncName='PdhAddEnglishCounter';

var tmp : HInst;
begin
  tmp:=TeeLoadLibrary(PdhLib);
  if tmp<>0 then
  try
    PdhAddEnglishCounter:=GetProcAddress(tmp,FuncName+{$IFDEF UNICODE}'W'{$ELSE}'A'{$ENDIF});
  finally
    TeeFreeLibrary(tmp);
  end;
end;

initialization
  TryLoadPDH;
end.
