unit Base;
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
  {$IFNDEF CLX}
  TeeGDIPlus,
  {$ENDIF}
  TeEngine, Series, TeeProcs, Chart;

type
  TBaseForm = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    BaseSplitter1: TSplitter;
    Chart1: TChart;
    procedure Memo1DblClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

  TNewCanvasStyle=(ncGDI, ncOpenGL, ncAntiAlias, ncGDIPlus);

var
  TeeNewCanvas : TNewCanvasStyle = ncGDI;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
  {$IFNDEF TEELITE}
  TeeOpenGL,
  TeeAntiAlias,
  {$ENDIF}
  EditChar;

// Trick:
// Double-clicking any Memo on any form shows the chart editor
procedure TBaseForm.Memo1DblClick(Sender: TObject);
begin
  EditChart(Self,Chart1);
end;

procedure TBaseForm.FormCreate(Sender: TObject);
{$IFNDEF TEELITE}
var GL : TTeeOpenGL;
{$ENDIF}
begin
  case TeeNewCanvas of
  {$IFNDEF TEELITE}
    ncOpenGL    : begin
                    GL:=TTeeOpenGL.Create(Self);
                    GL.TeePanel:=Chart1;
                    GL.Active:=True;

                    // Force zoom
                    Chart1.View3DOptions.Zoom:=40;
                    Chart1.View3DOptions.Perspective:=50;
                  end;
    ncAntiAlias : Chart1.Canvas:=TAntiAliasCanvas.Create;
  {$ENDIF}
    ncGDIPlus   : begin
                    {$IFNDEF CLX}
                    Chart1.Canvas:=TGDIPlusCanvas.Create;
                    (Chart1.Canvas as TGDIPlusCanvas).AntiAlias:=True;
                    {$ENDIF}
                  end;

  end;
end;

end.
