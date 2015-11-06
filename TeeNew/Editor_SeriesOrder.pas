unit Editor_SeriesOrder;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeEdit;

type
  TEditorSeriesOrder = class(TBaseForm)
    bEdit: TButton;
    Series1: TLineSeries;
    ChartEditor1: TChartEditor;
    procedure bEditClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorSeriesOrder: TEditorSeriesOrder;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TEditorSeriesOrder.bEditClick(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

initialization
  RegisterClass(TEditorSeriesOrder);
end.
