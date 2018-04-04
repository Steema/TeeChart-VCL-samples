unit Tool_CustomLegend;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeCustomLegendTool, Series;


type
  TTool_CustomLegendForm = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    ImageList1: TImageList;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure DrawCustomLegend();
  private
    { Private declarations }

    procedure StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
                                  Rect: TRect; State: TGridDrawState);
  public
    { Public declarations }
    CustomLegendTool : TCustomLegendTool;
    Bar1 : TBarSeries;
    Bar2 : TBarSeries;
    Bar3 : TBarSeries;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeThemes, Math, TeeTools, EditChar;

var
    y1 : Array[0..4] of TChartValue = (40,80,50,90,45);
    y2 : Array[0..4] of TChartValue = (70,40,65,85,55);
    y3 : Array[0..4] of TChartValue = (60,50,100,50,80);

procedure TTool_CustomLegendForm.DrawCustomLegend();
begin
  with CustomLegendTool do
  begin
    ParentChart := Chart1;

    with Shape do
    begin
      RoundSize := 15;
      Pen.Width:= 2;
      Font.Style := [fsItalic];
      ShapeStyle:=fosRoundRectangle
    end;

    Grid.OnDrawCell := StringGrid1DrawCell;

    If ComboBox1.ItemIndex = 0 then
    begin
      with Grid do
      begin
        ColCount := 6;
        RowCount := 3;
        RowHeights[0] := 30;
        RowHeights[1] := 30;
        RowHeights[2] := 30;
        ColWidths[1] := 70;
        Height := 95;
        Width := 390;
      end;
    end
    else
    begin
      with Grid do
      begin
        ColCount := 2;
        RowCount := 3;
        RowHeights[0] := 30;
        RowHeights[1] := 30;
        RowHeights[2] := 30;
        ColWidths[0] := 35;
        ColWidths[1] := 190;
        Height := 95;
        Width := 250;
        Shape.Width := 270;
      end;
    end;
  end;
end;

procedure TTool_CustomLegendForm.FormCreate(Sender: TObject);
var
  i  : Integer;
begin
  inherited;
  ComboBox1.ItemIndex:=0;
  ApplyChartTheme(TBlackIsBackTheme,TCustomChart(Chart1));

  // Create the Custom Legend Tool
  CustomLegendTool := TCustomLegendTool.Create(Chart1);

  DrawCustomLegend();

  // Create the Series
  Bar1 := TBarSeries.Create(Chart1);
  Bar2 := TBarSeries.Create(Chart1);
  Bar3 := TBarSeries.Create(Chart1);

  Bar1.Color := RGB(250,181,86);
  Bar2.Color := RGB(152,196,238);
  Bar3.Color := RGB(128,200,126);

  // Add Series to the Chart and set some settings
  with Chart1 do
  begin
    AddSeries(Bar1);
    AddSeries(Bar2);
    AddSeries(Bar3);
    Legend.Visible:=false;
    Title.Visible:=false;
    View3D:=false;
    MarginTop := CustomLegendTool.Height-5;
  end;

  for i:=0 to Chart1.SeriesCount-1 do
  with Chart1[i] do
  begin
    ParentChart:=Chart1;
    Marks.Transparent:=True;
    Marks.Angle:=90;
    Marks.Arrow.Visible := false;
    Marks.Font.Color := clBlack;
    Marks.ArrowLength := -30;
    with (Chart1[i] as TBarSeries) do
    begin
      BarWidthPercent:=90;
      BarStyle := bsBevel;
      Pen.Visible:=false;
    end;
  end;

  Bar1.AddArray(y1);
  Bar2.AddArray(y2);
  Bar3.AddArray(y3);

  Chart1.Draw;
  CustomLegendTool.Left := (Chart1.Width div 2) - (CustomLegendTool.Width div 2);
  CustomLegendTool.Shape.Font.Color := clBlue;
  CustomLegendTool.Shape.Text := chr(13)+chr(13)+chr(13)+chr(13)+chr(13)+chr(13)+
    chr(13)+chr(13)+ ' Text if desired !!!!';
  CustomLegendTool.Height := 100;
  CustomLegendTool.Width := 400;
