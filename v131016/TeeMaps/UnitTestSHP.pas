{**********************************************}
{   TeeMaps                                    }
{   Copyright (c) 2003-2010 by Steema Software }
{**********************************************}
unit UnitTestSHP;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes, Math, ActnList,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls, QGrids,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls, Grids,
  Buttons,
  {$ENDIF}
  TeEngine, TeeSurfa, TeeMapSeries, TeeProcs, Chart, TeeComma, TeCanvas,
  DB,
  {$IFNDEF NOUSE_BDE}
  DBTables,
  {$ENDIF}
  {$IFDEF D7}
  XPMan,
  {$ENDIF}
  TeeInspector, TeeObjectInspector, TeeLisB, TeeLegendScrollBar, TeeTools,

  TeeGLEditor,

  {$IFNDEF TEENOTHEMES}
  TeeThemeEditor, TeeThemes,
  {$ENDIF}

  {$IFDEF CLR}
  Variants, System.ComponentModel, System.IO,
  {$ENDIF}

  TeeJPEG, TeePNG, TeeGIF, TeeSVGCanvas, TeePDFCanvas, TeeXAMLCanvas,
  TeeFlexCanvas,
  TeePSCanvas, TeeVMLCanvas, TeeLighting, TeeEdiGrad, TeeOpenGL, TeeURL,
  TeeSeriesTextEd, Series, TeeChartActions, TeeWorldSeries, TeeVRML3D;

