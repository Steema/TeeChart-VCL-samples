unit Tool_AxisArrow;
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
  Base, TeEngine, Series, TeeTools, TeeProcs, Chart, TeeEdit;

type
  TAxisArrowToolDemo = class(TBaseForm)
    ChartTool1: TAxisArrowTool;
    ChartTool2: TAxisArrowTool;
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool3: TAxisArrowTool;
    Button1: TButton;
    ChartEditor1: TChartEditor;
    Label1: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChartTool1Click(Sender: TAxisArrowTool; AtStart: Boolean);
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

procedure TAxisArrowToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  
  Label1.Caption:='';
end;

procedure TAxisArrowToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TAxisArrowToolDemo.CheckBox2Click(Sender: TObject);
begin
  ChartTool2.Active:=CheckBox2.Checked
end;

procedure TAxisArrowToolDemo.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TAxisArrowToolDemo.ChartTool1Click(Sender: TAxisArrowTool;
  AtStart: Boolean);
begin
  if AtStart then
     Label1.Caption:=Sender.Name+' at start'
  else
     Label1.Caption:=Sender.Name+' at end'
end;

initialization
  RegisterClass(TAxisArrowToolDemo);
end.
