unit Axis_Exponent;
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
  TAxisLabelExp = class(TBaseForm)
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TAxisLabelExp.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.Clear;
  Series1.Add(      1);
  Series1.Add(     10);
  Series1.Add(    100);
  Series1.Add(   1000);
  Series1.Add(  10000);
  Series1.Add( 100000);
  Series1.Add(1000000);
end;

procedure TAxisLabelExp.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Chart1.LeftAxis.LabelsExponent:=CheckBox1.Checked
end;

procedure TAxisLabelExp.Edit1Change(Sender: TObject);
begin
  Chart1.LeftAxis.AxisValuesFormat:=Edit1.Text
end;

initialization
  RegisterClass(TAxisLabelExp);
end.
