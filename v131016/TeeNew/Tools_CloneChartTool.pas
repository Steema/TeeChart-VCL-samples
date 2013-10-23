unit Tools_CloneChartTool;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools;

type
  TToolsCloneChartTool = class(TBaseForm)
    bClone: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    bEdit: TButton;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure bCloneClick(Sender: TObject);
    procedure bEditClick(Sender: TObject);
  private
    { Private declarations }
    ColorLine : TColorLineTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
  EditChar;

procedure TToolsCloneChartTool.FormCreate(Sender: TObject);
begin
  inherited;

  ColorLine := TColorLineTool.Create(Self);
  Chart1.Tools.Add(ColorLine);

  With ColorLine do
  begin
    Axis:=Chart1.Axes.Right;
    Value:=UpDown1.Position;
    Pen.Width:=4;
    Pen.Color:=RGB(255,255,255);
  end;
end;

procedure TToolsCloneChartTool.bCloneClick(Sender: TObject);
var tmpNew : TTeeCustomTool;
begin
  tmpNew:=CloneChartTool(ColorLine,ColorLine.Owner);
  tmpNew.ParentChart:=ColorLine.ParentChart;

  with (Chart1.Tools.Items[Chart1.Tools.Count-1] as TColorLineTool) do
  begin
    Value:=UpDown1.Position;
    Pen.Width:=4;
    Pen.Color:=RGB(Random(255),Random(255),Random(255));
  end;
end;

procedure TToolsCloneChartTool.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,ColorLine);
end;

initialization
  RegisterClass(TToolsCloneChartTool);
end.

