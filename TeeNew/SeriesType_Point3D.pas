unit SeriesType_Point3D;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, TeeSurfa, TeePoin3,
  TeeGDIPlus;

type
  TPoint3DSeriesForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    CheckBox5: TCheckBox;
    CheckBox4: TCheckBox;
    ChartTool1: TRotateTool;
    Series1: TPoint3DSeries;
    Timer1: TTimer;
    CheckBox6: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
  private
    { Private declarations }
    DeltaRotate  : Integer;
    DeltaElevate : Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPoint3DSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;
  DeltaRotate:=-5;
  DeltaElevate:=-4;

  Series1.FillSampleValues(100);
end;

procedure TPoint3DSeriesForm.CheckBox4Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox4.Checked;
end;

procedure TPoint3DSeriesForm.Timer1Timer(Sender: TObject);
begin
  With Chart1.View3DOptions do
  begin
    Rotation:=(Rotation+DeltaRotate) mod 360;
    Elevation:=Elevation+DeltaElevate;
    if (Elevation<280) or (Elevation>350) then DeltaElevate:=-DeltaElevate;
  end;
end;

procedure TPoint3DSeriesForm.CheckBox5Click(Sender: TObject);
begin
  Chart1.View3DWalls:=CheckBox5.Checked;
end;

procedure TPoint3DSeriesForm.CheckBox3Click(Sender: TObject);
begin
  Series1.ColorEachPoint:=CheckBox3.Checked;
end;

procedure TPoint3DSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Pointer.Visible:=CheckBox2.Checked;
end;

procedure TPoint3DSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Series1.LinePen.Visible:=CheckBox1.Checked;
end;

procedure TPoint3DSeriesForm.CheckBox6Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox6.Checked;
end;

initialization
  RegisterClass(TPoint3DSeriesForm);
end.
