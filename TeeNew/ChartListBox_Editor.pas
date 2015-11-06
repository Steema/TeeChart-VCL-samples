unit ChartListBox_Editor;
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
  ChartListBox_Radio, TeeLisB, Series, TeEngine, TeeProcs, Chart;

type
  TChartListBoxEditor = class(TChartListBoxRadio)
    CBEditor: TCheckBox;
    procedure CBEditorClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
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

procedure TChartListBoxEditor.CBEditorClick(Sender: TObject);
begin
  if CBEditor.Checked then ChartListBox1.ShowEditor
                      else ChartListBox1.HideEditor;
end;

procedure TChartListBoxEditor.Chart1AfterDraw(Sender: TObject);
var wasFalse: Boolean;
begin
  inherited;
  wasFalse:=not ChartListBox1.Visible;
  if wasFalse then
  begin
    ChartListBox1.Visible:=true;
    Chart1.Repaint;
  end;
end;

procedure TChartListBoxEditor.FormCreate(Sender: TObject);
begin
  Self.ChartListBox1.Visible:=false;
  //inherited;
  Chart1.SeriesList.FillSampleValues();
  Chart1.Draw;
end;


initialization
  RegisterClass(TChartListBoxEditor);
end.
