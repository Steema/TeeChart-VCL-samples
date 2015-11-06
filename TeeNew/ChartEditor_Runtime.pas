unit ChartEditor_Runtime;
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
  Base, TeEngine, Series, TeeEdit, TeeProcs, Chart;

type
  TChartEditorRuntime = class(TBaseForm)
    ChartEditor1: TChartEditor;
    Button1: TButton;
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
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

procedure TChartEditorRuntime.Button1Click(Sender: TObject);
begin
  ChartEditor1.RememberPosition:=CheckBox1.Checked;
  ChartEditor1.HighLightTabs:=CheckBox2.Checked;

  ChartEditor1.Execute;
end;

procedure TChartEditorRuntime.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

initialization
  RegisterClass(TChartEditorRuntime);
end.
