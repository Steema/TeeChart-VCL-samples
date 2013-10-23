unit Tools_SeriesAnim;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeAnimations;

type
  TSeriesAnimDemo = class(TBaseForm)
    Series1: TBarSeries;
    Label1: TLabel;
    Button1: TButton;
    ScrollBar1: TScrollBar;
    Label2: TLabel;
    Button2: TButton;
    ChartTool1: TSeriesAnimationTool;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

uses EditChar;

procedure TSeriesAnimDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);

  // Cosmetic changes for better animation display...
  Chart1.Legend.Visible:=False;
  Series1.ValueFormat:='000';
end;

procedure TSeriesAnimDemo.ScrollBar1Change(Sender: TObject);
begin
  ChartTool1.Steps:=ScrollBar1.Position;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TSeriesAnimDemo.Button1Click(Sender: TObject);
begin
  ScrollBar1.Enabled:=False;
  Button1.Enabled:=False;
  try
    ChartTool1.Execute;  // <-- Animation !
  finally
    ScrollBar1.Enabled:=True;
    Button1.Enabled:=True;
  end;
end;

procedure TSeriesAnimDemo.Button2Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);

  // cosmetic... just in case "steps" has changed
  ScrollBar1.Position:=ChartTool1.Steps;
  Label2.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TSeriesAnimDemo.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     ChartTool1.DrawEvery:=1
  else
     ChartTool1.DrawEvery:=0
end;

initialization
  RegisterClass(TSeriesAnimDemo);
end.
