unit Unit_Maps;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, TeeGDIPlus, TeEngine, TeeSurfa, TeeMapSeries, TeeWorldSeries,
  ExtCtrls, TeeProcs, Chart, StdCtrls, TeeComma, TeeLisB, TeeTree, TeeTools,
  EditChar, TeeWorldSeriesEditor, TeCanvas, Series, TeeOpenGL, TeeGLEditor,
  TeeAnimate, TeeAnimations, TeeGLCanvas, Menus, BubbleCh, TeeMapSeriesEdit,
  {$IFNDEF CPUX64}
  DBTables,
  {$ENDIF}
  IniFiles, TeePoEdi, TeePrevi;

type
  TFormMaps = class(TForm)
    Chart1: TChart;
    Series1: TWorldSeries;
    Panel1: TPanel;
    TeeCommander1: TTeeCommander;
    Button7: TButton;
    Panel2: TPanel;
    ChartListBox1: TChartListBox;
    Panel3: TPanel;
    Tree1: TTree;
    CheckBox2: TCheckBox;
    Splitter1: TSplitter;
    ChartTool1: TMarksTipTool;
    CheckBox1: TCheckBox;
    ChartTool2: TRepaintMonitor;
    ChartAnimation1: TTeeAnimationTool;
    CheckBox3: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    PopupMenu1: TPopupMenu;
    Reload1: TMenuItem;
    Locateinfolder1: TMenuItem;
    Splitter2: TSplitter;
    Panel4: TPanel;
    ScrollBar1: TScrollBar;
    Button4: TButton;
    Button3: TButton;
    ScrollBar3: TScrollBar;
    Button1: TButton;
    Button2: TButton;
    CheckBox7: TCheckBox;
    LabelShape: TLabel;
    Label1: TLabel;
    ScrollBar2: TScrollBar;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button7Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Tree1CheckedShape(Sender: TObject);
    procedure ChartListBox1DblClickSeries(Sender: TChartListBox;
      Index: Integer);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure TeeOpenGL1Init(Sender: TObject);
    procedure Reload1Click(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure Locateinfolder1Click(Sender: TObject);
    procedure CheckBox7Click(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure ScrollBar2Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormMaps: TFormMaps;

implementation

{$R *.dfm}

uses
  MapDemo_Utils;
  
type
  TAxisAccess=class(TChartAxis);

procedure TFormMaps.FormCreate(Sender: TObject);
begin
  Chart1.AutoRepaint:=False;

  // OpenGL AV tessellation Triangles returns +-INF
  TAxisAccess(Chart1.Axes.Left).IUseTeeMaxPixelPos:=True;
  TAxisAccess(Chart1.Axes.Bottom).IUseTeeMaxPixelPos:=True;

  Chart1.Axes.FastCalc:=True;

  Chart1.Axes.Left.Texts.Style:=talValue;
  Chart1.Axes.Bottom.Texts.Style:=talValue;

  Series1.Visible:=True;

  Chart1.Axes.Bottom.SetMinMax(-21,16);
  Chart1.Axes.Left.SetMinMax(30,46);

  Chart1.Zoom.KeepAspectRatio:=True;

  Series1.Marks.Show;
  Series1.Marks.Transparent:=True;

  Series1.FillSampleValues();
  Series1.StartColor:=clDkGray;
  Series1.EndColor:=clSilver;

  ChartAnimation1.Animate.Speed:=120;
end;

procedure TFormMaps.CheckBox2Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox2.Checked;
end;

procedure TFormMaps.Button1Click(Sender: TObject);
begin
  ScaleCoordinates(ChartListBox1.SelectedSeries,1,1,0,0.01);
end;

procedure TFormMaps.Button2Click(Sender: TObject);
begin
  ScaleCoordinates(Series1,1,1,0,-0.01);
  Series1.Repaint;
end;

procedure TFormMaps.Button4Click(Sender: TObject);
begin
  ScaleCoordinates(Series1,1,1,-0.01,0);
  Series1.Repaint;
end;

procedure TFormMaps.Button3Click(Sender: TObject);
begin
  ScaleCoordinates(Series1,1,1,0.01,0);
  Series1.Repaint;
end;

procedure TFormMaps.Button7Click(Sender: TObject);
begin
  Chart1.Axes.Reset;
end;

procedure TFormMaps.FormShow(Sender: TObject);
begin
  Tree1.GlobalFormat.Border.Hide;
  FillDemoTree(Tree1,ExtractFilePath(Application.ExeName));

  Chart1.AutoRepaint:=True;
end;

procedure TFormMaps.Tree1CheckedShape(Sender: TObject);
begin
  DemoCheckedNode(ExtractFilePath(Application.ExeName),Sender as TTreeNodeShape,Series1);
end;

procedure TFormMaps.ChartListBox1DblClickSeries(Sender: TChartListBox;
  Index: Integer);
begin
  EditSeries(Self,Sender.Series[Index]);
end;

procedure TFormMaps.CheckBox1Click(Sender: TObject);
begin
  ChartTool2.Active:=CheckBox1.Checked;

  if CheckBox1.Checked then
  begin
    ChartAnimation1.Animate.Loop:=True;
    ChartAnimation1.Animate.Play;
  end
  else
    ChartAnimation1.Animate.Stop;
end;

procedure TFormMaps.CheckBox3Click(Sender: TObject);
begin
  TeeOpenGL1.Active:=CheckBox3.Checked;
end;

procedure TFormMaps.TeeOpenGL1Init(Sender: TObject);
begin
  TeeOpenGL1.Canvas.ScreenSync:=ssNo;
end;

procedure TFormMaps.Reload1Click(Sender: TObject);
var tmp : TTreeNodeShape;
begin
  tmp:=Tree1.Selected.First;
  TChartSeries(tmp.Data).Free;
  tmp.Data:=nil;

  if tmp.Checked then
     Tree1CheckedShape(tmp)
  else
     tmp.Checked:=True;
end;

procedure TFormMaps.PopupMenu1Popup(Sender: TObject);
var tmp : TTreeNodeShape;
begin
  tmp:=Tree1.Selected.First;
  Reload1.Enabled:=Assigned(tmp) and Assigned(tmp.Data);
end;

procedure TFormMaps.Locateinfolder1Click(Sender: TObject);
var tmp : TTreeNodeShape;
    s : String;
begin
  tmp:=Tree1.Selected.First;

  if Assigned(tmp) then
  begin
    s:=FilePath(ExtractFilePath(Application.ExeName),tmp);

    if tmp.Children.Count=0 then
       TeeGotoURL(0,ExtractFilePath(s))
    else
       TeeGotoURL(0,s);
  end;
end;

procedure TFormMaps.CheckBox7Click(Sender: TObject);
begin
  Series1.Marks.Transparent:=CheckBox7.Checked;
end;

procedure TFormMaps.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var tmpIndex : Integer;
    tmpSeries : TChartSeries;
begin
  tmpSeries:=Chart1.SeriesList.Clicked(x,y,tmpIndex);

  if Assigned(tmpSeries) then
     LabelShape.Caption:=tmpSeries.Title+' '+IntToStr(tmpIndex)+' '+tmpSeries.XLabel[tmpIndex]
  else
     LabelShape.Caption:='';
end;

type
  TMapAccess=class(TMapSeries);

procedure TFormMaps.ScrollBar2Change(Sender: TObject);
begin
  TMapAccess(Series1).MinSize:=ScrollBar2.Position;
  Chart1.Invalidate;
end;

end.
