unit Axes_GridBands;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeTools, TeCanvas, TeePenDlg;

type
  TAxesGridBands = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Series1: TLineSeries;
    CheckBox1: TCheckBox;
    ButtonPen1: TButtonPen;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    BandTool : TGridBandTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses TeeBrushDlg;

procedure TAxesGridBands.Button1Click(Sender: TObject);
begin
  EditChartBrush(Self,BandTool.Band1);
end;

procedure TAxesGridBands.Button2Click(Sender: TObject);
begin
  EditChartBrush(Self,BandTool.Band2);
end;

procedure TAxesGridBands.CheckBox1Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox1.Checked;
end;

procedure TAxesGridBands.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues;
  Series1.Pen.Width:=2;

  // Create GridBandTool...
  BandTool:=TGridBandTool.Create(Self);
  BandTool.Axis:=Chart1.Axes.Left;

  // cosmetic examples:
  with BandTool do
  begin
    GetTeeBrush(0,Band1.Image.Bitmap);
    Band1.Color:=clBlue;

    Band2.Style:=bsCross;
    Band2.Color:=clWhite;
  end;

  // Change Left axis grid
  Chart1.Axes.Left.Grid.Color:=clRed;
  Chart1.Axes.Left.Grid.Style:=psSolid;

  // set 2D
  Chart1.View3D:=False;

  // configure ButtonPen
  ButtonPen1.LinkPen(Chart1.Axes.Left.Grid);
end;

initialization
  RegisterClass(TAxesGridBands);
end.
