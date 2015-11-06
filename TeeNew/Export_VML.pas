unit Export_VML;
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
  TExportVMLForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    Procedure ShowSavedFile;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeVMLCanvas, TeExport;

procedure TExportVMLForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    With TVMLExportFormat.Create do
    try
      Panel:=Chart1;
      SaveToFile(SaveDialog1.FileName);
      ShowSavedFile;
    finally
      Free;
    end;
  end;
end;

procedure TExportVMLForm.Button2Click(Sender: TObject);
begin
  {$IFNDEF D7}
  TeeExport(Self,Chart1)
  {$ENDIF}
end;

procedure TExportVMLForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(6);
end;

Procedure TExportVMLForm.ShowSavedFile;
begin
  TeeGoToURL(Handle,SaveDialog1.FileName);
end;

initialization
  RegisterClass(TExportVMLForm);
end.
