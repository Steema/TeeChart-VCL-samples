unit TeeDataSubset;
{$I TeeDefs.inc}

interface

uses Classes, TeEngine;

// Notes: This is work "under construction".

// TDataSubset is a class that automatically loads a portion of big data
// quantities into a Series, and allows scrolling, zooming, etc.

// This class is abstract. You need first to set the following properties:

// 1) The Series:   SubData.Series := Series1;
// 2) The "window size" (amount of points in-memory): SubData.WindowSize:=100;
// 3) The event to supply the "Total" count:  SubData.TotalItems:=MyTotal;
// 4) The event to supply on-demand data: SubData.NeedData:=MyNeedData;
//    or (for better speed in many cases), the SubData.NeedManyData event.


// Then you can call the ScrollPoints or LoadAllPage methods to navigate
// (scroll) the very-big "total" amount of data.

// One real-life case is to use this class with a flat file (like the
// demo shows), with the NeedData event doing seeks, reads on the file.

type
  TGetTotalItems=procedure(Var TotalItems:Integer) of object;
  TGetItem=procedure(Index:Integer; Var Value:TChartValue) of object;
  TGetMultipleItems=procedure(Index,Count:Integer; var Data:TChartValues) of object;

  TDataSubset=class(TComponent)
  private
    FTotalItems:TGetTotalItems;
    FSeries : TChartSeries;
    FWindowSize: Integer;
    FNeedData: TGetItem;
    FNeedManyData: TGetMultipleItems;

    procedure GetData(Index,Count:Integer; Decrease:Boolean=False);
    function GetTotalItems:Integer;
    procedure SetSeries(const Value: TChartSeries);
    function ValueIndexes:TChartValueList;
  public
    function FirstIndex:Integer;
    procedure GoToFirstPage;
    procedure GoToIndex(Index:Integer);
    procedure LoadAllPage(Index:Integer);
    procedure NextPage;
    procedure PreviousPage;
    procedure ReloadPage;
    procedure ScrollPoints(IndexCount:Integer);
  published
    property Series:TChartSeries read FSeries write SetSeries;
    property WindowSize:Integer read FWindowSize write FWindowSize default 100;

    property OnNeedData:TGetItem read FNeedData write FNeedData;
    property OnNeedManyData:TGetMultipleItems read FNeedManyData write FNeedManyData;
    property OnTotalItems:TGetTotalItems read FTotalItems write FTotalItems;
  end;

implementation

uses
  Math;
  
{ TDataSubset }

function TDataSubset.GetTotalItems:Integer;
begin
  if Assigned(FTotalItems) then
     FTotalItems(result)
  else
     result:=0;
end;

procedure TDataSubset.NextPage;
var Index : Integer;
begin
  Index:=FirstIndex;
  if Index<GetTotalItems-WindowSize then
     Index:=Index+WindowSize
  else
     Index:=GetTotalItems;

  LoadAllPage(Index);
end;

procedure TDataSubset.PreviousPage;
var Index : Integer;
begin
  Index:=FirstIndex;
  if Index>WindowSize then
     Index:=Index-WindowSize
  else
     Index:=0;

  LoadAllPage(Index);
end;

procedure TDataSubset.SetSeries(const Value: TChartSeries);
begin
  FSeries := Value;
end;

procedure TDataSubset.LoadAllPage(Index:Integer);
var tmpEnd : Integer;
begin
  if Index>=0 then
  begin
    Series.BeginUpdate;
    try
      Series.Clear;

      tmpEnd:=Index+WindowSize;
      if tmpEnd>GetTotalItems then
      begin
        Index:=GetTotalItems-WindowSize;
        tmpEnd:=GetTotalItems;
      end;

      GetData(Index,tmpEnd-Index);
    finally
      Series.EndUpdate;
    end;
  end;
end;

procedure TDataSubset.GetData(Index,Count:Integer; Decrease:Boolean=False);
var tmpData : TChartValues;
    t       : Integer;
    tmp     : Integer;
    tmpValue : TChartValue;
begin
  if Assigned(FNeedManyData) then
  begin
    SetLength(tmpData,Count);
    try
      if Decrease then tmp:=Index-Count+1 else tmp:=Index;

      OnNeedManyData(tmp,Count,tmpData);

      for t:=0 to Count-1 do
      begin
        if Decrease then tmp:=Index-t else tmp:=t+Index;

        if Series.YMandatory then Series.AddXY(tmp,tmpData[t])
                             else Series.AddXY(tmpData[t],tmp);
      end;
    finally
      tmpData:=nil;
    end;
  end
  else
  if Assigned(FNeedData) then
  for t:=0 to Count-1 do
  begin
    if Decrease then tmp:=Index-t else tmp:=t+Index;

    OnNeedData(tmp,tmpValue);
    if Series.YMandatory then Series.AddXY(tmp,tmpValue)
                         else Series.AddXY(tmpValue,tmp)
  end;
end;

function TDataSubset.ValueIndexes:TChartValueList;
begin
  if Series.YMandatory then result:=Series.XValues
                       else result:=Series.YValues;
end;

procedure TDataSubset.ScrollPoints(IndexCount:Integer);
var Index : Integer;
begin
  Series.BeginUpdate;
  try
    if IndexCount<0 then
    begin
      Index:=FirstIndex-1;

      if Index>=0 then
      begin
        if Index-IndexCount<0 then IndexCount:=Index else IndexCount:=-IndexCount;

        if IndexCount>0 then
        begin
          Series.Delete(Series.Count-IndexCount,IndexCount);
          GetData(Index,IndexCount,True);
        end;
      end;
    end
    else
    begin
      Index:=Round(ValueIndexes.Last+1);
      if Index+IndexCount>GetTotalItems then IndexCount:=GetTotalItems-Index;

      if IndexCount>0 then
      begin
        Series.Delete(0,Math.Min(Series.Count,IndexCount));
        GetData(Index,IndexCount);
      end;
    end;
  finally
    Series.EndUpdate;
  end;
end;

procedure TDataSubset.GoToIndex(Index:Integer);
var tmpIndex : Integer;
begin
  tmpIndex:=Index-(WindowSize div 2);
  if tmpIndex<0 then tmpIndex:=0;

  LoadAllPage(tmpIndex);
end;

function TDataSubset.FirstIndex:Integer;
begin
  result:=Round(ValueIndexes.First);
end;

procedure TDataSubset.ReloadPage;
begin
  LoadAllPage(FirstIndex);
end;

procedure TDataSubset.GoToFirstPage;
begin
  LoadAllPage(0);
end;

end.
