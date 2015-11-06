unit Series_CustomSmoothed;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas;

type
  TSeriesCustomSmoothedForm = class(TBaseForm)
    cbSmoothed: TCheckBox;
    GroupBox1: TGroupBox;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    procedure FormCreate(Sender: TObject);
    procedure cbSmoothedClick(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    LineSeries:TLineSeries;
    AreaSeries:TAreaSeries;
    { Private declarations }
  public
    { Public declarations }
  end;

var
  SeriesCustomSmoothedForm: TSeriesCustomSmoothedForm;  

implementation

uses TeeSpline;

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSeriesCustomSmoothedForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=false;
  Chart1.Legend.Visible:=false;
  Chart1.Title.Font.Color:=RGB(255,255,255);
  Chart1.Title.Caption:='Euribor';
  Chart1.BevelInner:=bvNone;
  Chart1.BevelOuter:=bvNone;
  Chart1.Color:=clWhite;
  Chart1.Gradient.Visible:=false;
  Chart1.Axes.Left.Axis.Color:=RGB(120,60,20);
  Chart1.Axes.Left.Axis.Width:=4;
  Chart1.Axes.Left.MinorTicks.Visible:=false;
  Chart1.Axes.Left.Grid.Color:=RGB(245,225,170);
  Chart1.Axes.Left.Grid.Style:=psSolid;
  Chart1.Axes.Bottom.Axis.Color:=RGB(120,60,20);
  Chart1.Axes.Bottom.Grid.Visible:=false;
  Chart1.Axes.Bottom.MinorTicks.Visible:=false;
  Chart1.Axes.Bottom.Axis.Width:=4;
  Chart1.Walls.Back.Pen.Visible:=false;
  Chart1.Walls.Back.Gradient.Visible:=false;
  Chart1.Walls.Back.Color:=clWhite;

  LineSeries:=TLineSeries.Create(Self);
  Chart1.AddSeries(LineSeries);
  LineSeries.Color:=RGB(128,128,128);
  LineSeries.Pointer.Style:=psCircle;
  LineSeries.Pointer.Visible:=true;
  LineSeries.ColorEachLine:=false;
  LineSeries.Smoothed:=True;

  LineSeries.FillSampleValues;

  cbSmoothed.Checked:=LineSeries.Smoothed;
end;

procedure TSeriesCustomSmoothedForm.cbSmoothedClick(Sender: TObject);
begin
  inherited;
  if RadioButton1.Checked then
     LineSeries.Smoothed:=cbSmoothed.Checked;
  if RadioButton2.Checked then
     AreaSeries.Smoothed:=cbSmoothed.Checked;
end;

procedure TSeriesCustomSmoothedForm.RadioButton1Click(Sender: TObject);
begin
  inherited;

  if RadioButton1.Checked then
  begin
    Chart1.View3D:=false;
    Chart1.RemoveSeries(AreaSeries);
    AreaSeries.Free;

    LineSeries:=TLineSeries.Create(Chart1);
    Chart1.AddSeries(LineSeries);
    LineSeries.Color:=RGB(128,128,128);
    LineSeries.Pointer.Style:=psCircle;
    LineSeries.Pointer.Visible:=true;
    LineSeries.ColorEachLine:=false;

    LineSeries.FillSampleValues;
    LineSeries.Smoothed:=cbSmoothed.Checked;
  end;
end;

procedure TSeriesCustomSmoothedForm.RadioButton2Click(Sender: TObject);
begin
  inherited;

  if RadioButton2.Checked then
  begin
    Chart1.View3D:=true;
    Chart1.RemoveSeries(LineSeries);
    LineSeries.Free;

    AreaSeries:=TAreaSeries.Create(Chart1);
    Chart1.AddSeries(AreaSeries);
    AreaSeries.Color:=RGB(128,128,128);
    AreaSeries.ColorEachLine:=false;

    AreaSeries.FillSampleValues;
    AreaSeries.Smoothed:=cbSmoothed.Checked;
  end;
end;

initialization
  RegisterClass(TSeriesCustomSmoothedForm);
end.
