unit Legend_CustomPos;
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
  Base_CustomPos, TeEngine, Series, TeeProcs, Chart;

type
  TLegendCustomPos = class(TBaseCustomPos)
    Series1: TPieSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure TrackBar2Change(Sender: TObject);
    procedure FormResize(Sender: TObject);
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

procedure TLegendCustomPos.CheckBox1Click(Sender: TObject);
begin
  Chart1.Legend.CustomPosition:=CheckBox1.Checked;

  TrackBar1.Enabled:=CheckBox1.Checked;
  TrackBar2.Enabled:=CheckBox1.Checked;
end;

procedure TLegendCustomPos.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(7);

  Chart1.Legend.CustomPosition:=True;
  Chart1.Legend.Left:=36;
  Chart1.Legend.Top:=20;

  TrackBar1.Position:=Chart1.Legend.Left;
  TrackBar2.Position:=Chart1.Legend.Top;
end;

procedure TLegendCustomPos.TrackBar1Change(Sender: TObject);
begin
  Chart1.Legend.Left:=TrackBar1.Position
end;

procedure TLegendCustomPos.TrackBar2Change(Sender: TObject);
begin
  Chart1.Legend.Top:=TrackBar2.Position
end;

procedure TLegendCustomPos.FormResize(Sender: TObject);
begin
  inherited;

  TrackBar1.Max := Chart1.Width;
  TrackBar1.Min := 0;
  TrackBar1.Position := Chart1.Legend.Left;
  TrackBar2.Max := Chart1.Height;
  TrackBar2.Min := 0;
  TrackBar2.Position := Chart1.Legend.Top;
end;

initialization
  RegisterClass(TLegendCustomPos);
end.
