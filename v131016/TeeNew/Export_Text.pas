unit Export_Text;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TExportTextForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button1: TButton;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    CheckBox1: TCheckBox;
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

Uses TeeStore, TeExport;

procedure TExportTextForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
   { nil = all series in Chart1 }
    with TSeriesDataText.Create(Chart1,nil) do
    try
      TextDelimiter:=',' ;  { try also: TeeTabDelimiter }
      IncludeIndex:=CheckBox1.Checked;

      SaveToFile(SaveDialog1.FileName);
      ShowSavedFile;
    finally
      Free;
    end;
  end;
end;

procedure TExportTextForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1)
end;

procedure TExportTextForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(10);
end;

Procedure TExportTextForm.ShowSavedFile;
begin
  TeeGoToURL(Handle,SaveDialog1.FileName);
end;

initialization
  RegisterClass(TExportTextForm);
end.
