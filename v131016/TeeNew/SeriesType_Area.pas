unit SeriesType_Area;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeCanvas;

type
  TAreaSeriesForm = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    Series1: TAreaSeries;
    Series3: TAreaSeries;
    Series2: TAreaSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TAreaSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.MultiArea:=maNone;
    1: Series1.MultiArea:=maStacked;
    2: Series1.MultiArea:=maStacked100;
  end;

  { remove "Marks" when stacking... }
  Series1.Marks.Visible:=Series1.MultiArea=maNone;
  Series2.Marks.Visible:=Series2.MultiArea=maNone;
  Series3.Marks.Visible:=Series3.MultiArea=maNone;
end;

procedure TAreaSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TAreaSeriesForm.FormCreate(Sender: TObject);
var i: Integer;

  Function ApplyDark(Color:TColor; HowMuch:Byte):TColor;
  Var r : Byte;
      g : Byte;
      b : Byte;
  Begin
    Color:=ColorToRGB(Color);
    r:=Byte(Color);
    g:=Byte(Color shr 8);
    b:=Byte(Color shr 16);

    if r>HowMuch then Dec(r,HowMuch) else r:=0;
    if g>HowMuch then Dec(g,HowMuch) else g:=0;
    if b>HowMuch then Dec(b,HowMuch) else b:=0;

    result := (r or (g shl 8) or (b shl 16)
              {$IFDEF FMX}or (Byte(Color shr 24) shl 24){$ENDIF});
  end;

begin
  inherited;

  for i:=0 to 2 do
  Begin
    TAreaSeries(Chart1.SeriesList[i]).AreaChartBrush.Gradient.Direction := gdBottomTop;
    TAreaSeries(Chart1.SeriesList[i]).AreaChartBrush.Gradient.EndColor := Chart1.SeriesList[i].Color;
    TAreaSeries(Chart1.SeriesList[i]).Pen.Color := ApplyDark(Chart1.SeriesList[i].Color, 40);
    TAreaSeries(Chart1.SeriesList[i]).AreaLinesPen.Color := TAreaSeries(Chart1.SeriesList[i]).Pen.Color;
  end;

  for i:=0 to 6 do
  Begin
    Series1.Add(Random(50));
    Series2.Add(40+Random(50));
    Series3.Add(70+Random(50));
  end;
end;

procedure TAreaSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

procedure TAreaSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Stairs:=CheckBox1.Checked;
  Series2.Stairs:=CheckBox1.Checked;
  Series3.Stairs:=CheckBox1.Checked;
end;

procedure TAreaSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TAreaSeriesForm);
end.
