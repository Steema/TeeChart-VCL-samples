unit UnitMain_Office;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMX.Menus, FMXTee.Engine, FMXTee.Procs, FMXTee.Chart, FMX.TabControl,
  FMX.Layouts, FMXTee.Chart.GalleryPanel, FMXTee.Commander, FMXTee.Series,
  FMXTee.Series.Donut, FMXTee.Series.Candle,
  //FMXTee.Series.MyPoint,
  FMXTee.Series.Pyramid, FMXTee.Series.HighLowLine, FMXTee.Functions.Stats,
  FMXTee.Series.Polar, FMX.ListBox, FMXTee.Chart.ListBox, System.Rtti,
  FMXTee.Print.PreviewPanel, FMX.Grid, FMXTee.Chart.Grid,
  FMXTee.Store, FMXTee.Editor.Stroke,
  FMXTee.Editor.Pro, FMXTee.Series.World, FMX.Objects, FMXTee.Animations.Tools,
  FMXTee.Tools.Surface, FMXTee.Tools, FMXTee.Tools.LegendPalette,
  FMXTee.Series.Surface, FMXTee.Languages.Translate,

  FMXTee.Languages.Spanish, FMXTee.Languages.German, FMXTee.Languages.Danish,
  FMXTee.Languages.Swedish, FMXTee.Languages.Dutch, FMXTee.Languages.Catalan,
  FMXTee.Languages.Chinese, FMXTee.Languages.ChineseSimp, FMXTee.Languages.French,
  FMXTee.Languages.Brazil, FMXTee.Languages.Portuguese,
  FMXTee.Languages.Russian, FMXTee.Languages.Italian, FMXTee.Languages.Slovene,
  FMXTee.Languages.Norwegian, FMXTee.Languages.Turkish, FMXTee.Languages.Polish,
  FMXTee.Languages.Japanese, FMXTee.Languages.Hungarian, FMXTee.Languages.Galician,
  FMXTee.Languages.Arabic, FMXTee.Languages.Hebrew,
  FMXTee.Languages.Ukrainian, FMXTee.Languages.Korean, FMXTee.Languages.Indonesian,
  FMXTee.Languages.Finnish,
  FMXTee.Languages.Slovak, FMXTee.Languages.Hellenic, FMXTee.Languages.Romanian,
  FMXTee.Languages.Serbian, FMXTee.Languages.Farsi, FMXTee.Languages.Czech,
  FMXTee.Languages.Hindi, FMXTee.Languages.Urdu,
  FMXTee.ProConstants,

  FMXTee.Editor.Languages
  ;

