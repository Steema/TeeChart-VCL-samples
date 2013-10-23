unit Canvas_OrthoAngle;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TOrthoAngle = class(TBaseForm)
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    Series1: TBarSeries;
    procedure TrackBar1Change(Sender: TObject);
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

procedure TOrthoAngle.TrackBar1Change(Sender: TObject);
begin
  Chart1.View3DOptions.OrthoAngle:=TrackBar1.Position;
  Label2.Caption:=IntToStr(TrackBar1.Position);
end;

procedure TOrthoAngle.FormCreate(Sender: TObject);
begin
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TOrthoAngle);
end.
  
