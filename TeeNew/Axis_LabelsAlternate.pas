unit Axis_LabelsAlternate;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls, 
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TAlternateAxisLabels = class(TBaseForm)
    Label1: TLabel;
    RadioGroup1: TRadioGroup;
    CheckBox1: TCheckBox;
    Series1: TLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    function TheAxis:TChartAxis;
    procedure Highlight;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAlternateAxisLabels.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;

  Chart1.Axes.Left.LabelsAlternate:=True;
  Chart1.Axes.Top.LabelsAlternate:=True;
  Chart1.Axes.Right.LabelsAlternate:=True;
  Chart1.Axes.Bottom.LabelsAlternate:=True;

  Highlight;
end;

procedure TAlternateAxisLabels.Highlight;

  procedure HighlightAxis(Axis:TChartAxis);
  begin
    if TheAxis=Axis then
       Axis.LabelsFont.Style:=[fsBold]
    else
       Axis.LabelsFont.Style:=[];
  end;

begin
  HighLightAxis(Chart1.Axes.Left);
  HighLightAxis(Chart1.Axes.Right);
  HighLightAxis(Chart1.Axes.Top);
  HighLightAxis(Chart1.Axes.Bottom);
end;

procedure TAlternateAxisLabels.CheckBox1Click(Sender: TObject);
begin
  TheAxis.LabelsAlternate:=CheckBox1.Checked;

  Highlight;
end;

procedure TAlternateAxisLabels.RadioGroup1Click(Sender: TObject);
begin
  CheckBox1.Checked:=TheAxis.LabelsAlternate;

  Highlight;
end;

function TAlternateAxisLabels.TheAxis:TChartAxis;
begin
  case RadioGroup1.ItemIndex of
    0: result:=Chart1.Axes.Left;
    1: result:=Chart1.Axes.Top;
    2: result:=Chart1.Axes.Right;
  else result:=Chart1.Axes.Bottom;
  end;
end;

initialization
  RegisterClass(TAlternateAxisLabels);
end.
