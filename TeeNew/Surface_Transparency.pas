unit Surface_Transparency;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, TeeSurfa, TeeGDIPlus;

type
  TSurfaceTransp = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Series1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    procedure ScrollBar1Change(Sender: TObject);
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

procedure TSurfaceTransp.ScrollBar1Change(Sender: TObject);
begin
  Series1.Transparency:=ScrollBar1.Position;  
  Label2.Caption:=IntToStr(ScrollBar1.Position)+' %';
end;

procedure TSurfaceTransp.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.View3D := True;
  Series1.FillSampleValues;
  Series1.Transparency:=50;
end;

initialization
  RegisterClass(TSurfaceTransp);
end.
