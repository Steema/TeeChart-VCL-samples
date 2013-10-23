unit Tool_Video;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeVideo, TeeTriSurface,
  TeeSurfa;


type
  TVideoToolForm = class(TBaseForm)
    bStart: TButton;
    Timer1: TTimer;
    bStop: TButton;
    Series1: TTriSurfaceSeries;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure bStartClick(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure bStopClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    Video : TVideoTool;
    DeltaRotate  : Integer;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TVideoToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;
  
  DeltaRotate:=-5;

  Chart1.Width:=640;
  Chart1.Height:=480;
  
  Video:=TVideoTool.Create(Self);
  Video.ParentChart:=Chart1;

  Video.FileName:=Edit1.Text;
end;

procedure TVideoToolForm.bStartClick(Sender: TObject);
begin
  BStart.Enabled:=False;
  BStop.Enabled:=True;
  Video.StartRecording(Edit1.Text);
  Timer1.Enabled:=True;
end;

procedure TVideoToolForm.Timer1Timer(Sender: TObject);
begin
  with Chart1.View3DOptions do
       Rotation:=(Rotation+DeltaRotate) mod 360;
end;

procedure TVideoToolForm.bStopClick(Sender: TObject);
begin
  Timer1.Enabled:=False;
  Video.StopRecording;
  BStart.Enabled:=True;
  BStop.Enabled:=False;
end;

procedure TVideoToolForm.FormDestroy(Sender: TObject);
begin
  Video.Free;
end;

initialization
  RegisterClass(TVideoToolForm);
end.
