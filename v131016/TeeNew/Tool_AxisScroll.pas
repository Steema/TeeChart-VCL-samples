unit Tool_AxisScroll;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages,
  SysUtils, Classes,
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TAxisScrollToolDemo = class(TBaseForm)
    Series1: TFastLineSeries;
    ChartTool1: TAxisScrollTool;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TAxisScrollToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

procedure TAxisScrollToolDemo.CheckBox2Click(Sender: TObject);
begin
  ChartTool1.ScrollInverted:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TAxisScrollToolDemo);
end.
