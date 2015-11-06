unit PrintPreview_Multi;
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
  Base, TeePreviewPanel, TeeProcs, TeEngine, Chart, Series, TeeGDIPlus;

type
  TPrintPreviewMulti = class(TBaseForm)
    TeePreviewPanel1: TTeePreviewPanel;
    Panel2: TPanel;
    FirstChart: TChart;
    SecondChart: TChart;
    Series1: TLineSeries;
    Series2: TPointSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
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

procedure TPrintPreviewMulti.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
  Series2.FillSampleValues(8);

  { change margins }
  FirstChart.PrintProportional:=False;
  SecondChart.PrintProportional:=False;

  FirstChart.PrintMargins:=Rect(2,2,60,60);
  SecondChart.PrintMargins:=Rect(60,60,2,2);

  { add to preview }
  TeePreviewPanel1.Panels.Add(FirstChart);
  TeePreviewPanel1.Panels.Add(SecondChart);

end;

procedure TPrintPreviewMulti.CheckBox1Click(Sender: TObject);
begin
  With TeePreviewPanel1 do
  begin
    Panels.Clear;
    if CheckBox1.Checked then Panels.Add(FirstChart);
    if CheckBox2.Checked then Panels.Add(SecondChart);
    Repaint;
  end;
end;

procedure TPrintPreviewMulti.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then
     TeePreviewPanel1.Orientation:=ppoLandscape
  else
     TeePreviewPanel1.Orientation:=ppoPortrait;
end;

procedure TPrintPreviewMulti.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TPrintPreviewMulti);
end.
