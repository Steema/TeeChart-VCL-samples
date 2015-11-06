unit Legend_FontColor;
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
  Base, TeeProcs, TeEngine, Chart, Series;

type
  TLegendFontColor = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TPointSeries;
    CheckBox2: TCheckBox;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Series4: TPointSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TLegendFontColor.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.FontSeriesColor:=CheckBox1.Checked;

  With Chart1.Legend.Font.Shadow do
       if CheckBox1.Checked then Color:=clBlack else Color:=clWhite;
end;

procedure TLegendFontColor.CheckBox2Click(Sender: TObject);
begin
  inherited;
  Series2.Active:=CheckBox2.Checked;
  Series3.Active:=CheckBox2.Checked;
  Series4.Active:=CheckBox2.Checked;

  Series1.ColorEachPoint:=not CheckBox2.Checked;
end;

procedure TLegendFontColor.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(10);
end;

initialization
  RegisterClass(TLegendFontColor);
end.
