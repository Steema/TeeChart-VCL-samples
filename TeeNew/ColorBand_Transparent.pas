unit ColorBand_Transparent;
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
  Base, TeeProcs, TeEngine, Chart, TeeTools, Series;

type
  TColorBandTransp = class(TBaseForm)
    ChartTool1: TColorBandTool;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Series1: TAreaSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TColorBandTransp.FormCreate(Sender: TObject);
begin
  inherited;

  { random values... }
  Series1.FillSampleValues(20);

  { set the color band... }
  ChartTool1.Axis := Chart1.LeftAxis;

  { display the band vertically centered }
  ChartTool1.StartValue:=Series1.YValues.MinValue+30;
  ChartTool1.EndValue:=Series1.YValues.MaxValue-30;

  { set the transparency % }
  ChartTool1.Transparency:=50;
  TrackBar1.Position:=50;

  { draw the band on top... }
  ChartTool1.DrawBehind:=False;

  { remove the chart grid lines }
  Chart1.LeftAxis.Grid.Visible:=False;
  Chart1.BottomAxis.Grid.Visible:=False;
end;

procedure TColorBandTransp.TrackBar1Change(Sender: TObject);
begin
  ChartTool1.Transparency:=TrackBar1.Position;
end;

procedure TColorBandTransp.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.DrawBehind:=CheckBox1.Checked;
end;

procedure TColorBandTransp.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TColorBandTransp);
end.