end;

procedure TTool_CustomLegendForm.StringGrid1DrawCell(Sender: TObject; ACol, ARow: Integer;
  Rect: TRect; State: TGridDrawState);
var
  I, J: Integer;
  Data: array[1..5,0..3] of String;
  ABitmap: TBitmap;
  FixRect, TopRect, BotRect: TRect;
  BmpWidth: Integer;
begin
  if ComboBox1.ItemIndex=0 then
  begin
  //add some data
  for I := 1 to 5 do
    for J := 0 to 2 do
      Data[I,J] := Format('%0:3d', [round(Chart1[J].YValue[I-1])]);

  if (ACol = 0) then
  begin
    //draw the bitmap
    FixRect := Rect;
    ABitmap := TBitmap.Create;
    try
      //  ABitmap.LoadFromFile('BitmapGreen.bmp'); use for a single image
      ImageList1.GetBitmap(ARow, ABitmap);       //different images
      BmpWidth := (Rect.Bottom - Rect.Top);
      FixRect.Right := Rect.Left + BmpWidth;
      CustomLegendTool.Grid.Canvas.StretchDraw(FixRect, ABitmap);
    finally
      ABitmap.Free;
    end;
  end
  else
  begin
    //output the text
    TopRect := Rect;
    TopRect.Bottom := TopRect.Top+(TopRect.Bottom-TopRect.Top) div 2;
    BotRect := Rect;
    BotRect.Top := TopRect.Bottom;

    with CustomLegendTool.Grid.Canvas.Font do
    begin
      Name := 'Arial';
      Size := 8;
      Style := [fsItalic];
      Color := clBlue;
    end;
    CustomLegendTool.Grid.Canvas.TextRect(TopRect, TopRect.Left+35, TopRect.Top+2, 'value is:');

    with CustomLegendTool.Grid.Canvas.Font do
    begin
      Name := 'Arial';
      Size := 12;
      Style := [fsBold];
      Color := clBlue;
    end;
    CustomLegendTool.Grid.Canvas.TextRect(BotRect, BotRect.Left+25, BotRect.Top-1, Data[ACol,ARow]);
  end;
  end
  else begin

  //add some data text
  Data[1,0] := 'My custom Text 1';
  Data[1,1] := 'My custom Text 2';
  Data[1,2] := 'My custom Text 3';

  if (ACol = 0) then
  begin
    //draw the bitmap
    FixRect := Rect;
    ABitmap := TBitmap.Create;
    try
      //  ABitmap.LoadFromFile('BitmapGreen.bmp'); use for a single image
      ImageList1.GetBitmap(ARow, ABitmap);       //different images
      BmpWidth := (Rect.Bottom - Rect.Top);
      FixRect.Right := Rect.Left + BmpWidth;
      CustomLegendTool.Grid.Canvas.StretchDraw(FixRect, ABitmap);
    finally
      ABitmap.Free;
    end;
  end
  else
  begin
    //output the text
    TopRect := Rect;
    TopRect.Bottom := TopRect.Top+(TopRect.Bottom-TopRect.Top) div 2;
    BotRect := Rect;
    BotRect.Top := TopRect.Top ;

    with CustomLegendTool.Grid.Canvas.Font do
    begin
      Name := 'Arial';
      Size := 8;
      Style := [fsItalic];
      Color := clBlue;
    end;
//    CustomLegendTool.Grid.Canvas.TextRect(TopRect, TopRect.Left+5, TopRect.Top+2, 'value is:');

    with CustomLegendTool.Grid.Canvas.Font do
    begin
      Name := 'Arial';
      Size := 12;
      Style := [fsBold];
      Color := clBlue;
    end;
    CustomLegendTool.Grid.Canvas.TextRect(BotRect, BotRect.Left+70, BotRect.Top + 10, Data[ACol,ARow]);
  end;

  end;
end;

procedure TTool_CustomLegendForm.ComboBox1Change(Sender: TObject);
begin
  DrawCustomLegend();
end;

procedure TTool_CustomLegendForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,CustomLegendTool);
end;

initialization
  RegisterClass(TTool_CustomLegendForm);
end.