type
  TForm1 = class(TForm)
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TeeCommander1: TTeeCommander;
    Button1: TButton;
    CheckBox1: TCheckBox;
    ComboFlat1: TComboFlat;
    CheckBox2: TCheckBox;
    Label2: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    Label3: TLabel;
    Panel1: TPanel;
    ChartListBox1: TChartListBox;
    Splitter2: TSplitter;
    CheckBox3: TCheckBox;
    CBOutline: TCheckBox;
    StatusBar1: TStatusBar;
    SBZoom: TSpeedButton;
    SpeedButton1: TSpeedButton;
    CBClipOutline: TCheckBox;
    CheckBox4: TCheckBox;
    SpeedButton2: TSpeedButton;
    SpeedButton3: TSpeedButton;
    CheckBox5: TCheckBox;
    CheckBox6: TCheckBox;
    TeeOpenGL1: TTeeOpenGL;
    CBOutlineColor: TCheckBox;
    SeriesTextSource1: TSeriesTextSource;
    CheckBox7: TCheckBox;
    Chart1: TChart;
    Series1: TWorldSeries;
    Series2: TPointSeries;
    ChartTool1: TCursorTool;
    ChartTool2: TMarksTipTool;
    ChartTool3: TAxisScrollTool;
    ChartTool4: TGridBandTool;
    ChartTool5: TLegendScrollBar;
    ChartTool6: TLightTool;
    ChartTool7: TRotateTool;
    ChartTool8: TMarksTipTool;
    Splitter1: TSplitter;
    TabSheet3: TTabSheet;
    ListCities: TListBox;
    ChartTool9: TAnnotationTool;
    CheckBox8: TCheckBox;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure ChartListBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure SBZoomClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure ChartListBox1DblClickSeries(Sender: TChartListBox;
      Index: Integer);
    procedure CBClipOutlineClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure CheckBox4Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure CheckBox5Click(Sender: TObject);
    procedure CheckBox6Click(Sender: TObject);
    procedure CBOutlineClick(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Chart1Resize(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure ListCitiesClick(Sender: TObject);
    procedure Series2Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure CheckBox7Click(Sender: TObject);
    procedure Chart1Scroll(Sender: TObject);
    procedure CheckBox8Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
    Old : Integer;

    {$IFNDEF NOUSE_BDE}
    Table1: TTable;
    {$ENDIF}

    TeeInspector1 : TObjectInspector;

    //InspectorPen,
    //InspectorBrush : TInspectorItem;

    procedure CreateInspector;

    function CurrentCity:Integer;

    Procedure DrawShapeOutline(Index:Integer; XorMode:Boolean=True);
    procedure FillShapes;

    (*
    procedure InspectorBrushChanged(Sender:TObject);
    procedure InspectorColorChanged(Sender:TObject);
    procedure InspectorPenChanged(Sender:TObject);
    procedure InspectorTextChanged(Sender:TObject);
    procedure InspectorTranspChanged(Sender:TObject);
    procedure InspectorVisibleChanged(Sender:TObject);
    procedure InspectorZChanged(Sender:TObject);
    *)

    procedure LoadCityList;
    procedure OutlineShape(Index:Integer);
    procedure RefreshCityArrow;
    procedure ResetCitySize(Ratio:Double);
    procedure SetInspectorItem(ValueIndex:Integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

uses
  TeeSHP, TeeMapSeriesEdit, TeeExport;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

function WhereIsFile(const FileName:String):String;
begin
  if FileExists(FileName) then
     result:=FileName
  else
  if FileExists('Maps\'+FileName) then
     result:='Maps\'+FileName
  else
  if FileExists('..\Maps\'+FileName) then
     result:='..\Maps\'+FileName
  else
     result:='';
end;

// Load a map file and optionally a dBase table with
// map shapes "Z" values.
procedure TForm1.Button1Click(Sender: TObject);

  procedure TryLoadTable;
  var tmp : String;
  begin
    tmp:=WhereIsFile(ChangeFileExt(ComboFlat1.Text,'.dbf'));

    if (tmp<>'') and FileExists(tmp) then
    begin
      {$IFNDEF NOUSE_BDE}
      if not Assigned(Table1) then
      begin
        Table1:=TTable.Create(Self);
        Table1.ReadOnly:=True;
      end;

      Table1.Close;
      Table1.DatabaseName:=ExtractFilePath(tmp);
      Table1.TableName:=ExtractFileName(tmp);
      Table1.Open;
      Table1.First;
      {$ENDIF}
    end;
  end;

  procedure LoadMapFromResource(Series:TMapSeries;
                                const ShpName,ShxName:String);
  var shp : TResourceStream;
      shx : TResourceStream;
  begin
    shp:=TeeResourceStream(ShpName);
    try
      shx:=TeeResourceStream(ShxName);
      try
        LoadMap(Series,shp,shx,{$IFDEF NOUSE_BDE}nil{$ELSE}Table1{$ENDIF},Edit1.Text, Edit2.Text);
      finally
        shx.Free;
      end;
    finally
      shp.Free;
    end;
  end;

  procedure LoadMap;
  begin
    case ComboFlat1.ItemIndex of
      0: LoadMapFromResource(Series1,'TeeWorldShp','TeeWorldShx');
      1: LoadMapFromResource(Series1,'TeeUSAStatesShp','TeeUSAStatesShx');
    else
      LoadMapFromResource(Series1,'TeeSpainShp','TeeSpainShx');
    end;
  end;

var tmpGrad : TCustomTeeGradient;
    Old : {$IFDEF CLR}String{$ELSE}Char{$ENDIF};
begin
  Screen.Cursor:=crHourGlass;
  try
    if CheckBox2.Checked then
    begin
      TryLoadTable;
      try
        LoadMap;
      finally
        {$IFNDEF NOUSE_BDE}
        if Assigned(Table1) then
           Table1.Close;
        {$ENDIF}
      end
    end
    else
      LoadMap;

    // When loading the USA States map, set axes to zoom on 50 USA States
    case ComboFlat1.ItemIndex of
      1: begin
           Chart1.Axes.Left.SetMinMax(24,50);
           Chart1.Axes.Bottom.SetMinMax(-125,-67);
           SeriesTextSource1.Close;
           SeriesTextSource1.FileName:=WhereIsFile('USACities.txt');

           // Force decimal separator character to: ","
           Old:={$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator;

           {$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator:='.';
           try
             SeriesTextSource1.Open;
           finally
             {$IFDEF D15}FormatSettings.{$ENDIF}DecimalSeparator:=Old;
           end;
         end;
      0: begin
           Chart1.Axes.Left.SetMinMax(-90,90);
           Chart1.Axes.Bottom.SetMinMax(-180,180);
           TWorldSeries.AddCities(Series2);
         end;
      else
      begin
        Chart1.Axes.Left.Automatic:=True;
        Chart1.Axes.Bottom.Automatic:=True;
      end;
    end;

    LoadCityList;

    Series2.Pointer.HorizSize := 3;
    Series2.Pointer.VertSize := 3;
    ChartTool9.Visible:=false;

  finally
    ChartListBox1.Sorted:=CheckBox2.Checked;

    Series1.UseColorRange:= Random(100)<50;

    if Series1.UseColorRange then
    begin
      tmpGrad:=TCustomTeeGradient.Create(nil);
      try
        TTeeGradientEditor.DefaultGradient(tmpGrad, True,
                              Random(TeeMaxSampleGradient+1));
        Series1.StartColor:=tmpGrad.StartColor;
        Series1.MidColor:=tmpGrad.MidColor;
        Series1.EndColor:=tmpGrad.EndColor;
      finally
        tmpGrad.Free;
      end;
    end
    else
    begin
      Series1.UsePalette:=True;
      Series1.PaletteStyle:=TTeePaletteStyle(Random(1+Ord(psRainbow)));
    end;

    FillShapes;
    ChartListBox1Click(Self);
    Screen.Cursor:=crDefault;
  end;
end;

// Show or hide the "debug" tab
procedure TForm1.CheckBox1Click(Sender: TObject);
begin
  Series1.Shadow.Visible:=CheckBox1.Checked;

  Series1.Shadow.Size:=3;
  Series1.Shadow.Color:=clDkGray;
  Series1.Shadow.Clip:=True;
  Series1.Shadow.Smooth:=True;
end;

// Add all map shapes to listbox
procedure TForm1.FillShapes;
var t : Integer;
    tmpS : String;
begin
  With ChartListBox1 do
  begin
    ClearItems;

    Items.BeginUpdate;
    try
      for t:=0 to Series1.Shapes.Count-1 do
      begin
        tmpS:=Series1.Labels[t];
        if tmpS='' then tmpS:=IntToStr(t);

        Items.AddObject(tmpS,Series1[t].Points);
      end;
    finally
      Items.EndUpdate;
    end;

    Repaint;
  end;
end;

procedure TForm1.CreateInspector;
begin
  TeeInspector1:=TObjectInspector.Create(Self);

  with TeeInspector1 do
  begin
    Align:=alClient;

    {$IFNDEF CLX}
    DoubleBuffered:=True;
    {$ENDIF}

    Parent:=Panel1;
  end;
end;

// Setup toolbar buttons, axes properties, and
// add all map shapes onto listbox

procedure TForm1.FormCreate(Sender: TObject);
begin
  {$IFNDEF CLX}
  {$IFDEF D6}
  Height:=Min(600,Screen.WorkAreaHeight-20);
  {$ENDIF}
  {$ENDIF}

  Old:=-1;
  StatusBar1.SimpleText:='';

  PageControl1.ActivePage:=TabSheet1;

  {$IFNDEF CLX}
  PageControl1.DoubleBuffered:=True;
  ChartListBox1.DoubleBuffered:=True;
  {$ENDIF}

  {$IFDEF NOUSE_BDE}
  CheckBox2.Enabled:=False;
  {$ENDIF}
  
  CreateInspector;

  TeeDefaultCapacity:=100;

  TeeCommander1.Button3D.Hide;
  TeeCommander1.ButtonDepth.Hide;
  TeeCommander1.ButtonZoom.Hide;
  TeeCommander1.ButtonRotate.Hide;
  TeeCommander1.ButtonMove.Hide;
  TeeCommander1.ButtonSave.Hide;
  TeeCommander1.ButtonNormal.Hide;
  TeeCommander1.RepositionControls;

  Chart1.Axes.FastCalc:=True;  // bypass range checking to improve speed

  Chart1.Axes.Left.Minimum:=-90;
  Chart1.Axes.Left.Maximum:=90;

  Chart1.Axes.Left.AxisValuesFormat:='0'+Char(186);
  Chart1.Axes.Bottom.AxisValuesFormat:='0'+Char(186);

  Chart1.Axes.Left.Grid.Style:=psSolid;
  Chart1.Axes.Left.Grid.Color:=ApplyDark(Chart1.Color,16);
  Chart1.Axes.Left.Grid.SmallDots:=True;

  Chart1.Axes.Bottom.Grid.Style:=psSolid;
  Chart1.Axes.Bottom.Grid.Color:=ApplyDark(Chart1.Color,16);
  Chart1.Axes.Bottom.Grid.SmallDots:=True;

  ChartListBox1.ShowSeriesIcon:=False;
  ChartListBox1.ItemHeight:=20;

  FillShapes;

  {$IFNDEF TEENOTHEMES}
  with TWindowsXPTheme.Create(Chart1) do
  try
    Apply;
  finally
    Free;
  end;
  {$ENDIF}

  Chart1.View3DOptions.Perspective:=175;

  ChartListBox1.Sections[2].Width:=ChartListBox1.ItemHeight;

  LoadCityList;
end;

Procedure TForm1.DrawShapeOutline(Index:Integer; XorMode:Boolean=True);
var P : TPointArray;
begin
  P:=nil;

  if CBOutline.Checked and Series1[Index].Points.Visible then
  with Chart1.Canvas do
  begin
    if XorMode then Pen.Mode:=pmXor
               else Pen.Mode:=pmCopy;

    Pen.Color:=clRed;
    Pen.Style:=psSolid;

    if Series1[Index].Pen.Visible then
       Pen.Width:=Series1[Index].Pen.Width+1
    else
       Pen.Width:=2;

    if CBOutlineColor.Checked then
    begin
      Brush.Style:=bsSolid;
      Brush.Color:=clYellow;
    end
    else
    begin
      Brush.Style:=bsClear;
      Pen.Width:=2;
    end;

    P:=Series1[Index].GetPoints;

    if CBClipOutline.Checked then
       ClipRectangle(Chart1.ChartRect);

    if Chart1.View3D then
    begin
      if Series1[Index].Closed then
         PolygonWithZ(P,Series1.CalcZPos(Index))
      else
         {$IFDEF D4}
         Polyline(P);
         {$ELSE}
         Polyline(P,Series1.CalcZPos(Index));
         {$ENDIF}
    end
    else
      if Series1[Index].Closed then
         Polygon(P)
      else
         Polyline(P);

    if CBClipOutline.Checked then
       UnClipRectangle;
  end;
end;

// Removes previously displayed outline and draws a new outline
// around a map shape
procedure TForm1.OutlineShape(Index:Integer);
begin
  if Index<>Old then
  begin
    if Old<>-1 then DrawShapeOutline(Old);
    Old:=Index;
    if Old<>-1 then DrawShapeOutline(Old);
  end;
end;

// When moving the mouse, determine which shape is under the cursor
// to outline it and to display info at status bar
procedure TForm1.Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
var tmp,
    City : Integer;
    tmpHint,
    CityName : String;
    tmpX, tmpY : Double;
begin
  tmp:=Series1.Clicked(x,y);

  Series1.GetCursorValues(tmpX,tmpY);

  City:=Series2.Clicked(x,y);
  if City<>-1 then
     CityName:=Series2.XLabel[City]
  else
     CityName:='';

  StatusBar1.SimpleText:= Series1.GetVertAxis.LabelValue(tmpY)+' '+
                          Series1.GetHorizAxis.LabelValue(tmpX)+' '+
                          CityName;

  if tmp<>-1 then
     StatusBar1.SimpleText:=StatusBar1.SimpleText+
                   Series1.XLabel[tmp]+' '+FloatToStr(Series1.ZValue[tmp])+
                                       ' ID: '+IntToStr(Series1[tmp].Index);


  if City=-1 then
  begin
    if tmp=-1 then
       tmpHint:=''
    else
    if Series1.XLabel[tmp]='' then tmpHint:=' ID: '+IntToStr(Series1[tmp].Index)
                              else tmpHint:=Series1.XLabel[tmp];

    if Chart1.Hint<>tmpHint then Application.CancelHint;
    Chart1.Hint:=tmpHint;
  end;

  OutlineShape(tmp);
end;

(*
// When the user types text at inspector, change the selected shape text
procedure TForm1.InspectorTextChanged(Sender:TObject);
begin
  with (Sender as TInspectorItem) do
  begin
    (Data as TTeePolygon).Text:=Value;
    ChartListBox1.Items[ChartListBox1.ItemIndex]:=Value;
  end;
end;

// When the user changes the inspector "Color", change the selected shape color
procedure TForm1.InspectorColorChanged(Sender:TObject);
{$IFDEF CLR}
var tmp : Integer;
{$ENDIF}
begin
  with (Sender as TInspectorItem) do
  begin
    {$IFDEF CLR}
    tmp:=Value;
    (Data as TTeePolygon).Color:=tmp;
    {$ELSE}
    (Data as TTeePolygon).Color:=Value;
    {$ENDIF}

    ChartListBox1.Invalidate;
  end;
end;

// When the user clicks the inspector "Visible", change the selected shape visible
procedure TForm1.InspectorVisibleChanged(Sender:TObject);
begin
  with (Sender as TInspectorItem) do
  begin
    (Data as TTeePolygon).Points.Visible:=Value;
    ChartListBox1.Invalidate;
  end;
end;

// When the user clicks the inspector "Transparency", change the selected shape Transparency
procedure TForm1.InspectorTranspChanged(Sender:TObject);
begin
  {$IFNDEF CLR}
  with (Sender as TInspectorItem) do
  begin
    (Data as TTeePolygon).Transparency:=Value;  // CLR: From variant ?
    ChartListBox1.Invalidate;
  end;
  {$ENDIF}
end;

procedure TForm1.InspectorZChanged(Sender:TObject);
begin
  with (Sender as TInspectorItem) do
  begin
    (Data as TTeePolygon).Z:=Value;
    ChartListBox1.Invalidate;
  end;
end;

procedure TForm1.InspectorBrushChanged(Sender:TObject);
begin
  (ChartListBox1.SelectedSeries as TPolygonSeries).Polygon.ParentBrush:=False;
  InspectorBrush.Value:=False;

  ChartListBox1.Invalidate;
end;

procedure TForm1.InspectorPenChanged(Sender:TObject);
begin
  (ChartListBox1.SelectedSeries as TPolygonSeries).Polygon.ParentPen:=False;
  InspectorPen.Value:=False;

  ChartListBox1.Invalidate;
end;
*)

procedure TForm1.SetInspectorItem(ValueIndex:Integer);
var s : TTeePolygon;
// Old : Integer;
begin
  s:=Series1[ValueIndex];

  TeeInspector1.Inspect(s);

  (*
  with TeeInspector1 do
  begin
    Old:=Row;

    Clear;
    Items.BeginUpdate;

    Items.Add(iiPen,'Border',s.Pen,InspectorPenChanged);
    Items.Add(iiBrush,'Brush',s.Brush,InspectorBrushChanged);
    Items.Add(iiColor,'Color',s.Color,s,InspectorColorChanged);
    InspectorPen:=Items.Add(iiBoolean,'Global Border',s.ParentPen);
    InspectorBrush:=Items.Add(iiBoolean,'Global Brush',s.ParentBrush);
    Items.Add(iiGradient,'Gradient',s.Gradient);
    Items.Add(iiString,'Text',s.Text,s,InspectorTextChanged);

    {$IFNDEF CLR}
    Items.Add(iiInteger,'Transparency',s.Transparency,s,InspectorTranspChanged);
    {$ENDIF}

    Items.Add(iiDouble,'Value',s.Z,s,InspectorZChanged);
    Items.Add(iiBoolean,'Visible',s.Points.Visible,s,InspectorVisibleChanged);

    Items.EndUpdate;
    Row:=Old;
  end;
  *)
end;

// When clicking a map shape, select it at listbox
// and display shape's properties at inspector
procedure TForm1.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  SetInspectorItem(ValueIndex);
  ChartListBox1.ItemIndex:=ChartListBox1.Items.IndexOfObject(Series1[ValueIndex].Points);

  if ChartListBox1.CanFocus then
     ChartListBox1.SetFocus;

  Chart1.CancelMouse:=False;
end;

// When user selects a shape at listbox, set shape's properties at inspector
// and outline the shape
procedure TForm1.ChartListBox1Click(Sender: TObject);
var tmp : Integer;
begin
  if ChartListBox1.ItemIndex<>-1 then
  begin
    tmp:=(ChartListBox1.Items.Objects[ChartListBox1.ItemIndex] as TPolygonSeries).Polygon.Index;
    OutLineShape(tmp);
    SetInspectorItem(tmp);
  end;
end;

procedure TForm1.CheckBox3Click(Sender: TObject);
begin
  Chart1.Tools.Active:=CheckBox3.Checked;
end;

procedure TForm1.Chart1AfterDraw(Sender: TObject);
begin
  if Old<>-1 then DrawShapeOutline(Old);
end;

// After zooming, make sure both the vertical and horizontal axes
// are "isometric", that is, both have an equal pixel to value size
procedure MakeIsoAxis(AChart:TCustomChart);
var tmpX,
    tmpY,
    XRange,
    YRange,
    Offset,
    XYScreen : Double;
begin
  With AChart do
  if (ChartHeight>0) and (ChartWidth>0) then
  begin
    With BottomAxis do XRange:=Maximum-Minimum;
    With LeftAxis do YRange:=Maximum-Minimum;

    {$IFDEF CLX}
    XYScreen:=1024.0/768.0;
    {$ELSE}
    XYScreen:=1.0*(GetDeviceCaps(Canvas.Handle,HORZSIZE)/Screen.Width)/
                  (GetDeviceCaps(Canvas.Handle,VERTSIZE)/Screen.Height);
    {$ENDIF}

    tmpX:=(XRange/ChartWidth);
    tmpY:=(YRange/ChartHeight)*XYScreen;

    if tmpX>tmpY then
    begin
      if tmpY<>0 then
      begin
        Offset:=((YRange*tmpX/tmpY)-YRange)*0.5;
        With LeftAxis do SetMinMax(Minimum-Offset,Maximum+Offset);
      end;
    end
    else
    if tmpX<>0 then
    begin
      Offset:=((XRange*tmpY/tmpX)-XRange)*0.5;
      With BottomAxis do SetMinMax(Minimum-Offset,Maximum+Offset);
    end;
  end;
end;

procedure TForm1.RefreshCityArrow;
var tmp : Integer;
begin
  if ChartTool9.Visible then
  begin
    Chart1.Axes.Left.AdjustMaxMin;
    Chart1.Axes.Bottom.AdjustMaxMin;

    tmp:=CurrentCity;

    if tmp<>-1 then
    begin
      ChartTool9.Callout.XPosition:=Series2.CalcXPos(tmp);
      ChartTool9.Callout.YPosition:=Series2.CalcYPos(tmp);
    end;
  end;
end;

// After zooming, set axes isometric
procedure TForm1.Chart1Zoom(Sender: TObject);
begin
  MakeIsoAxis(Chart1);

  if ComboFlat1.ItemIndex=1 then ResetCitySize(10)
                            else ResetCitySize(36);

  RefreshCityArrow;
end;

procedure TForm1.ResetCitySize(Ratio: double);
begin
  //Zoom Series2 Marks as Chart Zooms
  Chart1.Axes.Bottom.AdjustMaxMin;

  with Series2.Pointer do
  begin
     HorizSize:=Max(3,Chart1.Axes.Bottom.CalcSizeValue(0.1));
     VertSize:=HorizSize;
  end;
end;

procedure TForm1.ComboFlat1Change(Sender: TObject);
begin
  case ComboFlat1.ItemIndex of
    0: begin Edit1.Text:='CNTRY_NAME'; Edit2.Text:='POP_CNTRY'; end;
    1: begin Edit1.Text:='STATE'; Edit2.Text:=''; end;
  end;
end;

procedure TForm1.SBZoomClick(Sender: TObject);
begin
  Chart1.ZoomPercent(110);
end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Chart1.ZoomPercent(90);
end;

// When double-clicking a shape at the listbox, show the
// Map Series editor dialog with this shape selected
procedure TForm1.ChartListBox1DblClickSeries(Sender: TChartListBox;
  Index: Integer);
begin
  with TMapSeriesEditor.Create(Self) do
  try
    Tag:=ObjectToTag(Series1);
    InitialShape:=Sender.SelectedSeries;

    {$IFDEF D5}
    if Assigned(Owner) then Position:=poOwnerFormCenter
    else
    {$ENDIF}
      Position:=poScreenCenter;

    ShowModal;
  finally
    Free;
  end;
end;

procedure TForm1.CBClipOutlineClick(Sender: TObject);
begin
  Chart1.Invalidate;
end;

procedure TForm1.FormShow(Sender: TObject);
begin
  Button1Click(Self);

  {$IFDEF CLX}
  ChartListBox1.Selected[0]:=True;
  {$ENDIF}
end;

procedure TForm1.CheckBox4Click(Sender: TObject);
begin
  ChartTool6.Active:=CheckBox4.Checked;
end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
  Chart1.View3D:=SpeedButton2.Down;
  SpeedButton3.Enabled:=SpeedButton2.Down;

  if not SpeedButton2.Down then
     SpeedButton3.Down:=False;

  ChartTool7.Active:=SpeedButton3.Down;
end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
  Chart1.View3DOptions.Orthogonal:=not SpeedButton3.Down;

  ChartTool7.Active:=SpeedButton3.Down;
end;

procedure TForm1.CheckBox5Click(Sender: TObject);
begin
  Series1.Marks.DrawEvery:=100;
  Series1.Marks.Visible:=CheckBox5.Checked;
end;

procedure TForm1.CheckBox6Click(Sender: TObject);
begin
  Chart1.Legend.Visible:=CheckBox6.Checked;

  if Chart1.Legend.Visible then
  begin
    Series1.UsePaletteMin:=True;
    Series1.PaletteMin:=0;
    Series1.PaletteSteps:=21;
    Series1.PaletteStep:=TeeSHPMaxRandom div 20;
  end;
end;

procedure TForm1.CBOutlineClick(Sender: TObject);
begin
  CBOutlineColor.Enabled:=CBOutline.Checked;
end;

procedure TForm1.Chart1UndoZoom(Sender: TObject);
begin
  if ComboFlat1.ItemIndex=1 then
  begin
    Chart1.Axes.Left.SetMinMax(24,50);
    Chart1.Axes.Bottom.SetMinMax(-125,-67);
  end;

  Series2.Pointer.HorizSize := 3;
  Series2.Pointer.VertSize := 3;

  RefreshCityArrow;
end;

procedure TForm1.Chart1Resize(Sender: TObject);
begin
  ResetCitySize(36);
  RefreshCityArrow;
end;

procedure TForm1.PageControl1Change(Sender: TObject);
begin
  LoadCityList;
end;

procedure TForm1.LoadCityList;
var t : Integer;
begin
  ListCities.Clear;
  if CheckBox7.Checked then
  begin
    ListCities.Sorted:=False;

    for t:=0 to Series2.Count-1 do
        ListCities.Items.AddObject(Series2.XLabel[t],TObject(t));

    ListCities.Sorted:=True;
  end;
end;

function TForm1.CurrentCity:Integer;
begin
  result:= Integer(ListCities.Items.Objects[ListCities.ItemIndex] );
end;

procedure TForm1.ListCitiesClick(Sender: TObject);
var tmp : Integer;
begin
  tmp:=CurrentCity;
  ChartTool9.Text:=Series2.XLabel[ tmp ];
  ChartTool9.Visible:=True;
  ChartTool9.Callout.XPosition:=Series2.CalcXPos(tmp);
  ChartTool9.Callout.YPosition:=Series2.CalcYPos(tmp);
  ChartTool9.Callout.Arrow.Show;
end;

procedure TForm1.Series2Click(Sender: TChartSeries; ValueIndex: Integer;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  if ListCities.Items.Count>0 then
  begin
    ListCities.ItemIndex:=ListCities.Items.IndexOf(Series2.XLabel[ValueIndex]);
    ListCitiesClick(Self);
  end;
end;

procedure TForm1.CheckBox7Click(Sender: TObject);
begin
  Series2.Visible:=CheckBox7.Checked;

  if not CheckBox7.Checked then
  begin
    ChartTool9.Visible:=False;
    PageControl1.ActivePage:=TabSheet1;
  end
  else
  begin  
    PageControl1.ActivePage:=TabSheet3;
    LoadCityList;
  end;
end;

procedure TForm1.Chart1Scroll(Sender: TObject);
begin
  RefreshCityArrow;
end;

procedure TForm1.CheckBox8Click(Sender: TObject);

  function RandomColor:TColor;
  begin
    result:=RGB(Random(255),Random(255),Random(255));
  end;

var t : Integer;
begin
  for t:=0 to Series1.Shapes.Count-1 do
  with Series1[t].Gradient do
  if CheckBox8.Checked then
  begin
    Visible:=True;
    StartColor:=RandomColor;
    EndColor:=RandomColor;
    MidColor:=RandomColor;
    Direction:=TGradientDirection(Random(Ord(gdDiagonalDown)));
  end
  else
    Visible:=False;
end;

procedure TForm1.Button2Click(Sender: TObject);
var SVG : TSVGExportFormat;
begin
  SVG:=TSVGExportFormat.Create;
  try
    SVG.Groups:=True;
  finally
    SVG.Free;
  end;
end;

end.
