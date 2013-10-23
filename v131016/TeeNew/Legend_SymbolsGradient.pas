unit Legend_SymbolsGradient;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeEdiGrad, TeeSurfa;

type
  TLegendSymbolsGradientForm = class(TBaseForm)
    cbVisible: TCheckBox;
    bGradient: TButtonGradient;
    Series1: TSurfaceSeries;
    procedure FormCreate(Sender: TObject);
    procedure cbVisibleClick(Sender: TObject);
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

procedure TLegendSymbolsGradientForm.FormCreate(Sender: TObject);
begin
  inherited;
  bGradient.LinkGradient(Chart1.Legend.Symbol.Gradient);
end;

procedure TLegendSymbolsGradientForm.cbVisibleClick(Sender: TObject);
begin
  Chart1.Legend.Symbol.Gradient.Visible:=cbVisible.Checked;
end;

initialization
  RegisterClass(TLegendSymbolsGradientForm);
end.
 
