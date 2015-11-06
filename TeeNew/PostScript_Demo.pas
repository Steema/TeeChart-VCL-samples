unit PostScript_Demo;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeePSCanvas;

type
  TPostScriptForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    Button1: TButton;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
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

procedure TPostScriptForm.Button1Click(Sender: TObject);
begin
  if SaveDialog1.Execute then
  with TEPSExportFormat.Create do
  try
    Panel := Chart1;
    SaveToFile(SaveDialog1.FileName);
  finally
    Free;
  end;
end;

procedure TPostScriptForm.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.Color:=clWhite;
  Chart1.BevelInner:=bvNone;
  Chart1.BevelOuter:=bvNone;

  Chart1.SeriesList.FillSampleValues;
end;

initialization
  RegisterClass(TPostScriptForm);
end.
