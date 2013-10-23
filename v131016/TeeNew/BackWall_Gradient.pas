unit BackWall_Gradient;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools;

type
  TBackWallGradient = class(TBaseForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    ChartTool1: TRotateTool;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    DeltaR, DeltaE: Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeEdiGrad;

procedure TBackWallGradient.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.BackWall.Gradient.Visible:=CheckBox1.Checked
end;

procedure TBackWallGradient.Button1Click(Sender: TObject);
begin
  EditTeeGradient(Self,Chart1.BackWall.Gradient);
end;

procedure TBackWallGradient.CheckBox2Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox2.Checked;
end;

procedure TBackWallGradient.Timer1Timer(Sender: TObject);
begin
  inherited;
  Timer1.Enabled:=False;
  With Chart1.View3DOptions do
  begin
    Rotation:=Rotation+DeltaR;
    if Rotation>358 then DeltaR:=-DeltaR else
    if Rotation<272 then DeltaR:=-DeltaR;

    Elevation:=Elevation+DeltaE;
    if (Elevation>358) or (Elevation<272) then
       DeltaE:=-DeltaE;
  end;
  Timer1.Enabled:=True;
end;

procedure TBackWallGradient.FormCreate(Sender: TObject);
begin
  inherited;
  DeltaR:=1;
  DeltaE:=1;
end;

initialization
  RegisterClass(TBackWallGradient);
end.
