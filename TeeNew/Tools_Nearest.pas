unit Tools_Nearest;
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
  Base, TeEngine, Series, TeeTools, TeeProcs, Chart;

type
  TNearestToolDemo = class(TBaseForm)
    Series1: TPointSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    ChartTool1: TNearestTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

Uses EditChar;

procedure TNearestToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

procedure TNearestToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TNearestToolDemo.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: ChartTool1.Style:=hsNone;
    1: ChartTool1.Style:=hsCircle;
    2: ChartTool1.Style:=hsRectangle;
    3: ChartTool1.Style:=hsDiamond;
  end;
end;

procedure TNearestToolDemo.CheckBox2Click(Sender: TObject);
begin
  ChartTool1.DrawLine:=CheckBox2.Checked
end;

procedure TNearestToolDemo.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1)
end;

procedure TNearestToolDemo.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
end;

initialization
  RegisterClass(TNearestToolDemo);
end.
