unit Tool_DrawLineStyle;
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
  Base, TeEngine, Series, TeeProcs, Chart, OHLChart, CandleCh, TeeTools;

type
  TDrawLineStyleForm = class(TBaseForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    cbStyle: TComboBox;
    Series1: TCandleSeries;
    ChartTool1: TDrawLineTool;
    procedure FormCreate(Sender: TObject);
    procedure cbStyleChange(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TDrawLineStyleForm.FormCreate(Sender: TObject);
var EllipseLine : TDrawLine;
begin
  inherited;

  EllipseLine:=TDrawLine.Create(ChartTool1.Lines);

  with EllipseLine do
  begin
    Pen.Color:=clYellow;
    Style:= dlEllipse;

    StartPos.X:=Series1.MinXValue;
    StartPos.Y:=Series1.MaxYValue;
    EndPos.X:=Series1.MaxXValue;
    EndPos.Y:=Series1.MinYValue;
  end;

  ChartTool1.Style:=dlEllipse;
  cbStyle.ItemIndex:=4;
end;

procedure TDrawLineStyleForm.cbStyleChange(Sender: TObject);
begin
  with ChartTool1 do
    case cbStyle.ItemIndex of
      0: Style:=dlLine;
      1: Style:=dlHorizParallel;
      2: Style:=dlVertParallel;
      3: Style:=dlRectangle;
      4: Style:=dlEllipse;
    end;
end;

procedure TDrawLineStyleForm.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.EnableDraw := CheckBox1.Checked;
end;

initialization
  RegisterClass(TDrawLineStyleForm);
end.
