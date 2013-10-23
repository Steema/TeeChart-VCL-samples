unit Surface_FastBrush;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, TeeSurfa;

type
  TSurfaceFastBrush = class(TBaseForm)
    CheckBox1: TCheckBox;
    Button1: TButton;
    LabelTime: TLabel;
    Series1: TSurfaceSeries;
    ChartTool1: TRotateTool;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

procedure TSurfaceFastBrush.Button1Click(Sender: TObject);
var StartTime, EndTime : Cardinal;
    t : Integer;
begin
  Button1.Enabled:=False;
  CheckBox1.Enabled:=False;
  try
    StartTime:=GetTickCount;

    for t:=0 to 360 do
    begin
      Chart1.View3DOptions.Rotation:=t;
      Chart1.Repaint;
    end;

    EndTime:=GetTickCount;

    LabelTime.Caption:='Time: '+FloatToStr( (EndTime-StartTime)*0.001 )+' msec.';
  finally
    Button1.Enabled:=True;
    CheckBox1.Enabled:=True;
  end;
end;

procedure TSurfaceFastBrush.FormCreate(Sender: TObject);
begin
  inherited;
  LabelTime.Caption:='';

  Series1.FillSampleValues(30);

  // Speed. Disable border:
  Chart1.BevelOuter:=bvNone;

  // For more speed, try disabling doublebuffer (set to False).
  Chart1.BufferedDisplay:=True;
  
  // Speed trick, as we know Surface data will not be modified anymore:
  Series1.FillGridIndex;
  Series1.ReuseGridIndex:=True;

  Series1.Pen.Hide;
  Series1.FastBrush:=True;

  // other setting to increase speed:

  Chart1.Title.Hide;
  Chart1.Legend.Hide;
  Chart1.ClipPoints:=False;
  Chart1.Walls.Left.Hide;

  Chart1.Axes.FastCalc:=True;  // <-- bypass overflow checkings...
end;

procedure TSurfaceFastBrush.CheckBox1Click(Sender: TObject);
begin
  Series1.FastBrush:=CheckBox1.Checked;
end;

procedure TSurfaceFastBrush.CheckBox2Click(Sender: TObject);
begin
  Chart1.Axes.Visible:=CheckBox2.Checked;
end;

procedure TSurfaceFastBrush.CheckBox3Click(Sender: TObject);
begin
  Chart1.BufferedDisplay:=CheckBox3.Checked;
end;

initialization
  RegisterClass(TSurfaceFastBrush);
end.
