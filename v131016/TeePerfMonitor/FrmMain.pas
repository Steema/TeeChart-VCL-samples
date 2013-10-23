unit FrmMain;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  {$ENDIF}
  TeEngine, Series, TeeProcs, Chart, TeeComma, TeePerfCounter, TeeLisB,
  TeCanvas, StatChar, TeeGauges, CandleCh, TeeTools, TeeThemeEditor,
  TeePNG, TeePCX, TeeGIF, TeeJPEG, TeeVMLCanvas, TeePSCanvas, TeePDFCanvas,
  TeeSVGCanvas, TeePenDlg;

type
  TMainForm = class(TForm)
    Chart1: TChart;
    Timer1: TTimer;
    Panel1: TPanel;
    CmdSelectCounter: TButton;
    EdiCounterValue: TEdit;
    UpDown1: TUpDown;
    Label1: TLabel;
    TeeCommander1: TTeeCommander;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    Memo1: TMemo;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    CheckBox1: TCheckBox;
    Series1: TBarSeries;
    ComboFlat1: TComboFlat;
    Button1: TButton;
    CBEnabled: TCheckBox;
    Panel2: TPanel;
    ChartListBox1: TChartListBox;
    Panel3: TPanel;
    Splitter2: TSplitter;
    PageControl2: TPageControl;
    TabSheet3: TTabSheet;
    TabSheet4: TTabSheet;
    RadioScroll: TRadioGroup;
    Label3: TLabel;
    Label2: TLabel;
    RadioHistory: TRadioGroup;
    Edit1: TEdit;
    UpDown2: TUpDown;
    ComboFlat2: TComboFlat;
    Edit2: TEdit;
    UpDown3: TUpDown;
    ChartTool1: TColorLineTool;
    Label4: TLabel;
    TabSheet5: TTabSheet;
    Label6: TLabel;
    ComboScale: TComboFlat;
    CBVisible: TCheckBox;
    Label5: TLabel;
    procedure CmdSelectCounterClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure EdiCounterValueChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ChartListBox1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBEnabledClick(Sender: TObject);
    procedure RadioHistoryClick(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboFlat2Change(Sender: TObject);
    procedure RadioScrollClick(Sender: TObject);
    procedure ComboScaleChange(Sender: TObject);
    procedure CBVisibleClick(Sender: TObject);
  private
    Creating : Boolean;
    Items : Array of TCounterItem;
    ScrollPercent,
    ScrollNum,
    NumSamples,
    TimeUnits : Integer;

    procedure AddNewCounter(PathBuffer:TCounterPathBuffer; English:Boolean=False; TimeInterval:Boolean=False);
    procedure CheckComboTypes;
    procedure RefreshHistogram;
    procedure RefreshStatus;
    Function SelectedCounter:TCounterItem;
  end;

var
  MainForm: TMainForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeDonut;

procedure TMainForm.RefreshHistogram;
var t : Integer;
begin
  Series1.Clear;

  for t:=0 to Length(Items)-1 do
  if Assigned(Items[t].Series) then
     Series1.Add(Items[t].Series.MandatoryValueList.Last,Items[t].Series.Title,
        Items[t].Series.SeriesColor);
end;

procedure TMainForm.Timer1Timer(Sender: TObject);
var t : Integer;
begin
  Timer1.Enabled:=False;

  for t:=0 to Length(Items)-1 do
  begin
    try
      Items[t].Refresh;
    except
      on Exception do
      begin
        CBEnabled.Checked:=False;
        raise;
      end;
    end;

    case RadioHistory.ItemIndex of
      1: if Items[t].Series.Count>NumSamples then
            Items[t].Series.Delete(0,Items[t].Series.Count-NumSamples);
      2: ;
    end;

    case RadioScroll.ItemIndex of
      0: Items[t].Series.GetHorizAxis.Automatic:=True;
      1: with Items[t].Series do
         if XValues.Last>=GetHorizAxis.Maximum then
         begin
           Items[t].Series.GetHorizAxis.Automatic:=True;
           GetHorizAxis.AdjustMaxMin;
           GetHorizAxis.SetMinMax(GetHorizAxis.Minimum,GetHorizAxis.Maximum+(ScrollPercent*(GetHorizAxis.Maximum-GetHorizAxis.Minimum)*0.01));
         end;
    end;
  end;

  RefreshStatus;

  if Series1.Visible then RefreshHistogram;

  Timer1.Enabled:=True;
end;

procedure TMainForm.RefreshStatus;
var tmp : TChartValueList;
begin
  if not CheckBox1.Checked then
  if Length(Items)>0 then
  if (SelectedCounter<>nil) then
  if Assigned(SelectedCounter.Series) then
  with SelectedCounter.Series do
  if Count>0 then
  begin
    StatusBar1.Panels[0].Text:='Last: '+FormatFloat(ValueFormat,MandatoryValueList.Last);
    StatusBar1.Panels[1].Text:='Avg: '+FormatFloat(ValueFormat,MandatoryValueList.Total/Count);
    StatusBar1.Panels[2].Text:='Min: '+FormatFloat(ValueFormat,MandatoryValueList.MinValue);
    StatusBar1.Panels[3].Text:='Max: '+FormatFloat(ValueFormat,MandatoryValueList.MaxValue);

    if YMandatory then tmp:=XValues else tmp:=YValues;

    StatusBar1.Panels[4].Text:='Duration: '+TimeToStr(tmp.Last-tmp.First)+'  Count: '+IntToStr(Count);
  end;
end;

procedure TMainForm.EdiCounterValueChange(Sender: TObject);
var Old : Boolean;
begin
  Old:=Timer1.Enabled;
  try
    Timer1.Interval:=UpDown1.Position;
  finally
    Timer1.Enabled:=Old;
  end;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
var t: Integer;
begin
  for t:=0 to Length(Items)-1 do Items[t].Free;
  Items:=nil;
end;

procedure TMainForm.AddNewCounter(PathBuffer:TCounterPathBuffer; English:Boolean=False; TimeInterval:Boolean=False);
var tmp : TCounterItem;
begin
  tmp:=TCounterItem.Create(Chart1,PathBuffer,English,TimeInterval);

  SetLength(Items,Length(Items)+1);
  Items[Length(Items)-1]:=tmp;
  tmp.Series.Visible:=not CheckBox1.Checked;

  Chart1.Title.Text.Clear;
  if Length(Items)=1 then
     Chart1.Title.Text.Add(Items[0].GetCounterInfo)
  else
     Chart1.Title.Text.Add('Several counters');
end;

procedure TMainForm.CmdSelectCounterClick(Sender: TObject);
var PathBuffer : TCounterPathBuffer;
begin
  if TCounterItem.PerfDialog({$IFDEF CLX}0{$ELSE}Handle{$ENDIF}, PathBuffer) then
     AddNewCounter(PathBuffer);
end;

type
  TSeriesAccess=class(TChartSeries);

procedure TMainForm.FormCreate(Sender: TObject);
begin
  Creating:=False;

  ComboScale.ItemIndex:=6;

  NumSamples:=100;
  TimeUnits:=0;
  ScrollPercent:=25;
  ScrollNum:=25;

  Chart1.Legend.LegendStyle:=lsLastValues;
  Chart1.Legend.Alignment:=laBottom;

  Chart1.Zoom.Direction:=tzdHorizontal;
  Chart1.Zoom.Brush.Style:=bsSolid;

  Series1.Visible:=False;
  Series1.Marks.Style:=smsValue;
  Series1.ShowInEditor:=False;

  ChartListBox1.FillSeries(nil);

  CheckComboTypes;

  RadioHistoryClick(Self);
  RadioScrollClick(Self);
  ChartListBox1Click(Self);

  Timer1.Enabled:=CBEnabled.Checked;
  Timer1Timer(Timer1);

  AddNewCounter('\Processor(_Total)\% Processor Time',True);
  AddNewCounter('\LogicalDisk(_Total)\% Disk Time',True);
  AddNewCounter('\Memory\Pages/sec', True, True);
end;

Function TMainForm.SelectedCounter:TCounterItem;
begin
  if ChartListBox1.ItemIndex=-1 then
     result:=nil
  else
  if Length(Items)>ChartListBox1.ItemIndex then
     result:=Items[ChartListBox1.ItemIndex]
  else
     result:=nil;
end;

procedure TMainForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage=TabSheet2 then
     if SelectedCounter<>nil then
        Memo1.Lines:=SelectedCounter.Description
     else
        Memo1.Lines.Clear;
end;

Function IndexOfScale(const Scale:Double):Integer;

  function EqualFloat(const a,b:Double):Boolean;
  begin
    result:=Abs(a-b)<1e-20;
  end;

begin
  if EqualFloat(Scale,1/1000000) then result:=0 else
  if EqualFloat(Scale,1/100000) then result:=1 else
  if EqualFloat(Scale,1/10000) then result:=2 else
  if EqualFloat(Scale,1/1000) then result:=3 else
  if EqualFloat(Scale,1/100) then result:=4 else
  if EqualFloat(Scale,1/10) then result:=5 else
  if EqualFloat(Scale,1) then result:=6 else
  if EqualFloat(Scale,10) then result:=7 else
  if EqualFloat(Scale,100) then result:=8 else
  if EqualFloat(Scale,1000) then result:=9 else
  if EqualFloat(Scale,10000) then result:=10 else
  if EqualFloat(Scale,100000) then result:=11 else
  if EqualFloat(Scale,1000000) then result:=12 else
     result:=6;
end;

procedure TMainForm.ChartListBox1Click(Sender: TObject);
const Types:Array[0..10] of TClass=
  ( TFastLineSeries,
    TLineSeries,
    TPointSeries,
    TAreaSeries,
    TBarSeries,
    THorizBarSeries,
    THistogramSeries,
    THorizLineSeries,
    THorizAreaSeries,
    TGaugeSeries,
    TVolumeSeries);

var t : Integer;
begin
  PageControl1Change(Self);

  if SelectedCounter<>nil then
  begin
    ComboScale.ItemIndex:=IndexOfScale(SelectedCounter.Scale);
    CBVisible.Checked:=SelectedCounter.Series.Visible;

    for t:=0 to 10 do
      if SelectedCounter.Series.ClassType=Types[t] then
      begin
        ComboFlat1.ItemIndex:=t;
        break;
      end;
  end;

  RefreshStatus;
end;

procedure TMainForm.CheckBox1Click(Sender: TObject);
var t : Integer;
begin
  for t:=0 to Chart1.SeriesCount-1 do
      Chart1[t].Visible:=not CheckBox1.Checked;

  Series1.Visible:=CheckBox1.Checked;
  if Series1.Visible then RefreshHistogram;

//  ChartListBox1.Visible:=not CheckBox1.Checked;

  TabSheet3.TabVisible:=not CheckBox1.Checked;
  TabSheet4.TabVisible:=not CheckBox1.Checked;

  ChartListBox1.ShowActiveCheck:=not CheckBox1.Checked;

  if CheckBox1.Checked then
     Chart1.Legend.LegendStyle:=lsValues
  else
     Chart1.Legend.LegendStyle:=lsLastValues;

//  Series1.GetHorizAxis.LabelsAlternate:=CheckBox1.Checked;

  if CheckBox1.Checked then
     Series1.GetHorizAxis.LabelStyle:=talValue
  else
     Series1.GetHorizAxis.LabelStyle:=talAuto;

  CheckComboTypes;

  StatusBar1.Visible:=not CheckBox1.Checked;

  ChartTool1.Visible:=not CheckBox1.Checked;
end;

procedure TMainForm.ComboFlat1Change(Sender: TObject);
var old : Integer;
begin
  old:=ChartListBox1.ItemIndex;

  if CheckBox1.Checked then
  case ComboFlat1.ItemIndex of
    0: ChangeSeriesType(TChartSeries(Series1),TBarSeries);
    1: ChangeSeriesType(TChartSeries(Series1),THorizBarSeries);
    2: (ChangeSeriesType(TChartSeries(Series1),TPieSeries) as TPieSeries).Circled:=True;
    3: (ChangeSeriesType(TChartSeries(Series1),TDonutSeries) as TDonutSeries).Circled:=True;
  end
  else
  if (SelectedCounter<>nil) then
  begin
    with SelectedCounter do
    case ComboFlat1.ItemIndex of
      0: ChangeType(TFastLineSeries);
      1: ChangeType(TLineSeries);
      2: ChangeType(TPointSeries);
      3: ChangeType(TAreaSeries);
      4: ChangeType(TBarSeries);
      5: ChangeType(THorizBarSeries);
      6: ChangeType(THistogramSeries);
      7: ChangeType(THorizLineSeries);
      8: ChangeType(THorizAreaSeries);
      9: ChangeType(TGaugeSeries);
     10: ChangeType(TVolumeSeries);
    end;

    ChartTool1.Visible:=not (SelectedCounter.Series is TGaugeSeries);

    if SelectedCounter.Series.YMandatory then
    begin
      Chart1.Zoom.Direction:=tzdHorizontal;
      Chart1.AllowPanning:=pmHorizontal;
    end
    else
    begin
      Chart1.Zoom.Direction:=tzdVertical;
      Chart1.AllowPanning:=pmVertical;
    end;
  end;

  // with another sub-counter for the "z" or "bubble radius", then 3D!
  // what about Polar, Radar, for circled counters ?

  ChartListBox1.ItemIndex:=old;
end;

procedure TMainForm.Button1Click(Sender: TObject);
begin
  Chart1.SeriesList.ClearValues;
end;

procedure TMainForm.CBEnabledClick(Sender: TObject);
begin
  Timer1.Enabled:=CBEnabled.Checked;
end;

// Change Combo to Chart Gallery sub-panel (more visual)
procedure TMainForm.CheckComboTypes;
begin
  ComboFlat1.Clear;
  if CheckBox1.Checked then
  begin
    ComboFlat1.Items.Add('Bar');
    ComboFlat1.Items.Add('Horiz. Bar');
    ComboFlat1.Items.Add('Pie');
    ComboFlat1.Items.Add('Donut');
  end
  else
  begin
    ComboFlat1.Items.Add('Fast Line');
    ComboFlat1.Items.Add('Line');
    ComboFlat1.Items.Add('Point');
    ComboFlat1.Items.Add('Area');
    ComboFlat1.Items.Add('Bar');
    ComboFlat1.Items.Add('Horiz. Bar');
    ComboFlat1.Items.Add('Histogram');
    ComboFlat1.Items.Add('Horiz. Line');
    ComboFlat1.Items.Add('Horiz. Area');
    ComboFlat1.Items.Add('Gauge');
    ComboFlat1.Items.Add('Volume');
  end;

  ComboFlat1.ItemIndex:=0;
  ComboFlat1Change(Self);
end;

procedure TMainForm.RadioHistoryClick(Sender: TObject);
begin
  Creating:=True;

  case RadioHistory.ItemIndex of
    0: // All
       ShowControls(False,[Label2,Edit1,UpDown2,Label3,ComboFlat2]);
    1: // Samples
       begin
         ShowControls(True,[Label2,Edit1,UpDown2]);
         ShowControls(False,[Label3,ComboFlat2]);
         UpDown2.Position:=NumSamples;
       end;
    2: // Period
       begin
         ShowControls(True,[Label3,Edit1,UpDown2,ComboFlat2]);
         Label3.Top:=Label2.Top;
         ShowControls(False,[Label2]);
         UpDown2.Position:=NumSamples;
         ComboFlat2.ItemIndex:=TimeUnits;
       end;
  end;

  Creating:=False;
end;

procedure TMainForm.Edit1Change(Sender: TObject);
begin
  if Showing and (not Creating) then
     NumSamples:=UpDown2.Position;
end;

procedure TMainForm.ComboFlat2Change(Sender: TObject);
begin
  if Showing and (not Creating) then
     TimeUnits:=ComboFlat2.ItemIndex;
end;

procedure TMainForm.RadioScrollClick(Sender: TObject);
begin
  case RadioScroll.ItemIndex of
    0: ShowControls(False,[Label4,Label5,Edit2,UpDown3]);
    1: begin
         ShowControls(True,[Label4,Edit2,UpDown3]);
         Label5.Hide;
         UpDown3.Position:=ScrollPercent;
         UpDown3.Max:=100;
       end;
    2: begin
         ShowControls(True,[Label5,Edit2,UpDown3]);
         Label4.Hide;
         UpDown3.Position:=ScrollNum;
         UpDown3.Max:=30000;
         Label5.Top:=Label4.Top;
       end;
  end;
end;

procedure TMainForm.ComboScaleChange(Sender: TObject);
var tmp : Double;
begin
  if Showing and (not Creating) then
  if SelectedCounter<>nil then
  begin
    case ComboScale.ItemIndex of
       0: tmp:=1/1000000;
       1: tmp:=1/100000;
       2: tmp:=1/10000;
       3: tmp:=1/1000;
       4: tmp:=1/100;
       5: tmp:=1/10;
       6: tmp:=1;
       7: tmp:=10;
       8: tmp:=100;
       9: tmp:=1000;
      10: tmp:=10000;
      11: tmp:=100000;
      12: tmp:=1000000;
    else
        tmp:=1;
    end;

    SelectedCounter.Scale:=tmp;
  end;
end;

procedure TMainForm.CBVisibleClick(Sender: TObject);
begin
  SelectedCounter.Series.Visible:=CBVisible.Checked;
end;

end.
