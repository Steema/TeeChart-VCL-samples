unit ColorBand_Drag;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  ColorBand_Clicked, TeEngine, TeeTools, TeeProcs, Chart, TeCanvas,
  TeePenDlg;

type
  TColorBandDrag = class(TColorBandClicked)
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
    procedure FormCreate(Sender: TObject);
    procedure ButtonPen1Click(Sender: TObject);
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

procedure TColorBandDrag.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=False;

  ButtonPen1.LinkPen(ChartTool1.StartLine.Pen);
  ButtonPen2.LinkPen(ChartTool1.EndLine.Pen);
end;

procedure TColorBandDrag.ButtonPen1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

initialization
  RegisterClass(TColorBandDrag);
end.
 
