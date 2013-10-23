unit Axis_LineMode;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeOpenGL, TeeTools;

type
  TAxisLineModeForm = class(TBaseForm)
    Label1: TLabel;
    cbAxis: TComboFlat;
    Label2: TLabel;
    cbLineMode: TComboFlat;
    TeeOpenGL1: TTeeOpenGL;
    Series1: TLineSeries;
    Series2: TLineSeries;
    Label3: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure cbLineModeChange(Sender: TObject);
    procedure cbAxisChange(Sender: TObject);
  private
    { Private declarations }
    function TheAxis:TChartAxisPen;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAxisLineModeForm.FormCreate(Sender: TObject);
begin
  inherited;

  cbAxis.ItemIndex:=3;
  cbLineMode.ItemIndex:=1;

  with Chart1.Axes do
  begin
    Left.Axis.LineMode:=lmCylinder;
    Left.Axis.Width:=10;

    Bottom.Axis.LineMode:=lmCylinder;
    Bottom.Axis.Width:=10;
  end;
end;

function TAxisLineModeForm.TheAxis:TChartAxisPen;
begin
  case cbAxis.ItemIndex of
    0 : result:=Chart1.Axes.Left.Axis;
    1 : result:=Chart1.Axes.Right.Axis;
    2 : result:=Chart1.Axes.Top.Axis;
  else
    //3 :
    result:=Chart1.Axes.Bottom.Axis;
  end;
end;

procedure TAxisLineModeForm.Edit1Change(Sender: TObject);
begin
  TheAxis.Width:=StrToInt(Edit1.Text);
end;

procedure TAxisLineModeForm.cbLineModeChange(Sender: TObject);
begin
  TheAxis.LineMode:=TPenLineMode(cbLineMode.ItemIndex);
end;

procedure TAxisLineModeForm.cbAxisChange(Sender: TObject);
begin
  cbLineMode.ItemIndex:=Ord(TheAxis.LineMode);
  UpDown1.Position:=TheAxis.Width;
end;

initialization
  RegisterClass(TAxisLineModeForm);
end.
