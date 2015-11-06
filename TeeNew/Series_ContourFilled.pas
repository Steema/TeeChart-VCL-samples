unit Series_ContourFilled;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeSurfa, TeeBrushDlg, EditChar,
  TeeTools, TeCanvas, TeePenDlg;

type
  TSeriesContourFilled = class(TBaseForm)
    Series1: TContourSeries;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    ChartTool1: TRotateTool;
    ButtonPen1: TButtonPen;
    CheckBox2: TCheckBox;
    ButtonColor1: TButtonColor;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure ButtonColor1Click(Sender: TObject);
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

procedure TSeriesContourFilled.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
     Series1.Brush.Style:=bsSolid
  else
     Series1.Brush.Style:=bsClear;

end;

procedure TSeriesContourFilled.FormCreate(Sender: TObject);
begin
  inherited;

  ButtonPen1.LinkPen(Series1.Frame);
  ButtonColor1.LinkProperty(Series1,'LinesColor');

  // Enable contour filling:
  Series1.Brush.Style:=bsSolid;

  Series1.FillSampleValues;
end;

procedure TSeriesContourFilled.Button2Click(Sender: TObject);
begin
  EditChartBrush(Self, Series1.Brush)
end;

procedure TSeriesContourFilled.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TSeriesContourFilled.CheckBox2Click(Sender: TObject);
begin
  // when LegendLines is True, and if contour levels aren't filled,
  // the legend displays contour levels as lines instead of rectangles.
  Series1.LegendLines:=CheckBox2.Checked;

  // Disable filling when LegendLines is True:
  if Series1.LegendLines then
  begin
    Series1.Brush.Style:=bsClear;

    CheckBox1.Checked:=False;
  end;
end;

procedure TSeriesContourFilled.ButtonColor1Click(Sender: TObject);
begin
  // "LinesColor" property only available when contour is filled.
  // So, set contour to filled mode:

  if Series1.Brush.Style=bsClear then
  begin
    CheckBox1.Checked:=True;
    Series1.Brush.Style:=bsSolid;
  end;
end;

initialization
  RegisterClass(TSeriesContourFilled);
end.
