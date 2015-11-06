unit Tool_ColorBandResize;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools;
  

type
  TColorBandResizeForm = class(TBaseForm)
    Series1: TBarSeries;
    ChartTool1: TColorBandTool;
    Label1: TLabel;
    Label2: TLabel;
    labelStart: TLabel;
    labelEnd: TLabel;
    procedure ChartTool1Resized(Sender: TObject);
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

procedure TColorBandResizeForm.ChartTool1Resized(Sender: TObject);
begin
  labelStart.Caption:=floattostr(ChartTool1.StartValue);
  labelEnd.Caption:=floattostr(ChartTool1.EndValue);
end;

procedure TColorBandResizeForm.FormCreate(Sender: TObject);
begin
  inherited;
  with ChartTool1 do
  begin
    ResizeStart:=true;
    ResizeEnd:=true;
    labelStart.Caption:=FloatToStr(StartValue);
    labelEnd.Caption:=FloatToStr(EndValue);
  end;
end;

initialization
  RegisterClass(TColorBandResizeForm);
end.
