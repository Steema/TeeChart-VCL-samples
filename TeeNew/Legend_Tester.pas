unit Legend_Tester;
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
  Base, TeeGDIPlus, TeeProcs, TeEngine, Chart;

type
  TLegendTester = class(TBaseForm)
    PanelProps: TPanel;
    RBLengths: TRadioGroup;
    RGLegendStyle: TRadioGroup;
    RGLegendPos: TRadioGroup;
    CBDividingLines: TCheckBox;
    CBCheckBoxes: TCheckBox;
    GBCount: TGroupBox;
    ESeriesCount: TEdit;
    UDSeriesCount: TUpDown;
    EGroupCount: TEdit;
    UDGroupCount: TUpDown;
    Label1: TLabel;
    Label2: TLabel;
    CBSymbols: TCheckBox;
    CBInverted: TCheckBox;
    GBJustify: TGroupBox;
    CBJustify: TComboBox;
    GBSymbolPos: TGroupBox;
    CBSymbolPos: TComboBox;
    BEditor: TButton;
    CBView3D: TCheckBox;
    Label3: TLabel;
    ETitle: TEdit;
    CBTitleVisible: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CBView3DClick(Sender: TObject);
    procedure BEditorClick(Sender: TObject);
    procedure RBLengthsClick(Sender: TObject);
    procedure RGLegendStyleClick(Sender: TObject);
    procedure RGLegendPosClick(Sender: TObject);
    procedure CBDividingLinesClick(Sender: TObject);
    procedure CBCheckBoxesClick(Sender: TObject);
    procedure ESeriesCountChange(Sender: TObject);
    procedure UDSeriesCountClick(Sender: TObject; Button: TUDBtnType);
    procedure CBSymbolsClick(Sender: TObject);
    procedure CBInvertedClick(Sender: TObject);
    procedure CBJustifyChange(Sender: TObject);
    procedure CBSymbolPosChange(Sender: TObject);
    procedure ETitleChange(Sender: TObject);
    procedure CBTitleVisibleClick(Sender: TObject);
  private
    { Private declarations }
    procedure Populate(GCount: Integer; SCount: Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  Series, EditChar;

procedure TLegendTester.FormCreate(Sender: TObject);
begin
  Chart1.View3D:=False;

  Chart1.Legend.CheckBoxes:=true;
  Chart1.Legend.Alignment:=laBottom;
  Chart1.Legend.DividingLines.Visible:=true;

  ETitleChange(Self);
  
  UDGroupCount.Position:=3;
  UDSeriesCount.Position:=5;
  RBLengths.ItemIndex:=3;
end;

procedure TLegendTester.CBView3DClick(Sender: TObject);
begin
  Chart1.View3D:=CBView3D.Checked;
end;

procedure TLegendTester.CBSymbolPosChange(Sender: TObject);
begin
  Chart1.Legend.Symbol.Position:=TLegendSymbolPosition(CBSymbolPos.ItemIndex);
end;

procedure TLegendTester.CBJustifyChange(Sender: TObject);
begin
  Chart1.Legend.HorizJustify:=TLegendJustify(CBJustify.ItemIndex);
end;

procedure TLegendTester.ESeriesCountChange(Sender: TObject);
begin
  Populate(UDGroupCount.Position, UDSeriesCount.Position);
end;

procedure TLegendTester.BEditorClick(Sender: TObject);
begin
  EditChart(Self, Chart1);
end;

procedure TLegendTester.RBLengthsClick(Sender: TObject);
var i: Integer;
const longstr='This is a long title for ';
begin
  for i:=0 to Chart1.SeriesCount-1 do
    if (RBLengths.ItemIndex=0) or
       ((RBLengths.ItemIndex=2) and (i mod 4 = 0)) then
       Chart1[i].Title:=longstr+'Series'+IntToStr(i+1)
    else
       Chart1[i].Title:='Series'+IntToStr(i+1);

  for i:=0 to Chart1.SeriesGroups.Count-1 do
    if (RBLengths.ItemIndex=0) or
       ((RBLengths.ItemIndex=2) and (i mod 4 = 0)) then
       Chart1.SeriesGroups[i].Name:=longstr+'Group'+IntToStr(i+1)
    else
       Chart1.SeriesGroups[i].Name:='Group'+IntToStr(i+1)
end;

procedure TLegendTester.RGLegendStyleClick(Sender: TObject);
begin
  if (RGLegendStyle.ItemIndex = 0) then
    Chart1.Legend.LegendStyle:=lsAuto
  else
    Chart1.Legend.LegendStyle:=lsSeriesGroups;
end;

procedure TLegendTester.UDSeriesCountClick(Sender: TObject; Button: TUDBtnType);
begin
  RBLengthsClick(Sender);
end;

procedure TLegendTester.RGLegendPosClick(Sender: TObject);
begin
  case RGLegendPos.ItemIndex of
    0: Chart1.Legend.Alignment:=laRight;
    1: Chart1.Legend.Alignment:=laLeft;
    2: Chart1.Legend.Alignment:=laTop;
    else
       Chart1.Legend.Alignment:=laBottom;
  end;
end;

procedure TLegendTester.CBDividingLinesClick(Sender: TObject);
begin
  Chart1.Legend.DividingLines.Visible:=CBDividingLines.Checked;
end;

procedure TLegendTester.CBInvertedClick(Sender: TObject);
begin
  Chart1.Legend.Inverted:=CBInverted.Checked;
end;

procedure TLegendTester.CBSymbolsClick(Sender: TObject);
begin
  Chart1.Legend.Symbol.Visible:=CBSymbols.Checked;
end;

procedure TLegendTester.CBCheckBoxesClick(Sender: TObject);
begin
  Chart1.Legend.CheckBoxes:=CBCheckBoxes.Checked;
end;

procedure TLegendTester.Populate(GCount: Integer; SCount: Integer);
var i: Integer;
begin
  Chart1.SeriesGroups.Clear;
  Chart1.FreeAllSeries;

  for i:=0 to GCount-1 do
    Chart1.SeriesGroups.Add;

  for i:=0 to SCount-1 do
  begin
    Chart1.AddSeries(TLineSeries).FillSampleValues(100);
    Chart1.SeriesGroups[i mod GCount].Add(Chart1[i])
  end;

  RBLengthsClick(Self);
end;

procedure TLegendTester.ETitleChange(Sender: TObject);
begin
  Chart1.Legend.Title.Caption:=ETitle.Text;
end;

procedure TLegendTester.CBTitleVisibleClick(Sender: TObject);
begin
  Chart1.Legend.Title.Visible:=CBTitleVisible.Checked;
end;

initialization
  RegisterClass(TLegendTester);
end.
