unit Axis_GridZoning;
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
  TAxisGridZoning = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    Series3: TLineSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AxisGridZoning: TAxisGridZoning;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TAxisGridZoning.FormCreate(Sender: TObject);
begin
  inherited;

  //Use of elected Partner Axes to limit GridLine zone
  Chart1.Axes.Bottom.UsePartnerAxis:=true;
  Chart1.Axes.Bottom.PartnerAxis:=Chart1.CustomAxes[0];
  Chart1.CustomAxes[0].UsePartnerAxis:=true;
  Chart1.CustomAxes[0].PartnerAxis:=Chart1.Axes.Bottom;

  Chart1.CustomAxes[1].UsePartnerAxis:=true;
  Chart1.CustomAxes[1].PartnerAxis:=Chart1.Axes.Left;

  Chart1.CustomAxes[3].UsePartnerAxis:=true;
  Chart1.CustomAxes[3].PartnerAxis:=Chart1.CustomAxes[2];
  Chart1.CustomAxes[2].UsePartnerAxis:=true;
  Chart1.CustomAxes[2].PartnerAxis:=Chart1.CustomAxes[3];

  Series1.FillSampleValues(20);
  Series2.FillSampleValues(20);
  Series3.FillSampleValues(20);
end;

procedure TAxisGridZoning.CheckBox1Click(Sender: TObject);
var t:Integer;
begin
  With Chart1.CustomAxes do
  for t:=0 to Count-1 do Items[t].Visible:=CheckBox1.Checked
end;

procedure TAxisGridZoning.Button1Click(Sender: TObject);
begin
  if Chart1.CustomAxes.Count=0 then
     EditChartAxis(Self,Chart1.LeftAxis)
  else
     EditChartAxis(Self,Chart1.CustomAxes[0]);
end;

initialization
  RegisterClass(TAxisGridZoning);
end.
