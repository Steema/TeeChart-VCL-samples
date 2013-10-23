unit Preview_CustomDraw;
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
  Base, TeePreviewPanel, TeeProcs, TeEngine, Chart;

type
  TPreviewCustomDraw = class(TBaseForm)
    TeePreviewPanel1: TTeePreviewPanel;
    CheckBox1: TCheckBox;
    procedure TeePreviewPanel1AfterDraw(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

uses TeCanvas;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPreviewCustomDraw.TeePreviewPanel1AfterDraw(Sender: TObject);
begin
  if checkbox1.Checked then
  begin
    with TeePreviewPanel1,Canvas do
    begin
    Font.Color:=clRed;
    Font.Size:=12;
    TextOut(PaperRect.Left+10,PaperRect.Top+6,'Some text');
    end;
  end;
end;

procedure TPreviewCustomDraw.CheckBox1Click(Sender: TObject);
begin
  inherited;
  TeePreviewPanel1.Repaint;
end;

initialization
  RegisterClass(TPreviewCustomDraw);
end.
