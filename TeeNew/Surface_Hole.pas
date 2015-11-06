unit Surface_Hole;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  SysUtils, Classes,
  TeEngine, TeeSurfa, TeeProcs, Chart, TeeComma;

type
  TSurfaceHolesForm = class(TForm)
    Chart1: TChart;
    Series1: TSurfaceSeries;
    Timer1: TTimer;
    TeeCommander1: TTeeCommander;
    Panel1: TPanel;
    BitBtn1: TBitBtn;
    BitBtn2: TBitBtn;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
    Angle   : Integer;
    Delta3D : Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSurfaceHolesForm.BitBtn1Click(Sender: TObject);
var x,z:Integer;
    tmp:Double;
begin
  CheckBox1.Enabled:=True;
  Series1.Clear;
  for x:=1 to 10 do
    for z:=1 to 10 do
    begin
      tmp:=cos(x/10.0)*sin(z/10.0);
      Series1.AddXYZ( x, tmp, z, '', clTeeColor );
    end;
end;

procedure TSurfaceHolesForm.BitBtn2Click(Sender: TObject);
var x,z:Integer;
    tmp:Double;
begin
  CheckBox1.Enabled:=True;
  Series1.Clear;
  for x:=1 to 10 do
    for z:=1 to 10 do
    begin
      tmp:=cos(x/10.0)*sin(z/10.0);

      { apply hole at cells (5,5) to (6,6) }
      if ((x=5) or (x=6)) and ((z=5) or (z=6)) then
         Series1.AddXYZ( x, tmp, z, '', clNone )  { <-- NULL cell }
      else
         Series1.AddXYZ( x, tmp, z );
    end;
end;

procedure TSurfaceHolesForm.FormCreate(Sender: TObject);
begin
  Angle:=0;
  Delta3D:=1;
  Series1.NumXValues:=10;
  Series1.NumZValues:=10;
  Chart1.LeftAxis.Increment:=0.1;
  Chart1.BottomAxis.Increment:=1;
  Chart1.BottomAxis.LabelsSeparation:=0;
  BitBtn2Click(Self);
end;

procedure TSurfaceHolesForm.Timer1Timer(Sender: TObject);
var tmpY,tmpX:Double;
begin
  Angle:=Angle+5;
  if Angle>359 then Angle:=0;
  With Chart1 do
  begin
    Chart3DPercent:=Chart3DPercent+Delta3D;
    if (Chart3DPercent<5) or (Chart3DPercent>60) then Delta3D:=-Delta3D;
  end;
  With Series1.XValues do
  begin
    tmpX:=Sin(Angle*Pi/180.0);
    Chart1.BottomAxis.SetMinMax(MinValue-tmpX,MaxValue-tmpX);
  end;
  With Series1.YValues do
  begin
    tmpY:=Cos(Angle*Pi/180.0)*((MaxValue-MinValue)/10.0);
    Chart1.LeftAxis.SetMinMax(MinValue-tmpY,MaxValue-tmpY);
  end;
end;

procedure TSurfaceHolesForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TSurfaceHolesForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.BackWall.Transparent:=not CheckBox2.Checked;
end;

initialization
  RegisterClass(TSurfaceHolesForm);
end.
