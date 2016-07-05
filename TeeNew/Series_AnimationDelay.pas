unit Series_AnimationDelay;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools, TeeAnimations,
  TeeAnimate;

type
  TSeriesAnimationDelay = class(TBaseForm)
    Series1: THorizBarSeries;
    ChartTool1: TSeriesAnimationTool;
    GridBandTool1: TGridBandTool;
    Label7: TLabel;
    Edit2: TEdit;
    UDDelay: TUpDown;
    Label2: TLabel;
    SBSteps: TScrollBar;
    Label3: TLabel;
    Button1: TButton;
    Button2: TButton;
    procedure SBStepsChange(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Playing : Boolean;

    procedure StopAnimation;
    procedure AnimationEnd(Sender:TTeeAnimation; var FreeAnimation:Boolean);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar;

procedure TSeriesAnimationDelay.SBStepsChange(Sender: TObject);
begin
  ChartTool1.Steps:=SBSteps.Position;
  Label3.Caption:=IntToStr(ChartTool1.Steps);
end;

procedure TSeriesAnimationDelay.Edit2Change(Sender: TObject);
begin
  ChartTool1.Delay:=UDDelay.Position;
end;

procedure TSeriesAnimationDelay.Button1Click(Sender: TObject);
begin
  if Playing then
     StopAnimation
  else
  begin
    Playing:=True;
    Button1.Caption:='Stop';

    ChartTool1.Execute;
  end;
end;

procedure TSeriesAnimationDelay.StopAnimation;
begin
  if Playing then
  begin
    Playing:=False;
    ChartTool1.Stop;
  end;

  Button1.Caption:='Execute !';
end;

procedure TSeriesAnimationDelay.FormCreate(Sender: TObject);
begin
  inherited;

  Playing:=False;

  with ChartTool1 do
  begin
    Steps:=100;
    Delay:=10;
    Animation.OnEnd:=AnimationEnd;
  end;
end;

procedure TSeriesAnimationDelay.AnimationEnd(Sender:TTeeAnimation; var FreeAnimation:Boolean);
begin
  StopAnimation;
end;

procedure TSeriesAnimationDelay.Button2Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

initialization
  RegisterClass(TSeriesAnimationDelay);
end.
