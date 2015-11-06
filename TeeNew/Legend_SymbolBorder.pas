unit Legend_SymbolBorder;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeCanvas, TeePenDlg, TeeProcs, Chart;

type
  TLegendSymbolBorder = class(TBaseForm)
    CheckBox1: TCheckBox;
    ButtonPen1: TButtonPen;
    Series1: TBarSeries;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TLegendSymbolBorder.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;

  // Do not use series border to display legend symbols:
  with Chart1.Legend.Symbol do
  begin
    DefaultPen:=False;

    // Customize border:
    Pen.Color:=clRed;
    Pen.Width:=2;
    Pen.EndStyle:=esFlat;
  end;

  ButtonPen1.LinkPen(Chart1.Legend.Symbol.Pen);
end;

procedure TLegendSymbolBorder.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.Symbol.DefaultPen:=CheckBox1.Checked;
  ButtonPen1.Enabled:=not CheckBox1.Checked;
end;

procedure TLegendSymbolBorder.CheckBox2Click(Sender: TObject);
begin
  Chart1.Legend.Symbol.Squared:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TLegendSymbolBorder);
end.
