unit Export_PNG;
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
  Base, TeEngine, Series, GanttCh, TeeProcs, Chart;

type
  TPNGExportForm = class(TBaseForm)
    Button1: TButton;
    Series1: TGanttSeries;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

Uses TeePNG, TeExport;

procedure TPNGExportForm.Button1Click(Sender: TObject);
begin
  TeeSavePanel(TPNGExportFormat,Chart1);
end;

procedure TPNGExportForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TPNGExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
end;

initialization
  RegisterClass(TPNGExportForm);
end.
