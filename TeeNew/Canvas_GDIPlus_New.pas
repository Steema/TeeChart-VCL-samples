unit Canvas_GDIPlus_New;
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
  Base, TeEngine, Series, BubbleCh, TeeProcs, Chart, TeeTools, TeeSubChart,
  TeeThemes, TeeComma, TeCanvas, TeeGDIPlus, TeeSurfa, TeePenDlg,
  TeeEdiGrad;

type
  TCanvasGDIPlusNew = class(TBaseForm)
    Button1: TButton;
    Series1: TBubbleSeries;
    ButtonPen1: TButtonPen;
    ButtonGradient1: TButtonGradient;
    CBTexture: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CBTextureClick(Sender: TObject);
  private
    { Public declarations }
  end;

var
  CanvasGDIPlusNew: TCanvasGDIPlusNew;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar, TeeEditCha;

procedure TCanvasGDIPlusNew.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues();
  
  ButtonPen1.LinkPen(Series1.Pointer.Pen);
  ButtonGradient1.LinkGradient(Chart1.Border.Fill.Gradient);
end;

procedure TCanvasGDIPlusNew.Button1Click(Sender: TObject);
begin
  inherited;
  EditChart(Self,Chart1);
end;

procedure TCanvasGDIPlusNew.CBTextureClick(Sender: TObject);
begin
  inherited;
  Series1.Pointer.Gradient.Visible := not CBTexture.Checked;
end;

initialization
  RegisterClass(TCanvasGDIPlusNew);
end.
