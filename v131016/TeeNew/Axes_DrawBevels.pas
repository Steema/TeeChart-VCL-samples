unit Axes_DrawBevels;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QComCtrls, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ComCtrls, StdCtrls, ExtCtrls,
  {$ENDIF}
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeCanvas, Series;

type
  TBeveledAxes = class(TBaseForm)
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ComboFlat1: TComboFlat;
    Series1: TBarSeries;
    procedure Chart1AfterDraw(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
  private
    { Private declarations }
    procedure AdjustAxisOffsets;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

// This routine draws a bevel around TeeChart axes
procedure DrawBevelAroundAxes(Chart:TCustomChart; Style:TBevelCut; Size:Integer);
var R : TRect;
begin
  R:=Chart.ChartRect;
  Inc(R.Right);
  Inc(R.Bottom);
  DrawBevel(Chart.Canvas,Style,R,Size);
end;

procedure TBeveledAxes.Chart1AfterDraw(Sender: TObject);
begin
  inherited;

  if CheckBox1.Checked then
  case ComboFlat1.ItemIndex of
    0: DrawBevelAroundAxes(Chart1, bvLowered, UpDown1.Position);
    1: DrawBevelAroundAxes(Chart1, bvRaised, UpDown1.Position);
  end;
end;

procedure TBeveledAxes.FormCreate(Sender: TObject);
begin
  inherited;

  ComboFlat1.ItemIndex:=0;

  Series1.FillSampleValues;

  // Bevels look fine on 2D only.
  Chart1.View3D:=False;

  Chart1.Axes.Left.Axis.Width:=1;
  Chart1.Axes.Left.MinorTicks.Color:=clBlack;
  Chart1.Axes.Left.MinorTickLength:=3;
  Chart1.Axes.Left.Ticks.Color:=clBlack;

  ColorPalettes.ApplyPalette(Chart1,WindowsXPPalette);
end;

procedure TBeveledAxes.CheckBox1Click(Sender: TObject);
begin
  EnableControls(CheckBox1.Checked, [Label1,Edit1,UpDown1,ComboFlat1]);

  AdjustAxisOffsets;
end;

procedure TBeveledAxes.Edit1Change(Sender: TObject);
begin
  AdjustAxisOffsets;
end;

procedure TBeveledAxes.ComboFlat1Change(Sender: TObject);
begin
  AdjustAxisOffsets;
end;

// Change all axes "offsets" to leave space for the bevel.
procedure TBeveledAxes.AdjustAxisOffsets;
var t : Integer;
    tmpSize : Integer;
begin
  if CheckBox1.Checked then tmpSize:=UpDown1.Position
                       else tmpSize:=0;

  for t:=0 to Chart1.Axes.Count-1 do
  begin
    Chart1.Axes[t].MinimumOffset:=tmpSize;
    Chart1.Axes[t].MaximumOffset:=tmpSize;
  end;

  Chart1.Invalidate;
end;

initialization
  RegisterClass(TBeveledAxes);
end.
 