type
  TMainOffice = class(TForm)
    MainMenu1: TMainMenu;
    MenuItem1: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MenuItem4: TMenuItem;
    MenuItem5: TMenuItem;
    MenuItem6: TMenuItem;
    ToolBar1: TToolBar;
    Layout1: TLayout;
    LayoutGallery: TLayout;
    TabControl1: TTabControl;
    TabItem1: TTabItem;
    Chart1: TChart;
    MenuItem7: TMenuItem;
    MenuItem8: TMenuItem;
    MenuItem9: TMenuItem;
    MenuItem10: TMenuItem;
    MenuSave: TMenuItem;
    MenuSaveAs: TMenuItem;
    ChartGalleryPanel1: TChartGalleryPanel;
    StatusBar1: TStatusBar;
    TeeCommander1: TTeeCommander;
    Series1: TBarSeries;
    TabSeries: TTabControl;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    TabItem2: TTabItem;
    ChartListBox1: TChartListBox;
    SeriesItem1: TListBoxItem;
    TabItem3: TTabItem;
    ChartGrid1: TChartGrid;
    Column1: TColumn;
    Column2: TColumn;
    Column3: TColumn;
    TabItem4: TTabItem;
    TeePreviewPanel1: TTeePreviewPanel;
    MenuViewGallery: TMenuItem;
    MenuViewSeries: TMenuItem;
    MenuItem11: TMenuItem;
    SaveDialog1: TSaveDialog;
    TabChart: TTabItem;
    TabWelcome: TTabItem;
    TabFunctions: TTabItem;
    TabSamples: TTabItem;
    WelcomeChart: TChart;
    SurfaceSeries1: TSurfaceSeries;
    ChartTool4: TAnnotationTool;
    ChartTool1: TLegendPaletteTool;
    ChartTool2: TRotateTool;
    ChartTool3: TSurfaceNearestTool;
    ChartAnimation1: TTeeAnimationTool;
    Layout2: TLayout;
    CBShowWelcome: TCheckBox;
    Text1: TText;
    MainTab: TTabControl;
    Layout3: TLayout;
    CBLanguage: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure MenuViewGalleryClick(Sender: TObject);
    procedure MenuItem7Click(Sender: TObject);
    procedure MenuSaveClick(Sender: TObject);
    procedure MenuItem11Click(Sender: TObject);
    procedure MenuSaveAsClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Text1Click(Sender: TObject);
    procedure MainTabChange(Sender: TObject);
    procedure MenuViewSeriesClick(Sender: TObject);
    procedure CBLanguageChange(Sender: TObject);
  private
    { Private declarations }
    FileName : String;
    Dirty : Boolean;

    procedure TrySave;
  public
    { Public declarations }
  end;

var
  MainOffice: TMainOffice;

implementation

{$R *.fmx}

{ Similar to TeeChartPro.pas, but with "Office" constants }
Procedure TeeSetLanguage(English:Boolean);
begin
  Case TeeLanguageRegistry of
    1: TeeSetBrazil;
    2: TeeSetCatalan;
    3: TeeSetChineseSimp;
    4: TeeSetChinese;
    5: TeeSetDanish;
    6: TeeSetDutch;
    7: TeeSetFrench;
    8: TeeSetGerman;
    9: TeeSetItalian;
   10: TeeSetPortuguese;
   11: TeeSetRussian;
   12: TeeSetSpanish;
   13: TeeSetSwedish;
   14: TeeSetNorwegian;
   15: TeeSetJapanese;
   16: TeeSetPolish;
   17: TeeSetSlovene;
   18: TeeSetTurkish;
   19: TeeSetHungarian;
   20: TeeSetGalician;
   21: TeeSetArabic;
   22: TeeSetHebrew;
   23: TeeSetUkrainian;
   24: TeeSetKorean;
   25: TeeSetIndonesian;
   26: TeeSetFinnish;
   27: TeeSetSlovak;
   28: TeeSetHellenic;
   29: TeeSetRomanian;
   30: TeeSetSerbian;
   31: TeeSetFarsi;
   32: TeeSetCzech;
   33: TeeSetHindi;
   34: TeeSetUrdu;
  else
    if English then TeeSetEnglish;
  end;
end;

procedure TMainOffice.CBLanguageChange(Sender: TObject);
var OldLang : Integer;
begin
  OldLang:=TeeLanguageRegistry;

  TeeLanguageSaveRegistry(Integer(CBLanguage.Items.Objects[CBLanguage.ItemIndex]));

  if OldLang=0 then
  begin
    TeeSetLanguage(False);
    TeeTranslateControl(Self);
  end
  else
  begin
    ChartAnimation1.Stop; // <-- We need to stop, or the next ShowMessage gets hidden at background

    ShowMessageUser('Please close and restart the application.');
  end;
end;

procedure TMainOffice.ChartGalleryPanel1ChangeChart(Sender: TObject);
var tmp : TChartSeries;
begin
  if Chart1.SeriesCount>0 then
  begin
    tmp:=Chart1[0];
    ChangeSeriesType(tmp,TChartSeriesClass(ChartGalleryPanel1.SelectedChart[0].ClassType));
  end;
end;

