unit Export_HTML;
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
  TExportHTMLForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
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

procedure TExportHTMLForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
   { nil = all series in Chart1 }
    with TSeriesDataHTML.Create(Chart1,nil) do
    try
      IncludeIndex:=CheckBox1.Checked;
      IncludeHeader:=CheckBox2.Checked;

      SaveToFile(SaveDialog1.FileName);
      ShowSavedFile;
    finally
      Free;
    end;
  end;
end;

procedure TExportHTMLForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1)
end;

procedure TExportHTMLForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(6);
end;

Procedure TExportHTMLForm.ShowSavedFile;
begin
  TeeGoToURL(Handle,SaveDialog1.FileName);
end;

initialization
  RegisterClass(TExportHTMLForm);
end.
