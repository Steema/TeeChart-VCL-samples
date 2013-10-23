unit Tool_ExtraLegend;
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
  Base, TeEngine, TeeTools, TeeExtraLegendTool, Series, TeeProcs, Chart;

type
  TExtraLegendDemo = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Button1: TButton;
    ChartTool1: TExtraLegendTool;
    Button2: TButton;
    procedure CheckBox1Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    procedure AlignLegend;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeEdiLege; // <-- for this example only, to show legend editor

procedure TExtraLegendDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

procedure TExtraLegendDemo.Button1Click(Sender: TObject);
begin
  with TFormTeeLegend.Create(Self) do
  try
    Legend:=Self.ChartTool1.Legend;
    ShowModal;
  finally
    Free;
  end;
end;

procedure TExtraLegendDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(5);

  ChartTool1.Series:=Series2;

  // Cosmetic...
  with ChartTool1.Legend do
  begin
    Shadow.Transparency:=70;
    CustomPosition:=True;
    Left:=50;
    Top:=50;
  end;
end;

procedure TExtraLegendDemo.AlignLegend;
begin
  // Customize extra legend position.
  // Align with default normal legend.
  with ChartTool1.Legend do
  begin
    CustomPosition:=True;
    Left:=Chart1.Legend.Left;
    Top:=Chart1.Legend.ShapeBounds.Bottom+10;
  end;
end;

procedure TExtraLegendDemo.Button2Click(Sender: TObject);
begin
  AlignLegend;
end;

initialization
  RegisterClass(TExtraLegendDemo);
end.
