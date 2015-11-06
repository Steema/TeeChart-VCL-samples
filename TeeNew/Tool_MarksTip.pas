unit Tool_MarksTip;
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
  Base, TeCanvas, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TMarkTipsToolDemo = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TBarSeries;
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TMarkTipsToolDemo.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked
end;

procedure TMarkTipsToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
  Application.HintPause:=10;
end;

procedure TMarkTipsToolDemo.Button1Click(Sender: TObject);
begin
  inherited;
  EditChartTool(Self,ChartTool1);
end;

procedure TMarkTipsToolDemo.ComboBox1Change(Sender: TObject);
begin
  if ComboBox1.ItemIndex=0 then ChartTool1.MouseAction:=mtmMove
                           else ChartTool1.MouseAction:=mtmClick;
end;

procedure TMarkTipsToolDemo.Edit1Change(Sender: TObject);
begin
  Application.HintPause:=UpDown1.Position;
end;

procedure TMarkTipsToolDemo.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TMarkTipsToolDemo);
end.
