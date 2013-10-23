unit Axis_GridBandCentered;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QComCtrls, QExtCtrls, QButtons,
  {$ELSE}
  StdCtrls, ExtCtrls, Controls, Graphics, Forms, Dialogs,
  {$ENDIF}
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TAxis_GridBandCenteredForm = class(TBaseForm)
    Series1: THorizBarSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    ChartTool1: TGridBandTool;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses
  EditChar;

procedure TAxis_GridBandCenteredForm.CheckBox1Click(Sender: TObject);
begin
  Chart1.Axes.Left.GridCentered:=CheckBox1.Checked;
end;

procedure TAxis_GridBandCenteredForm.CheckBox2Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox2.Checked;
end;

procedure TAxis_GridBandCenteredForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

initialization
  RegisterClass(TAxis_GridBandCenteredForm)
end.
