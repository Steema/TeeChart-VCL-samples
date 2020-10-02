unit Surface_HideCells;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeSurfa, TeeTools,
  TeeGDIPlus;

type
  TSurfaceHideCells = class(TBaseForm)
    cbHideCells: TCheckBox;
    Series1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    procedure cbHideCellsClick(Sender: TObject);
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

procedure TSurfaceHideCells.cbHideCellsClick(Sender: TObject);
begin
  Series1.HideCells:=cbHideCells.Checked;
end;

initialization
  RegisterClass(TSurfaceHideCells);
end.
