unit Export_XML;
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
  TExportXMLForm = class(TBaseForm)
    Button1: TButton;
    CheckBox1: TCheckBox;
    Button2: TButton;
    SaveDialog1: TSaveDialog;
    Series1: TPointSeries;
    Series2: TPointSeries;
    Series3: TPointSeries;
    Series4: TPointSeries;
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

procedure TExportXMLForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1)
end;

procedure TExportXMLForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(6);
end;

Procedure TExportXMLForm.ShowSavedFile;
begin
  TeeGoToURL(Handle,SaveDialog1.FileName);
end;

procedure TExportXMLForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
   { nil = all series in Chart1 }
    with TSeriesDataXML.Create(Chart1,nil) do
    try
      IncludeIndex:=CheckBox1.Checked;

      SaveToFile(SaveDialog1.FileName);
      ShowSavedFile;
    finally
      Free;
    end;
  end;
end;

initialization
  RegisterClass(TExportXMLForm);
end.