function YesNoCancel(const Message:String):TModalResult;
begin
  result:= MessageDlg(Message, TMsgDlgType.mtConfirmation, mbYesNoCancel, 0);
end;

procedure TMainOffice.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin
  if Dirty then
     case YesNoCancel('Do you want to save chart?') of
       mrYes: MenuSaveClick(Self);
       mrNo: Exit;
     end;

  CanClose:=not Dirty;
end;

procedure TMainOffice.FormCreate(Sender: TObject);

  procedure PrepareLanguages;
  begin
    with TAskLanguage.Create(nil) do
    try
      Self.CBLanguage.Items:=LBLangs.Items;
      Self.CBLanguage.ItemIndex:=LBLangs.ItemIndex;
    finally
      Free;
    end;
  end;

var t : Integer;
    tmp : TGalleryChart;
begin
  SurfaceSeries1.FillSampleValues(30);

  MainTab.ActiveTab:=TabWelcome;

  PrepareLanguages;

  // Gallery

  ChartGalleryPanel1.NumCols:=1;

  ChartGalleryPanel1.CreateChartList([TLineSeries,TBarSeries,THorizBarSeries,TPieSeries,
    TPointSeries,THorizLineSeries,TDonutSeries,
    //TBarJoinSeries,
    TVolumeSeries,
    TFastLineSeries,TAreaSeries,THistogramSeries,TPyramidSeries,
    TPolarSeries,TRadarSeries,THorizAreaSeries]);

  for t := 0 to ChartGalleryPanel1.Charts.Count-1 do
  begin
    tmp:=ChartGalleryPanel1[t];
    tmp.Axes.Hide;
    tmp.Title.Hide;
    tmp.View3DOptions.Zoom:=80;
  end;

  ChartGalleryPanel1.SelectedChart:=ChartGalleryPanel1[1];

  Dirty:=True;
end;

procedure TMainOffice.FormShow(Sender: TObject);
begin
  ChartGrid1.RecalcDimensions;
end;

procedure TMainOffice.MainTabChange(Sender: TObject);
begin
  if MainTab.ActiveTab=TabChart then
     MainMenu1.Parent:=Self
  else
     MainMenu1.Parent:=nil;

  if MainTab.ActiveTab=TabFunctions then
  begin
    if not Assigned(IFunctions) then
    begin

    end;
  end;
end;

procedure TMainOffice.MenuItem11Click(Sender: TObject);
begin
  Close;
end;

procedure TMainOffice.MenuItem7Click(Sender: TObject);
begin
  TrySave;

  Chart1.ClearChart;

  Dirty:=False;
end;

procedure TMainOffice.MenuSaveAsClick(Sender: TObject);
begin
  if SaveDialog1.Execute then
  begin
    SaveChartToFile(Chart1,SaveDialog1.FileName);
    FileName:=SaveDialog1.FileName;
    Dirty:=False;
  end;
end;

procedure TMainOffice.MenuSaveClick(Sender: TObject);
begin
  if FileName='' then
     MenuSaveAsClick(Self)
  else
  begin
    SaveChartToFile(Chart1,FileName);
    Dirty:=False;
  end;
end;

procedure TMainOffice.MenuViewGalleryClick(Sender: TObject);
begin
  MenuViewGallery.IsChecked:=not MenuViewGallery.IsChecked;
  LayoutGallery.Visible:=MenuViewGallery.IsChecked;
end;

procedure TMainOffice.MenuViewSeriesClick(Sender: TObject);
begin
  MenuViewSeries.IsChecked:=not MenuViewSeries.IsChecked;
  TabSeries.Visible:=MenuViewSeries.IsChecked;
end;

procedure TMainOffice.Text1Click(Sender: TObject);
begin
  MainTab.ActiveTab:=TabChart;
end;

procedure TMainOffice.TrySave;
begin
  if Dirty then
     MenuSaveClick(Self);
end;

end.
