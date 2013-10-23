unit MomentumDiv_Function;
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
  Base, TeCanvas, TeEngine, TeeTools, StatChar, Series, TeeProcs, Chart;

type
  TMomentumDivForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TLineSeries;
    TeeFunction1: TMomentumDivFunction;
    ChartTool1: TColorLineTool;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TMomentumDivForm.CheckBox1Click(Sender: TObject);
begin
  { show / hide the momentum series }
  Series2.Active:=CheckBox1.Checked;

  { re-position the axis }
  if Series2.Active then Chart1.LeftAxis.EndPosition:=80
                    else Chart1.LeftAxis.EndPosition:=100;

  { show / hide the custom right axis }
  Chart1.CustomAxes[0].Visible:=Series2.Active;

  { show / hide the blue color line }
  ChartTool1.Active:=Series2.Active;
end;

procedure TMomentumDivForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);

  { function is = 100 * Value / (Previous 10th value) }
  TeeFunction1.Period:=10;
end;

procedure TMomentumDivForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position
end;

initialization
  RegisterClass(TMomentumDivForm);
end.
