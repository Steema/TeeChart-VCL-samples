unit DrawLine_Style;
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
  TDrawLineStyle = class(TBaseForm)
    Label1: TLabel;
    ComboBox1: TComboBox;
    ChartTool1: TDrawLineTool;
    Label2: TLabel;
    Series1: TFastLineSeries;
    procedure FormShow(Sender: TObject);
    procedure ChartTool1NewLine(Sender: TObject);
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

procedure TDrawLineStyle.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;

  Chart1.LeftAxis.SetMinMax(0,100);
  Chart1.BottomAxis.SetMinMax(0,100);
end;

procedure TDrawLineStyle.ChartTool1NewLine(Sender: TObject);
begin
  // Change line style for new added lines:

  case ComboBox1.ItemIndex of
    0: ChartTool1.Lines.Last.Style:=dlLine;
    1: ChartTool1.Lines.Last.Style:=dlHorizParallel;
    2: ChartTool1.Lines.Last.Style:=dlVertParallel;
  end;
end;

initialization
  RegisterClass(TDrawLineStyle);
end.
