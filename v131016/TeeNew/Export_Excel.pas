unit Export_Excel;
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
  TExportExcelForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    Series4: TBarSeries;
    SaveDialog1: TSaveDialog;
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

procedure TExportExcelForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
   { nil = all series in Chart1 }
    with TSeriesDataXLS.Create(Chart1,nil) do
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

procedure TExportExcelForm.Button2Click(Sender: TObject);
begin
  TeeExport(Self,Chart1)
end;

procedure TExportExcelForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(6);
end;

Procedure TExportExcelForm.ShowSavedFile;
begin
  TeeGotoURL(Handle,SaveDialog1.FileName);
end;

initialization
  RegisterClass(TExportExcelForm);
end.
