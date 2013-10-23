unit Export_GIF;
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
  Base, TeEngine, Series, GanttCh, TeeProcs, Chart, BubbleCh;

type
  TGIFExportForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Series1: TBubbleSeries;
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

Uses TeeGIF, TeExport;

procedure TGIFExportForm.Button1Click(Sender: TObject);
begin
  TeeSavePanel(TGIFExportFormat,Chart1);
end;

procedure TGIFExportForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1);
end;

procedure TGIFExportForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
end;

initialization
  RegisterClass(TGIFExportForm);
end.
