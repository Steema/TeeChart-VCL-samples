unit Export_PCX;
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
  Base, TeEngine, Series, TeePolar, TeeProcs, Chart;

type
  TPCXExportForm = class(TBaseForm)
    Series1: TRadarSeries;
    Button1: TButton;
    Button2: TButton;
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

Uses TeExport, TeePCX;  { <-- Important !! }

procedure TPCXExportForm.Button1Click(Sender: TObject);
begin
  TeeSavePanel(TPCXExportFormat,Chart1);
end;

procedure TPCXExportForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TPCXExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
end;

initialization
  RegisterClass(TPCXExportForm);
end.
