unit Tool_AxisArrowSize;
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
  Base, TeEngine, Series, TeeTools, TeeProcs, Chart, TeeEdit,
  TeCanvas;

type
  TAxisArrowSizeToolDemo = class(TBaseForm)
    ChartTool1: TAxisArrowTool;
    ChartTool2: TAxisArrowTool;
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Button1: TButton;
    ChartEditor1: TChartEditor;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ChartTool1Click(Sender: TAxisArrowTool; AtStart: Boolean);
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

procedure TAxisArrowSizeToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  
  Label1.Caption:='';
end;

procedure TAxisArrowSizeToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TAxisArrowSizeToolDemo.CheckBox2Click(Sender: TObject);
begin
  ChartTool2.Active:=CheckBox2.Checked
end;

procedure TAxisArrowSizeToolDemo.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TAxisArrowSizeToolDemo.ChartTool1Click(Sender: TAxisArrowTool;
  AtStart: Boolean);
begin
  if AtStart then
     Label1.Caption:=Sender.Name+' at start'
  else
     Label1.Caption:=Sender.Name+' at end'
end;

procedure TAxisArrowSizeToolDemo.Edit1Change(Sender: TObject);
begin
  ChartTool1.SizePercent:=StrToInt(Edit1.Text);
  ChartTool2.SizePercent:=StrToInt(Edit1.Text);
end;

initialization
  RegisterClass(TAxisArrowSizeToolDemo);
end.
