unit Tool_SeriesBandStairs;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools,
  TeeSeriesBandTool;

type
  TToolSeriesBandStairs = class(TBaseForm)
    Button2: TButton;
    CBStairs1: TCheckBox;
    CBStairs2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CBStairs1Click(Sender: TObject);
    procedure CBStairs2Click(Sender: TObject);
  private
    { Private declarations }
    SeriesBand : TSeriesBandTool;
    Line1,
    Line2 : TlineSeries;
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

procedure TToolSeriesBandStairs.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D:=False;

  Line1:=TLineSeries.Create(self);
  Chart1.AddSeries(line1);

  Line2:=TLineSeries.Create(self);
  Chart1.AddSeries(line2);

  Line1.FillSampleValues;
  Line2.FillSampleValues;

  Line1.Stairs:=True;
  Line2.Stairs:=True;

  SeriesBand:=TSeriesBandTool.Create(Self);

  with SeriesBand do
  begin
    ParentChart:=Chart1;
    Series:=Line1;
    Series2:=Line2;
    Brush.BackColor:=RGB(126, 93, 65);
    Transparency:=20;
  end;
end;

procedure TToolSeriesBandStairs.Button2Click(Sender: TObject);
begin
  EditChartTool(Self,SeriesBand);
end;

procedure TToolSeriesBandStairs.CBStairs1Click(Sender: TObject);
begin
  Line1.Stairs:=CBStairs1.Checked;
end;

procedure TToolSeriesBandStairs.CBStairs2Click(Sender: TObject);
begin
  Line2.Stairs:=CBStairs2.Checked;
end;

initialization
  RegisterClass(TToolSeriesBandStairs);
end.
