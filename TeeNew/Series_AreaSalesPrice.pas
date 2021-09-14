unit Series_AreaSalesPrice;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeComma,
  TeeDataTableTool;

type
  TAreaSalesPrice = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    ChartTool1: TAnnotationTool;
    ChartTool2: TAnnotationTool;
    Series1: TAreaSeries;
    procedure FormCreate(Sender: TObject);
    procedure Series1GetMarkText(Sender: TChartSeries; ValueIndex: Integer;
      var MarkText: String);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
  private
    { Private declarations }
    Average : TLineSeries;
    procedure AddCustomLabels;
    procedure SetCustomMarksPosition;
    procedure SetUpAnnotations;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeFunci;

var
  Console: array [0..5] of String = ('PlayStation 2', 'Nintendo DS', 'Game Boy', 'PlayStation 4', 'PlayStation', 'Wii');
  Units: array [0..5] of Double = (157.68, 154.9, 118.69, 115.56, 102.5, 101.64);
  Price: array [0..5] of Double = (457, 208, 190, 447, 513, 324);

procedure TAreaSalesPrice.AddCustomLabels;
var i: Integer;
    value: double;
begin
  Chart1.Axes.Bottom.Items.Clear;

  for i:=0 to Series1.Count-2 do
  begin
    value:=Series1.XValue[i] + ((Series1.XValue[i+1] - Series1.XValue[i]) / 2);
    with (Chart1.Axes.Bottom.Items.Add(value, Console[i]+sLineBreak+'('+FormatFloat('#,##0.##',Units[i])+')')) do
    begin
      Format.TextAlignment:=taCenter;
      Format.Font.Assign(Chart1.Axes.Bottom.LabelsFont);
      Format.Font.Style:=[fsBold];
    end;
  end;
end;

procedure TAreaSalesPrice.FormCreate(Sender: TObject);
var i           : Integer;
    tmp         : Double;
begin
  inherited;

  Series1.Stairs:=true;
  Series1.ColorEachPoint:=true;
  Series1.Marks.Visible:=true;
  Series1.Marks.Style:=smsValue;
  Series1.Marks.Transparent:=True;
  Series1.Marks.Font.Style:=[fsBold];

  tmp:=0;

  for i:=0 to High(Console) do
  begin
    Series1.AddXY(tmp, Price[i], Console[i]);
    tmp:=tmp + Units[i];
  end;

  Average:=TLineSeries.Create(Self);
  Average.Color:=clBlack;
  Chart1.AddSeries(Average);
  Average.SetFunction(TAverageTeeFunction.Create(Self));
  Average.DataSource:=Series1;

  //A "dummy" point is necessary to plot last area
  Series1.AddXY(tmp, Price[High(Price)]);
  Average.XValue[Average.Count-1]:=tmp;

  Chart1.Axes.Left.SetMinMax(0, 600);
  Chart1.Axes.Left.Increment:=50;
  Chart1.Axes.Left.Title.Font.Style:=[fsBold];
  Chart1.Axes.Left.Title.Caption:='Price adjusted to inflation (in $)';
  Chart1.Axes.Left.Title.Position:=tpStart;

  Chart1.Axes.Bottom.Grid.Visible:=false;
  Chart1.Axes.Bottom.Title.Font.Style:=[fsBold];
  Chart1.Axes.Bottom.Title.Caption:='Units sold per console (in millions)';
  Chart1.Axes.Bottom.Title.Position:=tpStart;
  Chart1.Axes.Bottom.LabelsSize:=45;
  Chart1.Axes.Bottom.LabelsFormat.TextAlignment:=taCenter;

  Chart1.Legend.Visible:=false;

  With ChartTool1 do
  begin
    Text:='Total = ' + FormatFloat('#,###,##0',Series1.MaxXValue) + ' milions of consoles sold';
    Shape.Font.Style:=[fsBold];
    Shape.Transparent:=true;
  end;

  With ChartTool2 do
  begin
    Text:='Average price $' + FormatFloat('#,##0.##', Average.MaxYValue);
    Shape.Font.Style:=[fsBold];
    Shape.Font.Color:=clRed;
    Shape.Transparent:=true;
  end;

  AddCustomLabels;
end;

procedure TAreaSalesPrice.Series1GetMarkText(Sender: TChartSeries;
  ValueIndex: Integer; var MarkText: String);
begin
  inherited;

  if ValueIndex<Series1.Count-1 then
     MarkText:='$'+MarkText
  else
     MarkText:=''; //"Dummy" point mark removed
end;

procedure TAreaSalesPrice.Chart1AfterDraw(Sender: TObject);
begin
  inherited;
  SetCustomMarksPosition;
  SetUpAnnotations;
end;

procedure TAreaSalesPrice.SetCustomMarksPosition;
var i   : Integer;
    tmp : Double;
begin
  for i:=0 to Series1.Marks.Positions.Count-1 do
  begin
    With Series1.Marks.Positions.Position[i] do
    Begin
      Custom:=True;
      tmp:=Series1.XValue[i] + ((Series1.XValue[i+1] - Series1.XValue[i]) / 2);
      LeftTop.X:=Chart1.Axes.Bottom.CalcXPosValue(tmp) - (Width div 2);
      LeftTop.Y:=Series1.CalcYPos(i) - 25;
    end;
  end;

  Series1.Marks.Arrow.Visible:=False;
  Series1.Repaint;
end;

procedure TAreaSalesPrice.FormResize(Sender: TObject);
begin
  inherited;
  Chart1.TeeCreateBitmap; //Necessary so that marks have valid positions
end;

procedure TAreaSalesPrice.Chart1UndoZoom(Sender: TObject);
begin
  inherited;
  Chart1.Draw; //Necessary so that marks have valid positions
end;

procedure TAreaSalesPrice.Chart1Zoom(Sender: TObject);
begin
  inherited;
  Chart1.Draw; //Necessary so that marks have valid positions
end;

procedure TAreaSalesPrice.SetUpAnnotations;
begin
  With ChartTool1 do
  begin
    Shape.CustomPosition:=true;
    Shape.Left:=Series1.CalcXPos(Series1.Count-1) - Shape.Width;
    Shape.Top:=Chart1.ChartRect.Top + 20;
  end;

  With ChartTool2 do
  begin
    Shape.CustomPosition:=true;
    Shape.Left:=Series1.CalcXPos(Series1.Count-1) - Shape.Width;
    Shape.Top:=Average.CalcYPos(0) - 15;
  end;
end;

initialization
  RegisterClass(TAreaSalesPrice);
end.
