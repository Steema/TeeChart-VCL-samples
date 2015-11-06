unit Canvas_Render_Design;
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
  TeeThemes, TeeComma, TeCanvas, TeeGDIPlus, TeeSurfa;

type
  TCanvasRenderDesign = class(TBaseForm)
    Series1: TTowerSeries;
    Button1: TButton;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Public declarations }
  end;

var
  CanvasRenderDesign: TCanvasRenderDesign;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses EditChar, TeeEditCha;

procedure TCanvasRenderDesign.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues();
end;

procedure TCanvasRenderDesign.Button1Click(Sender: TObject);
begin
  inherited;
  EditChartPage(Self,Chart1,teeEdit3DPage);
end;

initialization
  RegisterClass(TCanvasRenderDesign);
end.
