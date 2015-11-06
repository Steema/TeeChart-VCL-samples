unit Commander_CustomEditor;
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
  Base, TeeEdit, TeeComma,  TeeProcs, TeEngine, Chart, TeeEditCha;

type
  TCommanderCustomEditor = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    ChartEditor1: TChartEditor;
    ChartPreviewer1: TChartPreviewer;
    procedure FormCreate(Sender: TObject);
    procedure ChartEditor1Show(Sender: TObject);
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

procedure TCommanderCustomEditor.FormCreate(Sender: TObject);
begin
  inherited;

  // This can be done at design-time.
  // This code is how to do it programatically

  TeeCommander1.Panel := Chart1;
  TeeCommander1.ChartEditor := ChartEditor1;
  TeeCommander1.Previewer := ChartPreviewer1;

  ChartEditor1.Chart := Chart1;
  ChartPreviewer1.Chart := Chart1;
end;

procedure TCommanderCustomEditor.ChartEditor1Show(Sender: TObject);
begin
  // Force "Tree" editor mode at editor OnShow event
  (Sender as TChartEditForm).Tree.Visible:=True;
end;

initialization
  RegisterClass(TCommanderCustomEditor);
end.
