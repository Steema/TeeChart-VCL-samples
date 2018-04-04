unit Tool_CustomLegendSGrid;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QImgList, QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, ImgList,
  Grids,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeCustomLegendTool, Series,
  TeeTools, TeCanvas,
  {$IFDEF D6}
  DateUtils,
  {$ENDIF}
  EditChar;


type
  TTool_CustomLegendSGridForm = class(TBaseForm)
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure DrawCustomLegend();
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
                                  Rect: TRect; State: TGridDrawState);
    procedure ClickTool(Sender:TAnnotationTool; Button:TMouseButton; Shift: TShiftState; X, Y: Integer);
  public
    { Public declarations }

  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{$IFNDEF D6}
function MonthOf(const AValue: TDateTime): Word;
var LYear, LDay: Word;
begin
  DecodeDate(AValue, LYear, Result, LDay);
end;

function Today: TDateTime;
begin
  Result := Date;
end;
{$ENDIF}

var
  CustomLegendTool : TCustomLegendTool;

  jobs  : Array[0..4] of string = ('Builders', 'Electricians', 'Gardeners', 'Mechanical', 'Painters');
  days  : Array[0..3] of string = ('Within 1 Day', 'Within 3 Day', 'Within 7 Day', 'More than 7 Days');
  colors: Array[0..4] of TColor;

procedure TTool_CustomLegendSGridForm.FormCreate(Sender: TObject);
var
  i, j, d: Integer;
begin
  colors[0]:=rgb(226, 108, 10);
  colors[1]:=rgb(49, 133, 157);
  colors[2]:=rgb(118, 147, 57);
  colors[3]:=rgb(149, 54, 52);
  colors[4]:=rgb(128, 128, 128);

  CustomLegendTool := TCustomLegendTool.Create(Chart1);
  DrawCustomLegend();

  for j:=0 to length(jobs)-1 do
    for d:=0 to length(days)-1 do
    begin
      with Chart1.AddSeries(TBarSeries) as TBarSeries do
      begin
        Title:=jobs[j] + ' ' + days[d];
        Color:=ApplyBright(colors[j], 80-(d*20));
        XValues.DateTime:=true;
        BarStyle := bsBevel;

        Active:=((j=1) and (d<2)) or ((j=3) and (d>1));

        for i:=0 to 3 do
          AddXY(IncMonth(MonthOf(Today), i), 30 + random*130);
      end;
    end;

  with Chart1 do
  begin
    Legend.Visible:=false;
    Title.Visible:=false;
    Axes.Bottom.DateTimeFormat:='MMMM';
    Axes.Bottom.LabelStyle:=talPointValue;
    MarginUnits:=muPixels;
    MarginTop:=CustomLegendTool.Height + 20;
  end;

  Chart1.Draw;
  CustomLegendTool.Left := (Chart1.Width div 2) - (CustomLegendTool.Width div 2);
end;


procedure TTool_CustomLegendSGridForm.DrawCustomLegend();
var i: Integer;
begin
  with CustomLegendTool do
  begin
    ParentChart := Chart1;

    AllowDrag:=false;
    AllowResize:=false;

    with Shape do
    begin
      RoundSize := 15;
      Pen.Width:= 2;
      Font.Style := [fsItalic];
      ShapeStyle:=fosRectangle;
    end;

    Grid.OnDrawCell:=StringGrid1DrawCell;
    OnClick:=ClickTool;

    with Grid do
    begin
      ColCount := length(jobs)+1;
      RowCount := length(days)+1;
      for i:=0 to RowCount-1 do
        RowHeights[i] := 20;

      ColWidths[0] := 120;
      for i:=1 to ColCount-1 do
        ColWidths[i] := 80;
    end;

    Height := 105;
    Width := 526;
  end;
end;

procedure TTool_CustomLegendSGridForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  seriesIndex: Integer;
begin
  if (ACol = 0) then
  begin
    if (ARow > 0) then
    begin
      with CustomLegendTool.Grid.Canvas.Font do
      begin
        Name := 'Arial';
        Size := 10;
      end;
      CustomLegendTool.Grid.Canvas.TextRect(Rect, Rect.Left, Rect.Top+1, days[ARow-1]);
    end;
  end
  else
  begin
    if (ARow = 0) then
    begin
      with CustomLegendTool.Grid.Canvas.Font do
      begin
        Name := 'Arial';
        Size := 10;
      end;
      CustomLegendTool.Grid.Canvas.TextRect(Rect, Rect.Left, Rect.Top+3, jobs[ACol-1]);
    end
    else
    begin
      seriesIndex:=(ARow-1) + length(days)*(ACol-1);
      CustomLegendTool.Grid.Canvas.Pen.Style:=psClear;
      CustomLegendTool.Grid.Canvas.Brush.Color:=Chart1[seriesIndex].Color;
      CustomLegendTool.Grid.Canvas.Rectangle(Rect);
      TeeDrawCheckBox(Rect.Left+((Rect.Right-Rect.Left) div 2)-7, rect.Top+3, CustomLegendTool.Grid.Canvas, Chart1[seriesIndex].Active, clWhite);
      CustomLegendTool.Grid.Canvas.Pen.Style:=psSolid;
      CustomLegendTool.Grid.Canvas.Brush.Color:=clNone;
    end;
  end;
end;

type TCustomGridAccess=class(TCustomGrid);

procedure TTool_CustomLegendSGridForm.ClickTool(Sender:TAnnotationTool; Button:TMouseButton; Shift: TShiftState; X, Y: Integer);
var seriesIndex, nCol, nRow, tmpY, tmpX: Integer;
begin
  //CustomLegendTool.Grid.MouseToCell(X, Y, nCol, nRow);
  tmpY:=CustomLegendTool.Top;
  for nRow:=0 to CustomLegendTool.Grid.RowCount-1 do
  begin
    if Y<tmpY+CustomLegendTool.Grid.RowHeights[nRow] then
    begin
      tmpX:=CustomLegendTool.Left;
      for nCol:=0 to CustomLegendTool.Grid.ColCount-1 do
      begin
        if X<tmpX+CustomLegendTool.Grid.ColWidths[nCol] then
        begin
          seriesIndex:=(nRow-1) + length(days)*(nCol-1);
          Chart1[seriesIndex].Active:=not Chart1[seriesIndex].Active;
          exit;
        end
        else
          Inc(tmpX,CustomLegendTool.Grid.ColWidths[nCol]);
      end;
    end
    else
      Inc(tmpY, CustomLegendTool.Grid.RowHeights[nRow]);
  end;
end;

procedure TTool_CustomLegendSGridForm.Button1Click(Sender: TObject);
begin
  inherited;
  EditChart(Self,Chart1);
end;

initialization
  RegisterClass(TTool_CustomLegendSGridForm);
end.
