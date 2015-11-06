unit ColorLine_Draw3D;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeTools, TeeProcs, Chart, Series;

type
  TColorLine3D = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    ChartTool1: TColorLineTool;
    Series1: TPointSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TColorLine3D.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Draw3D:=CheckBox1.Checked;
end;

procedure TColorLine3D.CheckBox2Click(Sender: TObject);
begin
  ChartTool1.DrawBehind:=CheckBox2.Checked;
end;

procedure TColorLine3D.FormCreate(Sender: TObject);
var tmp : Double;
begin
  inherited;
  Series1.FillSampleValues;

  // find center
  with Series1.YValues do tmp:=(MaxValue + MinValue)/2;
  
  ChartTool1.Value:=tmp;
end;

initialization
  RegisterClass(TColorLine3D);
end.
