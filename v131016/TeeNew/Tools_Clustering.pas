unit Tools_Clustering;
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

  TeeClustering, TeeClusteringTool, TeeClusteringToolEditor,
  TeEngine, Series, TeeProcs,
  Chart, TeeTree, TeCanvas, TeePoin3, TeeComma, TeeOpenGL,
  TeeThemeEditor, EditChar, TeeMapSeries, TeeTools, TeeLinkTool, TeeSurfa,
  TeeGDIPlus, TeePrevi;

type
  TClusteringDemo = class(TForm)
    Chart1: TChart;
    Series1: TPointSeries;
    Tree1: TTree;
    Panel1: TPanel;
    Series2: TPoint3DSeries;
    TeeCommander1: TTeeCommander;
    TeeOpenGL1: TTeeOpenGL;
    GroupBox1: TGroupBox;
    BRandom: TButton;
    ERandom: TEdit;
    LRandom: TLabel;
    CB3D: TCheckBox;
    GroupBox2: TGroupBox;
    CheckBox2: TCheckBox;
    GroupBox3: TGroupBox;
    CBCentroid: TCheckBox;
    CBViewClusters: TCheckBox;
    CBColorize: TCheckBox;
    Splitter1: TSplitter;
    StatusBar1: TStatusBar;
    TeeGDIPlus1: TTeeGDIPlus;
    CBData: TComboFlat;
    Button4: TButton;
    LBMethod: TListBox;
    CBCenters: TCheckBox;
    Button1: TButton;
    CheckBox1: TCheckBox;
    IrisDataSet: TMemo;
    procedure FormCreate(Sender: TObject);
    procedure Tree1ClickShape(Sender: TTreeNodeShape; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormDestroy(Sender: TObject);
    procedure BRandomClick(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure CBCentroidClick(Sender: TObject);
    procedure Chart1MouseWheel(Sender: TObject; Shift: TShiftState;
      WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
    procedure Chart1Enter(Sender: TObject);
    procedure Chart1Exit(Sender: TObject);
    procedure Chart1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure CBViewClustersClick(Sender: TObject);
    procedure CBColorizeClick(Sender: TObject);
    procedure CB3DClick(Sender: TObject);
    procedure CBDataChange(Sender: TObject);
    procedure LBMethodClick(Sender: TObject);
    procedure CBCentersClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Tree1ClickBackground(Sender: TCustomTree;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    Tool : TClusteringTool;

    procedure AddClustersToTree;
    procedure AddRandomData;
    function EvaluateClusters:String;
    procedure FillTree(const c: TCluster; ShowCount:Boolean);
    procedure LoadIrisData(Combination:Integer);
    function SelectedSeries:TChartSeries;
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
  Math;

procedure TClusteringDemo.FillTree(const c:TCluster; ShowCount:Boolean);

  function ClusterTitle(ACluster:TCluster):String;
  begin
    if ShowCount then
       result:=IntToStr(ACluster.Count)+': '
    else
       result:='';

    with Tool.Data(ACluster) do
         result:=result+FormatFloat('#.00',X)+' '+FormatFloat('#.00',Y);
  end;

  procedure AddNodes(AShape:TTreeNodeShape; ACluster:TCluster);
  var t : Integer;
  begin
    AShape.Data:=ACluster;

    for t:=0 to ACluster.Count-1 do
        AddNodes(AShape.Add(ClusterTitle(ACluster[t])), ACluster[t]);
  end;

var t : Integer;
begin
  Tree1.Clear;

  for t:=0 to c.Count-1 do
      AddNodes(Tree1.AddRoot(ClusterTitle(c[t])), c[t]);
end;

procedure TClusteringDemo.LoadIrisData(Combination:Integer);
var t : Integer;
    tmpName,
    s : String;
    tmp:TColor;
    x,y,z,
    a,b,c : Double;
    d : Double;
    Old : Char;
begin
  Series1.Clear;
  Series2.Clear;

  TeeFieldsSeparator:=',';

  Old:={$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator;
  {$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator:='.';

  for t:=0 to IrisDataSet.Lines.Count-1 do
  begin
    s:=IrisDataSet.Lines[t];

    a:=StrToFloat(TeeExtractField(s,1));
    b:=StrToFloat(TeeExtractField(s,2));
    c:=StrToFloat(TeeExtractField(s,3));
    d:=StrToFloat(TeeExtractField(s,4));

    tmpName:=TeeExtractField(s,5);

    if tmpName='Iris-setosa' then
       tmp:=clRed
    else
    if tmpName='Iris-versicolor' then
       tmp:=clBlue
    else
       tmp:=clGreen;

    case Combination of
      0:  begin x:=a; y:=b; z:=c; end;
      1:  begin x:=b; y:=c; z:=d; end;
      2:  begin x:=c; y:=d; z:=a; end;
      3:  begin x:=d; y:=a; z:=b; end;
    else
      begin x:=a; y:=c; z:=d; end;
    end;

    Series1.AddXY(x,y,tmpName,tmp);
    Series2.AddXYZ(x,y,z,tmpName,tmp);
  end;

  {$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator:=Old;
end;

procedure TClusteringDemo.FormCreate(Sender: TObject);
begin
  Tree1.AllowZoom:=False;
  Tree1.Page.UsePrinter:=False;
  Tree1.GlobalFormat.Border.Hide;

  LoadIrisData(0);
  Chart1.Axes.Bottom.LabelStyle:=talValue;

  Chart1.View3DOptions.Perspective:=90;
  Chart1.Chart3DPercent:=100;
  Chart1.Walls.Left.AutoHide:=True;
  Series2.Pointer.Depth:=4;

  Chart1.Panning.MouseWheel:=pmwNone;

  Tool:=TClusteringTool.Create(Self);
  Tool.Name:='ClusteringTool1';
  Tool.ParentChart:=Chart1;
  Tool.Series:=Series1;

  LBMethod.ItemIndex:=0;
end;

procedure TClusteringDemo.Tree1ClickShape(Sender: TTreeNodeShape;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  with Tool.GetStats(TCluster(Sender.Data)) do
     StatusBar1.SimpleText:='CoVariance: '+FloatToStr(CoVariance)+
                            ' Correlation: '+FloatToStr(Correlation)+
                            ' Sum of Squares: '+FloatToStr(SumOfSquares);

  Chart1.Invalidate;
end;

procedure TClusteringDemo.FormDestroy(Sender: TObject);
begin
  Tool.Free;
end;

procedure TClusteringDemo.AddRandomData;
var n, t : Integer;
begin
  Series1.Clear;
  Series2.Clear;

  Series1.BeginUpdate;
  Series2.BeginUpdate;

  n:=StrToInt(ERandom.Text);

  for t:=0 to n-1 do
      Series1.AddXY(Random(1000)*0.005,Random(1000)*0.005);

  for t:=0 to n-1 do
      Series2.AddXYZ(Random(1000)*0.005,Random(1000)*0.005,Random(1000)*0.005);

  Series1.EndUpdate;
  Series2.EndUpdate;
end;

procedure TClusteringDemo.BRandomClick(Sender: TObject);
begin
  AddRandomData;
  Tool.Clear;
  Tree1.Clear;
end;

procedure TClusteringDemo.CheckBox2Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox2.Checked;
end;

function TClusteringDemo.SelectedSeries: TChartSeries;
begin
  if CB3D.Checked then
     result:=Series2
  else
     result:=Series1;
end;

function TClusteringDemo.EvaluateClusters:String;
begin
  with TBaseClustering.Evaluation(Tool.Hierarchical.Provider, Tool.Clusters) do
    result:='Davies-Bouldin index: '+FormatFloat('0.000', DaviesBouldin)+' '+
            'Dunn index: '+FormatFloat('0.000', Dunn);
end;

procedure TClusteringDemo.Button4Click(Sender: TObject);
var t1, t2 : Cardinal;
begin
  t1:=GetTickCount;
  Tool.Execute;
  t2:=GetTickCount;

  StatusBar1.SimpleText:=IntToStr(t2-t1)+' msec. '+EvaluateClusters;

  AddClustersToTree;
end;

procedure TClusteringDemo.AddClustersToTree;
begin
  FillTree(Tool.Clusters, Tool.Method<>cmHierarchical);
end;

procedure TClusteringDemo.CBCentroidClick(Sender: TObject);
begin
  Tool.Centroids.Visible:=CBCentroid.Checked;
end;

procedure TClusteringDemo.Chart1MouseWheel(Sender: TObject; Shift: TShiftState;
  WheelDelta: Integer; MousePos: TPoint; var Handled: Boolean);
begin
  if Chart1.Panning.MouseWheel=pmwNone then
  begin
    with Chart1.View3DOptions do
         ZoomFloat:=ZoomFloat+WheelDelta*ZoomFloat*0.0001;

    Handled:=True;
  end;
end;

procedure TClusteringDemo.Chart1Enter(Sender: TObject);
begin
  Chart1.Title.Font.Style:=[fsBold];
end;

procedure TClusteringDemo.Chart1Exit(Sender: TObject);
begin
  Chart1.Title.Font.Style:=[];
end;

procedure TClusteringDemo.Chart1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  Chart1.SetFocus;
end;

procedure TClusteringDemo.CBViewClustersClick(Sender: TObject);
begin
  Tool.ShowBounds:=CBViewClusters.Checked;
end;

procedure TClusteringDemo.CBColorizeClick(Sender: TObject);
begin
  Tool.ColorEach:=CBColorize.Checked;
end;

procedure TClusteringDemo.CB3DClick(Sender: TObject);
begin
  Series1.Visible:=not CB3D.Checked;
  Series2.Visible:=CB3D.Checked;

  Chart1.View3D:=CB3D.Checked;
  Tool.Series:=SelectedSeries;
end;

procedure TClusteringDemo.CBDataChange(Sender: TObject);
begin
  Tree1.Clear;

  Tool.Clear;

  LRandom.Enabled:=(CBData.ItemIndex=CBData.Items.Count-1);
  ERandom.Enabled:=LRandom.Enabled;
  BRandom.Enabled:=LRandom.Enabled;

  if CBData.ItemIndex=(CBData.Items.Count-1) then
     AddRandomData
  else
     LoadIrisData(CBData.ItemIndex);
end;

procedure TClusteringDemo.LBMethodClick(Sender: TObject);
begin
  Tool.Method:=TClusteringMethod(LBMethod.ItemIndex);

  AddClustersToTree;
end;

procedure TClusteringDemo.CBCentersClick(Sender: TObject);
begin
  Tool.Centers.Visible:=CBCenters.Checked;
end;

procedure TClusteringDemo.Button1Click(Sender: TObject);
begin
  EditChartTool(Self, Tool);
end;

procedure TClusteringDemo.Tree1ClickBackground(Sender: TCustomTree;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Chart1.Invalidate;
end;

procedure TClusteringDemo.Chart1AfterDraw(Sender: TObject);
var Cluster : TCluster;
    Points  : TPointArray;
    R       : TRect;
begin
  if Tree1.Selected.First<>nil then
  begin
    Chart1.Canvas.Brush.Style:=bsClear;
    Chart1.Canvas.Pen.Width:=3;
    Chart1.Canvas.Pen.Color:=clBlack;

    Cluster:=TCluster(Tree1.Selected.First.Data);

    if Cluster.Count=0 then
    begin
       R.Left:=SelectedSeries.CalcXPosValue(Tool.Data(Cluster).X)-4;
       R.Right:=R.Left+8;

       R.Top:=SelectedSeries.CalcYPosValue(Tool.Data(Cluster).Y)-4;
       R.Bottom:=R.Top+8;

       Chart1.Canvas.EllipseWithZ(R,0);
    end
    else
    begin
      Tool.GetClusterPoints(Cluster, Points);
      Chart1.Canvas.ConvexHull(Points);
      Chart1.Canvas.PolygonWithZ(Points,0);
      Points:=nil;
    end;
  end;
end;

procedure TClusteringDemo.CheckBox1Click(Sender: TObject);
var tmp : Integer;
begin
  if CheckBox1.Checked then
     tmp:=NumberOfProcessors
  else
     tmp:=1;

  Tool.KMeans.Threads:=tmp;
  Tool.Hierarchical.Threads:=tmp;
  Tool.QTClustering.Threads:=tmp;
end;

initialization
  RegisterClass(TClusteringDemo);
end.
