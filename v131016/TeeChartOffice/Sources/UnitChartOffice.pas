{**********************************************}
{   TeeChart Office                            }
{   Copyright (c) 2001-2013 by David Berneda   }
{   All Rights Reserved.                       }
{**********************************************}
unit UnitChartOffice;
{$I TeeDefs.inc}

interface

{$IFNDEF CLX}
{$IFDEF D7}
{$IFNDEF D16}
{$IFNDEF CLR}
{.$DEFINE TEEUSEMENUACTIONS}
{$ENDIF}
{$ENDIF}
{$ENDIF}
{$ENDIF}

{$IFDEF WIN64}
{$DEFINE NOUSE_BDE} // No BDE available for x64
{$ENDIF}

uses
  {$IFNDEF LINUX}
  Windows, Messages, Registry,
  {$ENDIF}
  SysUtils, Classes,

  {$IFDEF CLR}
  Variants,
  {$ENDIF}

  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls, QGrids,
  QComCtrls, QImgList, QMenus, Types, Qt,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,
  ComCtrls, ToolWin, ImgList, Menus,
  {$IFDEF D9}
  Types,
  {$ENDIF}
  {$ENDIF}

  {$IFDEF D16}
  Vcl.Themes,
  Vcl.Styles,
  {$ENDIF}

  {$IFDEF D17}
  System.UITypes,
  {$ENDIF}

  { TeeChart Units }
  TeeProcs, TeEngine, Chart, DBChart, Series, TeePrevi, TeeURL, TeeEdit,
  TeeComma, TeeEdiGene, TeeGalleryPanel, TeeNavigator, TeeChartGrid,
  TeeInspector, TeCanvas, TeeLisB,

  {$IFNDEF LINUX}
  {$IFNDEF CLR}
  TeeOpenGL,
  {$ENDIF}
  {$ENDIF}

  {$IFDEF D7}
  {$IFNDEF D10}
  XPMan,
  {$ENDIF}
  {$ENDIF}

  TeePreviewPanel,
  TeeEdiSeri,
  TeeSelectorTool, TeeRecentFiles, TeeConfig, TeeTools,

  {$IFDEF D7}
  TeeGDIPlusEditor,
  {$ELSE}
    {$IFNDEF BCB}
    TeeGDIPlusEditor,
    {$ENDIF}
  {$ENDIF}

  TeeThemeEditor,

  {$IFNDEF CLR}
  TeeExpression,
  TeeAxisDivider,
  {$ENDIF}

  TeeExtraLegendTool, TeeSurfaceTool, TeeDataTableEditor,

  {$IFDEF CLR}
  System.ComponentModel,
  {$ENDIF}

  {$IFDEF TEEUSEMENUACTIONS}
  TeeMenuActions,
  {$ENDIF}

  TeeLighting, TeeLegendScrollbar, TeeDesignOptions, TeeFilters, 
  TeeToolsGalleryDemos, TeeWorldSeriesEditor, TeeGDIPlus,
  TeeClusteringToolEditor,
  TeeAnimate, TeeAnimations, TeeSurfa, TeeLegendPalette;

type
  {$IFDEF CLX}
  TCustomRichEdit=TMemo;
  TRichEdit=TCustomRichEdit;
  {$ENDIF}

  TEnableJustify=(ejNo,ejAll,ejNoCenter);

  TMainForm = class(TForm)
    MainMenu1: TMainMenu;
    File1: TMenuItem;
    Edit1: TMenuItem;
    View1: TMenuItem;
    Help1: TMenuItem;
    About1: TMenuItem;
    New1: TMenuItem;
    Open1: TMenuItem;
    Reopen1: TMenuItem;
    Save1: TMenuItem;
    Saveas1: TMenuItem;
    Export1: TMenuItem;
    Print1: TMenuItem;
    N1: TMenuItem;
    Exit1: TMenuItem;
    N2: TMenuItem;
    N3: TMenuItem;
    PrintPreview1: TMenuItem;
    ImageList1: TImageList;
    ChartEditor1: TChartEditor;
    ChartPreviewer1: TChartPreviewer;
    ChartWebSource1: TChartWebSource;
    PopupMenuCommander: TPopupMenu;
    Configure1: TMenuItem;
    ChartProperties1: TMenuItem;
    Legend1: TMenuItem;
    Axes1: TMenuItem;
    Sendto1: TMenuItem;
    StatusBar1: TStatusBar;
    LocalMenu: TPopupMenu;
    AddItem: TMenuItem;
    DeleteItem: TMenuItem;
    Change1: TMenuItem;
    CloneItem: TMenuItem;
    Title1: TMenuItem;
    MenuItem1: TMenuItem;
    SelectAllItem: TMenuItem;
    MenuItem2: TMenuItem;
    MenuItem3: TMenuItem;
    MoveUp1: TMenuItem;
    MoveDown1: TMenuItem;
    ImageListSeries: TImageList;
    OpenDialog1: TOpenDialog;
    ImageList3: TImageList;
    N4: TMenuItem;
    TeeChartHelp1: TMenuItem;
    TeeChartWeb1: TMenuItem;
    ChartTools1: TMenuItem;
    N5: TMenuItem;
    OpenGL1: TMenuItem;
    NewusingWizard1: TMenuItem;
    N6: TMenuItem;
    HideSerieslist1: TMenuItem;
    N7: TMenuItem;
    Serieslist1: TMenuItem;
    Inspector1: TMenuItem;
    PopupMenuInspector: TPopupMenu;
    Hideinspector1: TMenuItem;
    SaveDialog1: TSaveDialog;
    ImportfromWeb1: TMenuItem;
    Panel4: TPanel;
    Gallery1: TMenuItem;
    Statusbar2: TMenuItem;
    TimerStatus: TTimer;
    N8: TMenuItem;
    Toolbars1: TMenuItem;
    Standard1: TMenuItem;
    Font1: TMenuItem;
    Page1: TMenuItem;
    PopupMenuToolbar: TPopupMenu;
    AligntoTop1: TMenuItem;
    AligntoBottom1: TMenuItem;
    PopupMenuGallery: TPopupMenu;
    View3D1: TMenuItem;
    Copy1: TMenuItem;
    N9: TMenuItem;
    Data1: TMenuItem;
    Titles1: TMenuItem;
    Hide1: TMenuItem;
    SeriesToolBarItem: TMenuItem;
    PopupLegend: TPopupMenu;
    Visible1: TMenuItem;
    UseSeriesColor1: TMenuItem;
    Inverted1: TMenuItem;
    Checkboxes1: TMenuItem;
    N10: TMenuItem;
    Dividinglines1: TMenuItem;
    Position1: TMenuItem;
    Right1: TMenuItem;
    Left1: TMenuItem;
    Top1: TMenuItem;
    Bottom1: TMenuItem;
    Style1: TMenuItem;
    N11: TMenuItem;
    LegendGradient: TMenuItem;
    LegendTransparent: TMenuItem;
    Symbols1: TMenuItem;
    Left2: TMenuItem;
    Right2: TMenuItem;
    N12: TMenuItem;
    Continous1: TMenuItem;
    Seriesnames1: TMenuItem;
    Values1: TMenuItem;
    Lastvalues1: TMenuItem;
    PopupMenuTitle: TPopupMenu;
    TitleVisible: TMenuItem;
    Alignment1: TMenuItem;
    TitleLeft: TMenuItem;
    TitleCenter: TMenuItem;
    TitleRight: TMenuItem;
    N13: TMenuItem;
    TitleTransparent: TMenuItem;
    TitleGradient: TMenuItem;
    TitleShadow: TMenuItem;
    TitleBorder: TMenuItem;
    N14: TMenuItem;
    TitleAutosize: TMenuItem;
    LegendBorder: TMenuItem;
    Color1: TMenuItem;
    Text1: TMenuItem;
    PopupMenuPanel: TPopupMenu;
    PanelColor: TMenuItem;
    PanelBackimage: TMenuItem;
    PanelGradient: TMenuItem;
    N15: TMenuItem;
    PanelBorder: TMenuItem;
    Edit2: TMenuItem;
    OnlineSupport1: TMenuItem;
    N16: TMenuItem;
    Tools1: TMenuItem;
    Options1: TMenuItem;
    PopupMenuAnn: TPopupMenu;
    Transparent1: TMenuItem;
    EditAnnotation: TMenuItem;
    AnnColor: TMenuItem;
    AnnBorder: TMenuItem;
    AnnGradient: TMenuItem;
    N17: TMenuItem;
    Delete1: TMenuItem;
    Position2: TMenuItem;
    LeftTop1: TMenuItem;
    LeftBottom1: TMenuItem;
    RightTop1: TMenuItem;
    RightBottom1: TMenuItem;
    N18: TMenuItem;
    Custom1: TMenuItem;
    N19: TMenuItem;
    PopupMenuMarks: TPopupMenu;
    Edit4: TMenuItem;
    N20: TMenuItem;
    MarksBorder: TMenuItem;
    Arrow1: TMenuItem;
    Color3: TMenuItem;
    MarksGradient: TMenuItem;
    Transparent2: TMenuItem;
    ShowHints1: TMenuItem;
    PopupMenuAxis: TPopupMenu;
    Edit5: TMenuItem;
    N21: TMenuItem;
    Labels1: TMenuItem;
    Inverted2: TMenuItem;
    Ticks1: TMenuItem;
    Grid1: TMenuItem;
    Axisline1: TMenuItem;
    ImageListTabs: TImageList;
    AutoSize1: TMenuItem;
    N22: TMenuItem;
    Hide2: TMenuItem;
    Tools2: TMenuItem;
    N23: TMenuItem;
    N24: TMenuItem;
    Updateversion1: TMenuItem;
    Color4: TMenuItem;
    Rightside1: TMenuItem;
    PopupMenuSeries: TPopupMenu;
    Edit6: TMenuItem;
    N25: TMenuItem;
    Visible2: TMenuItem;
    ShowMarks1: TMenuItem;
    ShowatLegend1: TMenuItem;
    Coloreach1: TMenuItem;
    Title2: TMenuItem;
    Color5: TMenuItem;
    Datasource1: TMenuItem;
    Datasource2: TMenuItem;
    LegendFont: TMenuItem;
    Frame1: TMenuItem;
    Shadow1: TMenuItem;
    CustomPosition1: TMenuItem;
    AxisFont: TMenuItem;
    Visible3: TMenuItem;
    SeriesPopupSep: TMenuItem;
    PopupLine: TPopupMenu;
    PopupLineBorder: TMenuItem;
    PopupLinePattern: TMenuItem;
    PopupLineStairs: TMenuItem;
    PopupLineInverted: TMenuItem;
    MarksStyle: TMenuItem;
    Label1: TMenuItem;
    Value1: TMenuItem;
    Percent1: TMenuItem;
    LabelPercent1: TMenuItem;
    LabelValue1: TMenuItem;
    Legend2: TMenuItem;
    PercentTotal1: TMenuItem;
    LabelPercentTotal1: TMenuItem;
    XValue1: TMenuItem;
    XY1: TMenuItem;
    PopupMenuWall: TPopupMenu;
    Edit3: TMenuItem;
    N26: TMenuItem;
    WallColor: TMenuItem;
    WallBorder: TMenuItem;
    WallGradient: TMenuItem;
    WallTransparent: TMenuItem;
    WallVisible: TMenuItem;
    WallDark3D: TMenuItem;
    PopupBar: TPopupMenu;
    BarBorder: TMenuItem;
    BarPattern: TMenuItem;
    BarStyleItem: TMenuItem;
    BarRectangle: TMenuItem;
    BarEllipse: TMenuItem;
    BarUseOrigin: TMenuItem;
    BarPyramid: TMenuItem;
    BarInvertPyramid: TMenuItem;
    BarCyllinder: TMenuItem;
    BarArrow: TMenuItem;
    BarGradientStyle: TMenuItem;
    BarCone: TMenuItem;
    BarGradient: TMenuItem;
    BarWidthItem: TMenuItem;
    AxisMinorGrid: TMenuItem;
    AxisVisible: TMenuItem;
    BarSideMargins: TMenuItem;
    PopupPie: TPopupMenu;
    PieBorder: TMenuItem;
    PiePatterns: TMenuItem;
    PieDark3D: TMenuItem;
    PieCircled: TMenuItem;
    PieRotation: TMenuItem;
    PopupFastLine: TPopupMenu;
    FastLineBorder: TMenuItem;
    PopupPoint: TPopupMenu;
    PointBorder: TMenuItem;
    PointDraw3D: TMenuItem;
    PointDark: TMenuItem;
    PointStyleItem: TMenuItem;
    PointWidth: TMenuItem;
    PointHeight: TMenuItem;
    Rectangle1: TMenuItem;
    Circle1: TMenuItem;
    Triangle1: TMenuItem;
    DownTriangle1: TMenuItem;
    Cross1: TMenuItem;
    DiagonalCross1: TMenuItem;
    Star1: TMenuItem;
    Diamond1: TMenuItem;
    Smalldot1: TMenuItem;
    Textmode1: TMenuItem;
    PanelView3D: TMenuItem;
    GrayScale1: TMenuItem;
    Colors1: TMenuItem;
    GrayScale2: TMenuItem;
    Monochrome1: TMenuItem;
    GrayScaleVisual1: TMenuItem;
    InvertedGrayScale1: TMenuItem;
    PopupLineOutline: TMenuItem;
    LabelsFormat1: TMenuItem;
    dataTop: TMenuItem;
    dataBottom: TMenuItem;
    N27: TMenuItem;
    Hide3: TMenuItem;
    PopupTabs: TPopupMenu;
    LeftTab: TMenuItem;
    TopTab: TMenuItem;
    RightTab: TMenuItem;
    BottomTab: TMenuItem;
    PanelTabs: TPanel;
    Bevel1: TMenuItem;
    Lower1: TMenuItem;
    Raise1: TMenuItem;
    None1: TMenuItem;
    MarksFont: TMenuItem;
    TitleFont: TMenuItem;
    AnnoFont: TMenuItem;
    PopupToolSeries: TPopupMenu;
    TopToolBar: TMenuItem;
    Bottom2: TMenuItem;
    Whatsthis1: TMenuItem;
    Borders1: TMenuItem;
    PopupMenuGrid: TPopupMenu;
    Top2: TMenuItem;
    N28: TMenuItem;
    AlignGrid1: TMenuItem;
    Top3: TMenuItem;
    Bottom3: TMenuItem;
    Left3: TMenuItem;
    Right3: TMenuItem;
    Options2: TMenuItem;
    Smooth1: TMenuItem;
    Symbol1: TMenuItem;
    DataSources1: TMenuItem;
    Small1: TMenuItem;
    PopupData: TPopupMenu;
    EditColor1: TMenuItem;
    DefaultColor1: TMenuItem;
    Makenullpoint1: TMenuItem;
    MenuItem4: TMenuItem;
    Insertrow1: TMenuItem;
    Deleterow1: TMenuItem;
    MenuItem5: TMenuItem;
    extfont1: TMenuItem;
    FullScreen1: TMenuItem;
    Themes1: TMenuItem;
    Hexagon1: TMenuItem;
    Donut1: TMenuItem;
    LeftTriangle1: TMenuItem;
    RightTriangle1: TMenuItem;
    Nothing1: TMenuItem;
    Visual1: TMenuItem;
    MainPage: TPageControl;
    TabSheet1: TTabSheet;
    Panel1: TPanel;
    Splitter2: TSplitter;
    PageControlSeries: TPageControl;
    PanelSeries: TTabSheet;
    ChartListBox1: TChartListBox;
    ToolBar1: TToolBar;
    SBAdd: TToolButton;
    SBDelete: TToolButton;
    ToolButton3: TToolButton;
    TBMoveUp: TToolButton;
    TBMoveDown: TToolButton;
    ToolButton6: TToolButton;
    SBEdit: TToolButton;
    ToolButton2: TToolButton;
    SBFont: TToolButton;
    TabDataSources: TTabSheet;
    ToolBar2: TToolBar;
    SBNewDataSource: TToolButton;
    SBDeleteSource: TToolButton;
    ToolButton9: TToolButton;
    SBEditSource: TToolButton;
    ToolButton11: TToolButton;
    SBRenameSource: TToolButton;
    LBSources: TListBox;
    PanelInspector: TPanel;
    Panel2: TPanel;
    ComboBoxParts: TComboFlat;
    Inspector: TTeeInspector;
    ChartGalleryPanel1: TChartGalleryPanel;
    SplitterGallery: TSplitter;
    PageControl1: TPageControl;
    TabDesign: TTabSheet;
    ScrollBox2: TScrollBox;
    DBChart1: TDBChart;
    TabData: TTabSheet;
    ChartGrid1: TChartGrid;
    PanelData: TPanel;
    ChartGridNavigator1: TChartGridNavigator;
    CheckBoxGridLabels: TCheckBox;
    CheckBoxX: TCheckBox;
    CBColors: TCheckBox;
    TabText: TTabSheet;
    TabPrint: TTabSheet;
    Splitter3: TSplitter;
    PanelGrid: TPanel;
    TabWelcome: TTabSheet;
    WelcomeChart: TChart;
    Series1: TSurfaceSeries;
    ChartTool1: TLegendPaletteTool;
    ChartTool2: TRotateTool;
    ChartTool3: TSurfaceNearestTool;
    ChartAnimation1: TTeeAnimationTool;
    Panel5: TPanel;
    LabelStartHere: TLabel;
    CBShowStartup: TCheckBox;
    TabFunctions: TTabSheet;
    TabSamples: TTabSheet;
    Panel6: TPanel;
    BOpenSample: TButton;
    SamplesGallery: TChartGalleryPanel;
    Splitter1: TSplitter;
    ControlBar1: TPanel;
    TeeCommander1: TTeeCommander;
    PanelFont: TPanel;
    FontBold: TSpeedButton;
    FontItalic: TSpeedButton;
    FontUnderline: TSpeedButton;
    FontStrike: TSpeedButton;
    FontLeftAlign: TSpeedButton;
    FontCenterAlign: TSpeedButton;
    FontRightAlign: TSpeedButton;
    ShapeFontColor: TShape;
    SBOutline: TSpeedButton;
    ComboFonts: TComboFlat;
    ComboFontSize: TComboFlat;
    EditFontInter: TEdit;
    UDFontInter: TUpDown;
    PanelToolbars: TPanel;
    ToolBarSeries: TPanel;
    ColorEach: TSpeedButton;
    ShowAtLegend: TSpeedButton;
    ShowMarks: TSpeedButton;
    PanelTools: TPanel;
    Annotation: TSpeedButton;
    SBZoom: TSpeedButton;
    SBScroll: TSpeedButton;
    SBDrawLine: TSpeedButton;
    SBHints: TSpeedButton;
    PanelPen: TPanel;
    ShapeBorderColor: TShape;
    ComboPenStyle: TComboFlat;
    BorderWidth: TScrollBar;
    PanelPage: TPanel;
    ChartPageNavigator1: TChartPageNavigator;
    Pen1: TMenuItem;
    CommanderToolbar: TPanel;
    ChartTool4: TAnnotationTool;
    ProgressBar1: TProgressBar;
    Panel3: TPanel;
    CBLanguage: TComboFlat;
    Data2: TMenuItem;
    Import1: TMenuItem;
    procedure Configure1Click(Sender: TObject);
    procedure About1Click(Sender: TObject);
    procedure PrintPreview1Click(Sender: TObject);
    procedure ChartProperties1Click(Sender: TObject);
    procedure Legend1Click(Sender: TObject);
    procedure Export1Click(Sender: TObject);
    procedure ChartListBox1DblClickSeries(Sender: TChartListBox;
      Index: Integer);
    procedure ChartListBox1Click(Sender: TObject);
    procedure SBAddClick(Sender: TObject);
    procedure SBDeleteClick(Sender: TObject);
    procedure SBEditClick(Sender: TObject);
    procedure TBMoveUpClick(Sender: TObject);
    procedure TBMoveDownClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure Title1Click(Sender: TObject);
    procedure Change1Click(Sender: TObject);
    procedure CloneItemClick(Sender: TObject);
    procedure LocalMenuPopup(Sender: TObject);
    procedure SelectAllItemClick(Sender: TObject);
    procedure Open1Click(Sender: TObject);
    procedure Axes1Click(Sender: TObject);
    procedure TeeChartWeb1Click(Sender: TObject);
    procedure ChartTools1Click(Sender: TObject);
    procedure DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure DBChart1DblClick(Sender: TObject);
    procedure OpenGL1Click(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure Print1Click(Sender: TObject);
    procedure New1Click(Sender: TObject);
    procedure NewusingWizard1Click(Sender: TObject);
    procedure HideSerieslist1Click(Sender: TObject);
    procedure Inspector1Click(Sender: TObject);
    procedure Serieslist1Click(Sender: TObject);
    procedure Hideinspector1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Save1Click(Sender: TObject);
    procedure Exit1Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure ImportfromWeb1Click(Sender: TObject);
    procedure TeeCommander1EditedChart(Sender: TTeeCommander;
      AChart: TCustomChart);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
    procedure SBOutlineClick(Sender: TObject);
    procedure EditFontInterChange(Sender: TObject);
    procedure ComboFontSizeChange(Sender: TObject);
    procedure ComboFontsChange(Sender: TObject);
    procedure FontBoldClick(Sender: TObject);
    procedure ShapeFontColorMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Gallery1Click(Sender: TObject);
    procedure Statusbar2Click(Sender: TObject);
    procedure TimerStatusTimer(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure Standard1Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure Page1Click(Sender: TObject);
    procedure AligntoBottom1Click(Sender: TObject);
    procedure View3D1Click(Sender: TObject);
    procedure ComboBoxPartsChange(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure ShowMarksClick(Sender: TObject);
    procedure ColorEachClick(Sender: TObject);
    procedure Titles1Click(Sender: TObject);
    procedure Hide1Click(Sender: TObject);
    procedure SeriesToolBarItemClick(Sender: TObject);
    procedure ShowAtLegendClick(Sender: TObject);
    procedure AnnotationClick(Sender: TObject);
    procedure SBZoomClick(Sender: TObject);
    procedure SBScrollClick(Sender: TObject);
    procedure SBDrawLineClick(Sender: TObject);
    procedure UseSeriesColor1Click(Sender: TObject);
    procedure Inverted1Click(Sender: TObject);
    procedure PopupLegendPopup(Sender: TObject);
    procedure Checkboxes1Click(Sender: TObject);
    procedure Dividinglines1Click(Sender: TObject);
    procedure LegendGradientClick(Sender: TObject);
    procedure LegendTransparentClick(Sender: TObject);
    procedure Bottom1Click(Sender: TObject);
    procedure Right2Click(Sender: TObject);
    procedure Continous1Click(Sender: TObject);
    procedure Lastvalues1Click(Sender: TObject);
    procedure PopupMenuTitlePopup(Sender: TObject);
    procedure LegendBorderClick(Sender: TObject);
    procedure TitleBorderClick(Sender: TObject);
    procedure TitleVisibleClick(Sender: TObject);
    procedure TitleGradientClick(Sender: TObject);
    procedure TitleTransparentClick(Sender: TObject);
    procedure TitleShadowClick(Sender: TObject);
    procedure TitleAutosizeClick(Sender: TObject);
    procedure Color1Click(Sender: TObject);
    procedure TitleRightClick(Sender: TObject);
    procedure Text1Click(Sender: TObject);
    procedure PopupMenuPanelPopup(Sender: TObject);
    procedure Edit2Click(Sender: TObject);
    procedure PanelColorClick(Sender: TObject);
    procedure PanelBackimageClick(Sender: TObject);
    procedure PanelGradientClick(Sender: TObject);
    procedure PanelBorderClick(Sender: TObject);
    procedure TeeChartHelp1Click(Sender: TObject);
    procedure OnlineSupport1Click(Sender: TObject);
    procedure Saveas1Click(Sender: TObject);
    procedure Sendto1Click(Sender: TObject);
    procedure Panel2Resize(Sender: TObject);
    procedure EditAnnotationClick(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure AnnBorderClick(Sender: TObject);
    procedure AnnColorClick(Sender: TObject);
    procedure AnnGradientClick(Sender: TObject);
    procedure Transparent1Click(Sender: TObject);
    procedure PopupMenuAnnPopup(Sender: TObject);
    procedure Custom1Click(Sender: TObject);
    procedure RightBottom1Click(Sender: TObject);
    procedure Edit4Click(Sender: TObject);
    procedure Arrow1Click(Sender: TObject);
    procedure MarksBorderClick(Sender: TObject);
    procedure Color3Click(Sender: TObject);
    procedure MarksGradientClick(Sender: TObject);
    procedure Transparent2Click(Sender: TObject);
    procedure ShowHints1Click(Sender: TObject);
    procedure Options1Click(Sender: TObject);
    procedure Edit5Click(Sender: TObject);
    procedure Labels1Click(Sender: TObject);
    procedure Inverted2Click(Sender: TObject);
    procedure Ticks1Click(Sender: TObject);
    procedure Grid1Click(Sender: TObject);
    procedure Axisline1Click(Sender: TObject);
    procedure PopupMenuAxisPopup(Sender: TObject);
    procedure CheckBoxGridLabelsClick(Sender: TObject);
    procedure CheckBoxXClick(Sender: TObject);
    procedure AutoSize1Click(Sender: TObject);
    procedure Hide2Click(Sender: TObject);
    procedure Tools2Click(Sender: TObject);
    procedure PopupMenuGalleryPopup(Sender: TObject);
    procedure Updateversion1Click(Sender: TObject);
    procedure Color4Click(Sender: TObject);
    procedure Rightside1Click(Sender: TObject);
    procedure PopupMenuSeriesPopup(Sender: TObject);
    procedure PopupMenuMarksPopup(Sender: TObject);
    procedure Visible2Click(Sender: TObject);
    procedure Coloreach1Click(Sender: TObject);
    procedure ShowatLegend1Click(Sender: TObject);
    procedure ShowMarks1Click(Sender: TObject);
    procedure Color5Click(Sender: TObject);
    procedure Datasource1Click(Sender: TObject);
    procedure LegendFontClick(Sender: TObject);
    procedure SBHintsClick(Sender: TObject);
    procedure ChartEditor1Close(Sender: TObject);
    procedure Frame1Click(Sender: TObject);
    procedure Shadow1Click(Sender: TObject);
    procedure CustomPosition1Click(Sender: TObject);
    procedure AxisFontClick(Sender: TObject);
    procedure Visible3Click(Sender: TObject);
    procedure PopupLineBorderClick(Sender: TObject);
    procedure PopupLinePopup(Sender: TObject);
    procedure PopupLineStairsClick(Sender: TObject);
    procedure PopupLineInvertedClick(Sender: TObject);
    procedure XY1Click(Sender: TObject);
    procedure WallBorderClick(Sender: TObject);
    procedure WallColorClick(Sender: TObject);
    procedure WallGradientClick(Sender: TObject);
    procedure WallTransparentClick(Sender: TObject);
    procedure WallVisibleClick(Sender: TObject);
    procedure PopupMenuWallPopup(Sender: TObject);
    procedure WallDark3DClick(Sender: TObject);
    procedure Edit3Click(Sender: TObject);
    procedure PopupLinePatternClick(Sender: TObject);
    procedure BarEllipseClick(Sender: TObject);
    procedure BarUseOriginClick(Sender: TObject);
    procedure PopupBarPopup(Sender: TObject);
    procedure BarGradientClick(Sender: TObject);
    procedure BarWidthItemClick(Sender: TObject);
    procedure AxisMinorGridClick(Sender: TObject);
    procedure AxisVisibleClick(Sender: TObject);
    procedure BarSideMarginsClick(Sender: TObject);
    procedure PopupPiePopup(Sender: TObject);
    procedure PieCircledClick(Sender: TObject);
    procedure PieDark3DClick(Sender: TObject);
    procedure PiePatternsClick(Sender: TObject);
    procedure PieRotationClick(Sender: TObject);
    procedure PopupFastLinePopup(Sender: TObject);
    procedure PopupPointPopup(Sender: TObject);
    procedure PointDarkClick(Sender: TObject);
    procedure PointDraw3DClick(Sender: TObject);
    procedure PointHeightClick(Sender: TObject);
    procedure PointWidthClick(Sender: TObject);
    procedure Smalldot1Click(Sender: TObject);
    procedure Textmode1Click(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure PanelView3DClick(Sender: TObject);
    procedure StatusBar1DrawPanel(StatusBar: TStatusBar;
      Panel: TStatusPanel; const Rect: TRect);
    procedure Colors1Click(Sender: TObject);
    procedure GrayScale2Click(Sender: TObject);
    procedure Monochrome1Click(Sender: TObject);
    procedure DBChart1AfterDraw(Sender: TObject);
    procedure GrayScaleVisual1Click(Sender: TObject);
    procedure InvertedGrayScale1Click(Sender: TObject);
    {$IFDEF K3}
    procedure ChartGrid1SetEditText(Sender: TObject; ACol,
    ARow: Integer; const Value: WideString);
    {$ELSE}
    procedure ChartGrid1SetEditText(Sender: TObject; ACol, ARow: Integer;
      const Value: String);
    {$ENDIF}
    procedure StatusBar1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure CBColorsClick(Sender: TObject);
    procedure PopupLineOutlineClick(Sender: TObject);
    procedure LabelsFormat1Click(Sender: TObject);
    procedure Hide3Click(Sender: TObject);
    procedure BottomTabClick(Sender: TObject);
    procedure None1Click(Sender: TObject);
    procedure MarksFontClick(Sender: TObject);
    procedure TitleFontClick(Sender: TObject);
    procedure AnnoFontClick(Sender: TObject);
    procedure FontLeftAlignClick(Sender: TObject);
    procedure Bottom2Click(Sender: TObject);
    procedure Whatsthis1Click(Sender: TObject);
    procedure ChartEditor1Show(Sender: TObject);
    procedure ChartListBox1RemovedSeries(Sender: TChartListBox;
      Series: TCustomChartSeries);
    procedure ShapeBorderColorMouseUp(Sender: TObject;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    {$IFDEF CLX}
    procedure ComboPenStyleDrawItem(Sender: TObject; Index: Integer;
      Rect: TRect; State: TOwnerDrawState; var Handled: Boolean);
    {$ELSE}
    procedure ComboPenStyleDrawItem(Control: TWinControl; Index: Integer;
      Rect: TRect; State: TOwnerDrawState);
    {$ENDIF}
    procedure ComboPenStyleChange(Sender: TObject);
    procedure BorderWidthChange(Sender: TObject);
    procedure Borders1Click(Sender: TObject);
    procedure Top2Click(Sender: TObject);
    procedure PopupMenuGridPopup(Sender: TObject);
    procedure Right3Click(Sender: TObject);
    procedure ChartListBox1ChangeOrder(Sender: TChartListBox; Series1,
      Series2: TCustomChartSeries);
    procedure ChartListBox1ChangeColor(Sender: TChartListBox;
      Series: TCustomChartSeries);
    procedure Options2Click(Sender: TObject);
    procedure Symbol1Click(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure DataSources1Click(Sender: TObject);
    procedure SBNewDataSourceClick(Sender: TObject);
    procedure SBDeleteSourceClick(Sender: TObject);
    procedure SBEditSourceClick(Sender: TObject);
    procedure LBSourcesClick(Sender: TObject);
    procedure SBRenameSourceClick(Sender: TObject);
    procedure Small1Click(Sender: TObject);
    procedure EditColor1Click(Sender: TObject);
    procedure DefaultColor1Click(Sender: TObject);
    procedure Makenullpoint1Click(Sender: TObject);
    procedure extfont1Click(Sender: TObject);
    procedure Insertrow1Click(Sender: TObject);
    procedure Deleterow1Click(Sender: TObject);
    procedure PopupDataPopup(Sender: TObject);
    procedure DBChart1DragOver(Sender, Source: TObject; X, Y: Integer;
      State: TDragState; var Accept: Boolean);
    procedure DBChart1DragDrop(Sender, Source: TObject; X, Y: Integer);
    procedure ChartListBox1ChangeActive(Sender: TChartListBox;
      Series: TCustomChartSeries);
    procedure FullScreen1Click(Sender: TObject);
    procedure LabelStartHereClick(Sender: TObject);
    procedure DBChart1ValidDataSource(Sender: TCustomAxisPanel;
      ASeries: TChartSeries; AComponent: TComponent; var Valid: Boolean);
    procedure ChartGalleryPanel1ShowSubGallery(Sender: TObject);
    procedure ChartTool3SelectCell(Sender: TObject);
    procedure WelcomeChartDblClick(Sender: TObject);
    procedure SamplesGallerySelectedChart(Sender: TObject);
    procedure BOpenSampleClick(Sender: TObject);
    procedure MainPageChange(Sender: TObject);
    procedure Pen1Click(Sender: TObject);
    procedure ChartTool4Click(Sender: TAnnotationTool;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure SamplesGalleryChangeChart(Sender: TObject);
    procedure CBLanguageChange(Sender: TObject);
    procedure dataTopClick(Sender: TObject);
    procedure dataBottomClick(Sender: TObject);
    procedure Import1Click(Sender: TObject);
  private
    { Private declarations }
    FConfig      : TTeeConfiguration;
    FRecentFiles : TRecentFiles;
    CurrentFile  : String;
    FModified    : Boolean;
    Selector     : TSelectorTool;
    FullScreen   : TFullScreenTool;

    InSubGallery : Boolean;

    {$IFNDEF LINUX}
    {$IFNDEF CLR}
    TeeOpenGL1   : TTeeOpenGL;
    {$ENDIF}
    {$ENDIF}

    {$IFDEF TEEUSEMENUACTIONS}
    FMenuActions : TMenuActions;
    {$ENDIF}

    Old3DEvent   : TNotifyEvent;

    {$IFDEF D16}
    CurrentTheme : String;
    {$ENDIF}

    IPanelFont   : TTeeFont;
    DrawGrayScale    : Integer;
    DrawGrayInverted : Boolean;
    SelectedBorder   : TChartPen;

    ShowDone         : Boolean;
    MemoText         : TRichEdit;

    Procedure ArrangeGallery;
    Procedure ArrangeToolbars;
    procedure ChangeGalleryChartSize;
    procedure ChangeToNewSeries(Series:TChartSeries);
    Procedure ChartGridChangeColor(Sender: TObject);
    procedure CheckDefaultTheme;
    Procedure CheckInspectorList;
    Procedure CheckLegendSelector;
    Procedure CheckSeriesButtons(ASeries: TChartSeries);
    Procedure CheckTitleSelector;
    Function CheckSave:Boolean;
    procedure Commander3DClick(Sender: TObject);
    Procedure CreateGallery(Const AGallery:Array of TChartSeriesClass);
    Function CreateNewChart(InitSeries:Boolean=True):Boolean;
    Procedure CreateFullScreen;
    Procedure CreateSelector;
    Procedure DisableDrawLine;
    Procedure DoColorEachChange;
    Function DoEditColor(AColor:TColor; Var Changed:Boolean):TColor;
    Procedure DoSaveChart;
    Procedure DrawLineNewLine(Sender: TObject);
    Function DrawLineTool:TDrawLineTool;
    Procedure EnableButtons;
    Procedure EnableSourceButtons;
    Procedure EnablePanelFont(IsEnabled:Boolean);
    Procedure EnableToolButtons(ASeries:TChartSeries);
    Function ExistGallerySeries(ASeries:TChartSeries):Boolean;
    Function FindDrawLineTool:TDrawLineTool;
    Function FindSelector:TSelectorTool;
    procedure InitWelcomeChart;
    Function InputInteger(Const St:String; Const Num:Integer):Integer;
    Procedure MainSetCaption;
    Function MarkTipsTool:TMarksTipTool;
    Procedure MergeSeriesMenu;
    procedure DeleteDataSetClick(Sender: TObject);
    procedure EditDataSetClick(Sender: TObject);
    procedure NewDataSetClick(Sender: TObject);
    Procedure OnCreateEditSeries(Sender:TFormTeeSeries; AChart:TCustomChart);
    Procedure ReOpenFile(Const FileName:String);
    procedure RepaintPreview;
    procedure RepositionChartGrid;
    Procedure ResetChart;
    procedure ResetFullScreen(Sender: TObject);
    procedure SelectedFunctionGallery(Sender: TObject);
    Function SelectedTitleName:String;
    Function SelectedSource:TComponent;
    Procedure SelectorDragged(Sender:TObject);
    Procedure SelectorDragging(Sender:TObject);
    Procedure SelectorResizing(Sender:TObject);
    Procedure SelectorSelected(Sender:TObject);
    Procedure SetBorderToolbar;
    Procedure SetChartMenuItems;
    procedure SetGalleryBorders;
    procedure SetGrayScale(Method:Integer; Inverted:Boolean);
    Procedure SetInspectorProperties;
    Procedure SetPanelFont(AFont:TTeeFont; EnableJustify:TEnableJustify=ejNo;
                                       Justification:TAlignment=taCenter);
    procedure ShowChartTab;
    procedure Smooth1Click(Sender: TObject);
    Function StatusHint:TStatusPanel;

    {$IFDEF D16}
    procedure StyleChecked(Sender: TObject);
    {$ENDIF}

    Procedure TeeCommander1SetLabel(Sender:TTeeCommander; Var Text:String);
    Procedure TeeModified(YesNo:Boolean=True);
    Function  ToogleModified(Item: TMenuItem):Boolean;
    Procedure TranslateMainForm;

    {$IFNDEF CLX}
    procedure WMDROPFILES(var Message: TWMDROPFILES); message WM_DROPFILES;
    {$ENDIF}
  public
    { Public declarations }
    Procedure LoadChart(Const AFileName:String);
  end;

var
  MainForm: TMainForm;

{ Add the *.tee file extension to Windows registry }
Procedure RegisterTeeChartOffice;

{ Reduce allocated memory at startup under Windows }
Procedure TrimWorkingSet;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{$IFDEF CLR}
{$R 'TeeOfficeAllBmps.bmp'}
{$R 'WhatsThis.bmp'}
{$R 'TeeTools.bmp'}
{$ELSE}
{$R TeeOfficeBmps.res}
{$ENDIF}

Uses
     {$IFNDEF LINUX}

     { Windows Units }
     ShellAPI, ShlObj, CommCtrl,

     {$ENDIF}

     { Database }
     Db,

     {$IFNDEF D6}
     FileCtrl,
     {$ENDIF}

     { TeeChart Pro Units }
     EditChar, TeeEditCha, DBEditCh, TeExport, TeeAbout, TeeCommanderEditor,
     TeeStore,
     TeeSVGCanvas, TeePSCanvas, TeeXAMLCanvas, TeeFlexCanvas, TeeVRML3D,
     TeeVMLCanvas, TeeJavaScript, TeeHTML5Canvas,

     {$IFDEF CLR}
     System.Text,
     {$ELSE}
     TeePCX, TeeGLEditor,
     {$ENDIF}

     TeeJPEG, TeeGIF, TeePNG, TeePDFCanvas,

     TeeDBEdit, TypInfo, TeePenDlg, TeeConst, TeeEdiGrad, TeeProCo,
     TeeBrushDlg, TeeEdiTitl, TeeAnnToolEdit,
     TeeExpForm, TeeDragPoint, TeeSourceEdit, TeeGally,

     { Languages Unit }
     TeeOfficeConstants, TeeChartOfficeConstants,

     { TeeChart Series types Units }
     StatChar, CandleCh, TeeBezie, TeePyramid, MyPoint, TeeDonut,
     TeePolar, TeeTriSurface, TeePoin3,

     { TeeChartOffice Units }

     TeeSeriesTextEd,

     {$IFNDEF LINUX}
     TeeUpdateVersion,
     {$IFNDEF CLX}
     {$IFNDEF NOUSE_BDE}
     TeeNewDataSet,
     {$ENDIF}
     {$ENDIF}
     TeeWebGallery,
     {$ENDIF}

     {$IFNDEF CLX}
     TeeHighLight,
     {$ENDIF}

     {$IFNDEF LINUX}
     TeeXML, 
     {$IFNDEF CLR}
     TeeExcelSource,
     {$ENDIF}
     TeeDBCrosstab,
     {$ENDIF}

     {$IFNDEF TEENOTHEMES}
     TeeThemes,
     {$ENDIF}

     TeeFormatting, TeeTranslate, TeeTranslateEditor,

     TeeSpanish, TeeGerman, TeeDanish, TeeSwedish, TeeDutch, TeeCatalan,
     TeeChinese, TeeChineseSimp, TeeFrench, TeeBrazil, TeePortuguese,
     TeeRussian, TeeItalian, TeeSlovene, TeeNorwegian, TeeTurkish, TeePolish,
     TeeJapanese, TeeHungarian, TeeGalician, TeeArabic, TeeHebrew,
     TeeUkrainian, TeeKorean, TeeIndonesian, TeeFinnish,
     TeeSlovak, TeeHellenic, TeeRomanian, TeeSerbian, TeeFarsi, TeeCzech,
     TeeHindi, TeeUrdu, TeeImportData;

Const
  ComboPart_Chart  =0;
  ComboPart_Legend =1;
  ComboPart_Title  =2;
  ComboPart_Series =3;
  ComboPart_Marks  =4;
  ComboPart_Axis   =5;
  ComboPart_Wall   =6;
  ComboPart_Annot  =7;

{ Series styles to show at the Gallery }
var
  ChartListXY:Array[0..17] of TChartSeriesClass;
  ChartListXYZ:Array[0..5] of TChartSeriesClass;

{ Similar to TeeChartPro.pas, but with "Office" constants }
Procedure TeeSetLanguage(English:Boolean);
begin
  Case TeeLanguageRegistry of
    1: TeeOfficeBrazil;
    2: TeeOfficeCatalan;
    3: TeeOfficeChineseSimp;
    4: TeeOfficeChinese;
    5: TeeOfficeDanish;
    6: TeeOfficeDutch;
    7: TeeOfficeFrench;
    8: TeeOfficeGerman;
    9: TeeOfficeItalian;
   10: TeeOfficePortuguese;
   11: TeeOfficeRussian;
   12: TeeOfficeSpanish;
   13: TeeOfficeSwedish;
   14: TeeOfficeNorwegian;
   15: TeeOfficeJapanese;
   16: TeeOfficePolish;
   17: TeeOfficeSlovene;
   18: TeeOfficeTurkish;
   19: TeeOfficeHungarian;
   20: TeeOfficeGalician;
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
    if English then TeeOfficeEnglish;
  end;
end;

procedure TMainForm.Configure1Click(Sender: TObject);
begin { show the TeeCommander toolbar configuration dialog }
  TeeCommanderEdit(Self,TeeCommander1);
end;

type
  TOfficeAbout=class(TTeeAboutForm)
  protected
    function GetLicense:String; override;
    function UpdateAvailable(out Build:String):String; override;
  end;

function TOfficeAbout.GetLicense:String;
begin
  result:='License: FREE !';
end;

function TOfficeAbout.UpdateAvailable(out Build:String):String;
var AVersion,
    ADate,
    AURL : String;
begin
  if TUpdateVersion.GetVersionFromSteema(TChartOfficeVersionURL,TeeMsg_URLMagic,AVersion,ADate,AURL) and
     (AVersion<>TeeChartOfficeBuild) then
  begin
    result:=AURL;
    Build:=AVersion;
  end
  else
     result:='';
end;

procedure TMainForm.About1Click(Sender: TObject);
begin { show the About... dialog }
  with TOfficeAbout.Create(Self) do
  try
    Prepare(TeeChartOfficeVersion,TeeChartOfficeVersion,'');
    ShowModal;
  finally
    Free;
  end;
end;

procedure TMainForm.PrintPreview1Click(Sender: TObject);
begin { show the Print Preview dialog }
  ChartPreviewer1.Execute;
end;

procedure TMainForm.ChartProperties1Click(Sender: TObject);
begin { show the Chart Editor dialog. See ChartEditor1Close and Show events... }
  ChartEditor1.Execute;
end;

Function Toogle(Item: TMenuItem):Boolean;
begin { change the Checked property of Item and return result }
  Item.Checked:=not Item.Checked;
  result:=Item.Checked;
end;

procedure TMainForm.Legend1Click(Sender: TObject);
begin { show / hide the Chart Legend }
  DBChart1.Legend.Visible:=Toogle(Legend1);
  CheckLegendSelector;
  TeeModified;
end;

procedure TMainForm.Export1Click(Sender: TObject);
begin { show the Chart Export dialog }
  Selector.DrawHandles:=False;
  try
    With TTeeExportForm.Create(Self) do
    try
      ExportPanel:=DBChart1;

      if Self.PageControl1.ActivePage=Self.TabData then
        { go to "Data" exporting tab }
         PageControl1.ActivePage:=TabData;

      ShowModal;
    finally
      Free;
    end;
  finally
    Selector.DrawHandles:=True;
  end;
end;

procedure TMainForm.ChartListBox1DblClickSeries(Sender: TChartListBox;
  Index: Integer);
begin { show the editor dialog to edit the selected Series }
  SBEditClick(Sender);
end;

Procedure TMainForm.EnableButtons;
begin { setup the Series list toolbar buttons }
  SBEdit.Enabled    := ChartListBox1.AnySelected;
  SBFont.Enabled    := SBEdit.Enabled;
  SBDelete.Enabled  := SBEdit.Enabled;
  TBMoveUp.Enabled  := SBEdit.Enabled and (ChartListBox1.ItemIndex>0);
  TBMoveDown.Enabled:= SBEdit.Enabled and (ChartListBox1.ItemIndex<ChartListBox1.Items.Count-1);
end;

Procedure TMainForm.EnableSourceButtons;
begin { setup the Series list toolbar buttons }
  SBEditSource.Enabled:= LBSources.ItemIndex<>-1;
  SBDeleteSource.Enabled:= SBEditSource.Enabled;
  SBRenameSource.Enabled:= SBEditSource.Enabled;
end;

Function TMainForm.ExistGallerySeries(ASeries:TChartSeries):Boolean;
var t   : Integer;
    tmp : TChartSeries;
begin { returns True if the Gallery contains a Series class like ASeries }
  result:=False;

  if Assigned(ASeries) then
    with ChartGalleryPanel1 do
      for t:=0 to Charts.Count-1 do
      begin
        tmp:=Charts[t].Series[0];

        if tmp is ASeries.ClassType then { found ! }
        begin
          result:=True;
          break;
        end;
      end;
end;

{$IFNDEF CLR}
type TChartGalleryAccess=class(TChartGalleryPanel);
{$ENDIF}

procedure TMainForm.ChartListBox1Click(Sender: TObject);
var tmp      : TChartSeries;
    tmpClass : TChartSeriesClass;
    tmpFound : Boolean;
    t        : Integer;
begin { set the Chart Gallery to show the Selected Series style }
  EnableButtons;

  { select the current Series type at the Gallery }
  if ExistGallerySeries(ChartListBox1.SelectedSeries) then
  begin
    if ChartGalleryPanel1.SelectedSeries<>ChartListBox1.SelectedSeries then
    begin
      ChartGalleryPanel1.SelectedSeries:=ChartListBox1.SelectedSeries;
      {$IFNDEF CLR}TChartGalleryAccess{$ENDIF}(ChartGalleryPanel1).FindSelectedChart;
      ChartGalleryPanel1.SelectedChart.Tag:={$IFDEF CLR}nil{$ELSE}0{$ENDIF};
      ChartGalleryPanel1.OnChangeChart:=nil;
      {$IFNDEF CLR}TChartGalleryAccess{$ENDIF}(ChartGalleryPanel1).ShowSelectedChart;
      ChartGalleryPanel1.OnChangeChart:=ChartGalleryPanel1ChangeChart;
    end;
  end
  else
  begin
    { find Series class in default Gallery }
    tmpClass:=TChartSeriesClass(ChartListBox1.SelectedSeries.ClassType);
    tmpFound:=False;
    for t:=Low(ChartListXY) to High(ChartListXY) do
    if ChartListXY[t]=tmpClass then
    begin
      tmpFound:=True;
      break;
    end;

    if tmpFound then CreateGallery(ChartListXY) { default Gallery }
                else CreateGallery([tmpClass]); { just one Series }
  end;

  { set current selected series properties }
  tmp:=ChartListBox1.SelectedSeries;
  EnableControls(Assigned(tmp),[ColorEach,ShowMarks,ShowAtLegend]);

  { Set up Series toolbar buttons }
  CheckSeriesButtons(tmp);

  { focus the Chart Series List box }
  if PanelSeries.TabVisible and ChartListBox1.CanFocus and Showing then
     ChartListBox1.SetFocus;

  { Some Series types do not allow Zoom / Scroll / Drawing-Lines }
  EnableToolButtons(tmp);

  if not Assigned(Selector) then CreateSelector;

  { set Selector series }
  if ChartListBox1.SelCount=1 then
     if Selector.Series<>tmp then
        Selector.Series:=tmp;
end;

Procedure TMainForm.CheckSeriesButtons(ASeries: TChartSeries);
begin { set up the Series toolbar buttons with ASeries parameter }
  if Assigned(ASeries) then
  begin
    ColorEach.Down:=ASeries.ColorEachPoint;
    ColorEach.Enabled:=not (ASeries is TPieSeries);
    ShowMarks.Down:=ASeries.Marks.Visible;
    ShowAtLegend.Down:=ASeries.ShowInLegend;
  end;
end;

Procedure TMainForm.EnableToolButtons(ASeries:TChartSeries);
begin
  { Some Series types do not allow Zoom / Scroll / Drawing-Lines }
  EnableControls(Assigned(ASeries) and ASeries.UseAxis,[SBZoom,SBScroll,SBDrawLine]);

  { special case for Pie Series }
  if Assigned(ASeries) and (ASeries is TPieSeries) and
     TeeCommander1.ButtonNormal.Down then
        TeeCommander1.ButtonNormal.Click;
end;

procedure TMainForm.SBAddClick(Sender: TObject);
var tmp: TChartSeries;
begin { show the Chart Gallery to add a new Series }
  tmp:=ChartListBox1.AddSeriesGallery;

  if Assigned(tmp) then
  begin
    tmp.FillSampleValues(tmp.NumSampleValues);
    EnableButtons;
    Selector.Series:=tmp;
    TeeModified;
  end;
end;

procedure TMainForm.SBDeleteClick(Sender: TObject);
begin { delete the current selected Series }
  if ChartListBox1.DeleteSeries then
  begin
    EnableButtons;

    { remove selection because we have deleted the selected series }
    Selector.ClearSelection;

    TeeModified;
  end;
end;

procedure TMainForm.SBEditClick(Sender: TObject);
begin { show the Series editor dialog to edit the selected Series }
  EditSeries(Self,ChartListBox1.SelectedSeries);
  TeeModified;
end;

procedure TMainForm.TBMoveUpClick(Sender: TObject);
begin  { scroll up the selected Series in the list }
  ChartListBox1.MoveCurrentUp;
  EnableButtons;
  TeeModified;
end;

procedure TMainForm.TBMoveDownClick(Sender: TObject);
begin { scroll down the selected Series in the list }
  ChartListBox1.MoveCurrentDown;
  EnableButtons;
  TeeModified;
end;

Procedure TMainForm.CreateGallery(Const AGallery:Array of TChartSeriesClass);
begin { set-up the Gallery with a list of Series styles }
  with ChartGalleryPanel1 do
  begin
    SelectedSeries:=ChartListBox1.SelectedSeries;

    if High(AGallery)=0 then
    begin { create sub-gallery }
      with {$IFNDEF CLR}TChartGalleryAccess{$ENDIF}(ChartGalleryPanel1) do
      begin
        tmpSeries:=SelectedSeries;
        AddSubCharts(ChartGalleryPanel1);
      end;

      InSubGallery:=True;
      DisplaySub:=False;
    end
    else
    begin
      { create normal gallery }

      InSubGallery:=False;  // <-- set before calling CreateChartList, to avoid OnChangeChart event

      CreateChartList(AGallery);
      DisplaySub:=True;
    end;

    ArrangeGallery;
  end;
end;

Procedure TMainForm.ArrangeGallery;
var t : Integer;
begin { cosmetic adjustments for gallery Charts... }
  with ChartGalleryPanel1 do
    for t:=0 to Charts.Count-1 do
    with Charts[t] do
    begin
      Title.Visible:=False;
      Hint:=Title.Text[0];
      Axes.Left.Axis.Width:=1;
      Axes.Bottom.Axis.Width:=1;
      Axes.Left.Labels:=False;
      Axes.Bottom.Labels:=False;
      ColorPaletteIndex:=TeeNewChartPalette;

      //Problem: Drag cannot be used with gallery to change series types
      //DragMode:=dmAutomatic;
    end;
end;

{ Removed usage of TControlBar & TToolBar controls (due some resize bugs in VCL) }
Procedure TMainForm.ArrangeToolbars;
var tmp : Integer;
begin
  PanelToolbars.Visible:=ToolBarSeries.Visible or PanelPen.Visible or
                         PanelTools.Visible or PanelPage.Visible;

  CommanderToolbar.Visible:=TeeCommander1.Visible or PanelToolbars.Visible;

  if CommanderToolbar.Visible and PanelToolbars.Visible then
  begin
    if TeeCommander1.Visible then
       tmp:=430
    else
       tmp:=0;

    PanelToolbars.Left:=tmp;

    tmp:=0;

    if ToolBarSeries.Visible then
       Inc(tmp,ToolBarSeries.Width+4);

    if PanelTools.Visible then
    begin
      PanelTools.Left:=tmp;
      Inc(tmp,PanelTools.Width+4);
    end;

    if PanelPen.Visible then
    begin
      PanelPen.Left:=tmp;
      Inc(tmp,PanelPen.Width+4);
    end;

    if PanelPage.Visible then
    begin
      PanelPage.Left:=tmp;
      //Inc(tmp,PanelPage.Width+4);
    end;
  end;

  ControlBar1.Visible:=PanelToolbars.Visible or CommanderToolbar.Visible;

  if ControlBar1.Visible then
    if PanelFont.Visible then
       if CommanderToolbar.Visible then
          ControlBar1.Height:=58
       else
          ControlBar1.Height:=25
    else
       ControlBar1.Height:=33;
end;

Procedure TMainForm.TranslateMainForm;
begin { translate this form and the navigator hints }
  TeeTranslateControl(Self);
  ChartPageNavigator1.InitHints;
  ChartGridNavigator1.InitHints;
end;

procedure TMainForm.CheckDefaultTheme;
begin
  {$IFNDEF TEENOTHEMES}
  if TeeNewChartTheme<>0 then
     ApplyChartTheme(ChartThemes[TeeNewChartTheme],DBChart1,TeeNewChartPalette)
  else
     DBChart1.ColorPaletteIndex:=TeeNewChartPalette;
  {$ENDIF}
end;

{$IFDEF D16}
procedure TMainForm.StyleChecked(Sender: TObject);
var m : TMenuItem;
    s : String;
begin
  m:=TMenuItem(Sender);
  s:=StripHotkey(m.Caption);
  TStyleManager.TrySetStyle(s);
  m.Checked:=True;
  CurrentTheme:=s;
  TeeSaveStringOption('TeeChartOffice_Theme',CurrentTheme);
end;
{$ENDIF}

type TCommanderAccess=class(TTeeCommander);

procedure TMainForm.FormShow(Sender: TObject);

  procedure AddThemes;
  {$IFDEF D16}
  var t : Integer;
      m : TMenuItem;
      s : String;
      st : TStringList;
  {$ENDIF}
  begin
    {$IFDEF D16}
    if Themes1.Count>0 then
       Exit;

    s:=TStyleManager.ActiveStyle.Name;

    st:=TStringList.Create;
    try
      for t:=0 to Length(TStyleManager.StyleNames)-1 do
          st.Add(TStyleManager.StyleNames[t]);

      st.Sorted:=True;

      for t:=0 to st.Count-1 do
      begin
        m:=TMenuItem.Create(Self);
        m.Caption:=st[t];

        if m.Caption=s then
           m.Checked:=True;

        m.RadioItem:=True;
        m.OnClick:=StyleChecked;

        Themes1.Add(m);
      end;

    finally
      st.Free;
    end;

    {$ELSE}
    Themes1.Visible:=False;
    {$ENDIF}
  end;

const
  TeeMsg_DefaultOfficeTheme='OfficeTheme'; // Do not translate

var t   : Integer;
    tmp : Integer;
    tmpButton : TSpeedButton;
    BarSeries1 : TChartSeries;
begin { initialization when form is shown }

  if ShowDone then
     Exit;

  ShowDone:=True;

  ChartEditor1.TreeView:=TeeReadBoolOption(TeeMsg_TreeMode,True);

  BarSeries1:=TBarSeries.Create(Self);
  with BarSeries1 as TBarSeries do
  begin
    ColorEachPoint:=True;
    Marks.Callout.Brush.Color:=clBlack;
    Marks.Visible:=True;
    BarStyle:=bsRectGradient;
    FillSampleValues(6);
    ParentChart:=DBChart1;
  end;

  {$IFNDEF TEENOTHEMES}
  TeeNewChartTheme:=TeeReadIntegerOption(TeeMsg_DefaultOfficeTheme,12);
  TeeNewChartPalette:=TeeReadIntegerOption(TeeMsg_DefaultPalette,-1);
  CheckDefaultTheme;
  {$ENDIF}

  { get list of installed Fonts }
  ComboFonts.Items:=Screen.Fonts;

  {$IFDEF CLX}
  ComboFonts.Sorted:=True;
  ComboFonts.Items.Add('Helvetica');
  {$ENDIF}

  { Setup the Font toolbar button bitmaps }
  with ImageList3 do
  begin
    GetBitmap(14,FontBold.Glyph);
    GetBitmap(15,FontItalic.Glyph);
    GetBitmap(16,FontUnderline.Glyph);
    GetBitmap(17,FontStrike.Glyph);
    GetBitmap(18,FontLeftAlign.Glyph);
    GetBitmap(19,FontCenterAlign.Glyph);
    GetBitmap(20,FontRightAlign.Glyph);
  end;

  { Set icon for menu items "Whats this" and "Chart Properties" }
  { Works across packages too, if its compiled using packages }
  TeeLoadBitmap(Whatsthis1.Bitmap,'WHATSTHIS','');
  TeeLoadBitmap(ChartProperties1.Bitmap,'TEEEDIT','');
  TeeLoadBitmap(ChartTools1.Bitmap,'TEETOOLS','');

  { Set Data grid as Window (after loading config from Registry) }
  { 8Note: This is done here instead of at FormCreate due to a VCL bug }
  //RepositionChartGrid;

  { setup the Chart Gallery }
  with ChartGalleryPanel1 do
  begin
    clTeeGallery:=clWhite;
    clTeeGallery1:=clSilver;
    ShowHint:=True;
    NumRows:=High(ChartListXY)+1;
  end;

  TeeSetLanguage(False);

  { Translate using current language }
  TranslateMainForm;

  { change commander "save" button to go to our "save" event }
  TeeCommander1.ButtonSave.OnClick:=Save1Click;

  { change default hint for commander "normal" button }
  TeeCommander1.ButtonNormal.Hint:=TeeMsg_Select;

  { re-order some TeeCommander buttons }
  With {$IFNDEF CLR}TCommanderAccess{$ENDIF}(TeeCommander1) do
  begin
    {$IFDEF CLX}
    tmp:=2;
    {$ELSE}
    tmp:=1;
    {$ENDIF}

    { create the "e-mail" button }
    tmpButton:=CreateButton(0,SendTo1Click,TeeMsg_EMail,'',0);
    ImageList3.GetBitmap(27,tmpButton.Glyph);
    tmpButton.NumGlyphs:=1;
    SetChildOrder(Controls[ControlCount-tmp],0);

    SetChildOrder(ButtonSave,0);
    SetChildOrder(ButtonPrint,1);

    { create the "Open" button }
    tmpButton:=CreateButton(0,Open1Click,TeeMsg_Open,'',0);
    ImageList3.GetBitmap(1,tmpButton.Glyph);
    tmpButton.NumGlyphs:=1;
    SetChildOrder(Controls[ControlCount-tmp],0);

    { create the "New" button }
    tmpButton:=CreateButton(0,New1Click,TeeMsg_New,'',0);
    ImageList3.GetBitmap(0,tmpButton.Glyph);
    tmpButton.NumGlyphs:=1;
    SetChildOrder(Controls[ControlCount-tmp],0);

    { create a separator bevel }
    CreateBevel(0);
    SetChildOrder(Controls[ControlCount-tmp],5);
    RepositionControls;

    { move buttons up }
    for t:=0 to ControlCount-1 do
        Controls[t].Top:=0;

    { backup "Button 3D" event and assign new one }
    Old3DEvent:=Button3D.OnClick;
    Button3D.OnClick:=Commander3DClick;
  end;

  { Translate Commander Hints }
  TeeTranslateControl(TeeCommander1);

  { add default Gallery of Series styles }
  CreateGallery(ChartListXY);

  SetGalleryBorders;
  ChangeGalleryChartSize;

  { set Inspector properties }
  ComboBoxParts.ItemIndex:=ComboPart_Chart; { Chart }
  SetInspectorProperties;

  TeeModified(False);

  { enable series buttons }
  EnableButtons;

  { Change "Save as..." dialog title }
  SaveDialog1.Title:=TeeMsg_SaveAs;

  {$IFDEF TEEUSEMENUACTIONS}
  FMenuActions:=TMenuActions.Create(Self,Tools1,ControlBar1);
  {$ENDIF}

  AddThemes;

  PageControlSeries.DoubleBuffered:=True;
  Inspector.DoubleBuffered:=True;
  ChartGrid1.DoubleBuffered:=True;
  ChartListBox1.DoubleBuffered:=True;
  TeeCommander1.DoubleBuffered:=True;
  PanelFont.DoubleBuffered:=True;
  ChartGridNavigator1.DoubleBuffered:=True;

  { Finally (last thing to do)... }
  if ParamCount>0 then
  begin
    LoadChart(ParamStr(1)); { load chart parameter }
    ShowChartTab;
    Menu:=MainMenu1;
  end
  else
  if CBShowStartup.Checked then
  begin
    InitWelcomeChart;
    Menu:=nil;
  end;
end;

procedure TMainForm.InitWelcomeChart;

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

begin
  if Series1.Count=0 then
     Series1.FillSampleValues(20);

  ChartTool1.Width:=80;
  ChartTool1.Chart[0].Transparency:=25;

  WelcomeChart.Title.Font.Size:=22;
  WelcomeChart.Title.Font.Shadow.Visible:=True;
  WelcomeChart.Title.Font.Shadow.Size:=2;
  WelcomeChart.Title.Font.Gradient.Visible:=True;
  WelcomeChart.Title.Font.Gradient.StartColor:=clBlack;
  WelcomeChart.Title.Font.Gradient.EndColor:=clLtGray;

  ChartAnimation1.Animations[0].StartTime:=500;
  ChartAnimation1.Loop:=True;
  ChartAnimation1.Animate.Play;

  if CBLanguage.Items.Count=0 then
     PrepareLanguages;
end;

procedure TMainForm.Title1Click(Sender: TObject);
begin { Show a dialog to change the selected Series title text }
  if ChartListBox1.RenameSeries then
     TeeModified;
end;

procedure TMainForm.Change1Click(Sender: TObject);
begin { show the Chart Gallery to change the selected Series style }
  ChartListBox1.ChangeTypeSeries(Self);
  TeeModified;
end;

procedure TMainForm.CloneItemClick(Sender: TObject);
begin { duplicate the current Series }
  with ChartListBox1 do
  begin
    CloneSeries;
    ItemIndex:=Items.Count-1;
    ChartListBox1Click(Self);
  end;

  TeeModified;
end;

procedure TMainForm.LocalMenuPopup(Sender: TObject);
begin { setup popup menu options when right-clicking the Series list }
  DeleteItem.Enabled:= ChartListBox1.SelCount>0;
  CloneItem.Enabled := (DBChart1.SeriesCount>0) and (ChartListBox1.SelCount=1);
  SelectAllItem.Enabled:=ChartListBox1.Items.Count > 0;
  Change1.Enabled:=DeleteItem.Enabled;
  MenuItem2.Enabled:=CloneItem.Enabled;
  Title1.Enabled:=CloneItem.Enabled;
  MoveUp1.Enabled:=MenuItem2.Enabled and (ChartListBox1.ItemIndex>0);
  MoveDown1.Enabled:=MenuItem2.Enabled and (ChartListBox1.ItemIndex<ChartListBox1.Items.Count-1);
end;

procedure TMainForm.SelectAllItemClick(Sender: TObject);
begin { select all Series in the list }
  ChartListBox1.SelectAll;
end;

procedure TMainForm.Open1Click(Sender: TObject);
begin { show the Open dialog to load a Chart *.tee file }
  if CheckSave then
     if OpenDialog1.Execute then
        LoadChart(OpenDialog1.FileName);
end;

Procedure TMainForm.SelectorDragged(Sender:TObject);
begin { the user has dragged a shape or resized the chart }
  StatusHint.Text:='';
  AutoSize1.Checked:=DBChart1.Align=alClient;
  SetInspectorProperties;
  TeeModified;
end;

{ find a Selector tool in DBChart1 Tools array, if it exists... }
Function TMainForm.FindSelector:TSelectorTool;
var t: Integer;
begin
  result:=nil;
  for t:=0 to DBChart1.Tools.Count-1 do
  if DBChart1.Tools[t] is TSelectorTool then
  begin
    result:=TSelectorTool(DBChart1.Tools[t]);
    break;
  end;
end;

Procedure TMainForm.CreateSelector;
var t : Integer;
begin { create the Selector object }

  { first remove any existing Selector tool }
  Repeat
    Selector:=FindSelector;
    if Assigned(Selector) then Selector.Free;
  Until not Assigned(Selector);

  { create a new Selector tool }
  Selector:=TSelectorTool.Create(Self);
  with Selector do
  begin
    Brush.Color:=clWhite;
    ParentChart:=DBChart1;
    AllowResizeChart:=True;

    OnSelected:=SelectorSelected;
    OnDragged :=SelectorDragged;
    OnResized :=SelectorDragged;
    OnResizing:=SelectorResizing;
    OnDragging:=SelectorDragging;
  end;

  // disable Rotate tools, if any
  with DBChart1 do
  for t:=0 to Tools.Count-1 do
  if Tools[t] is TRotateTool then
     Tools[t].Active:=False;

  if Assigned(IPanelFont) then
  begin
    IPanelFont:=nil;
    SetPanelFont(nil);
  end;
end;

Procedure TMainForm.LoadChart(Const AFileName:String);
{$IFDEF CLR}
var tmpChart : TCustomChart;
{$ELSE}
Var tmp : TFileStream;
    tmpSource : TComponent;
{$ENDIF}
begin { load a Chart from file, and setup several things }

  { first reset the chart (empty) }
  ResetChart;
  TeeModified(False);

  LBSources.Clear;

  try
    { set Alignment to "none" }
    DBChart1.Align:=alNone;

    { disable OpenGL if active }
    if OpenGL1.Checked then OpenGL1Click(Self);

    { load from file }
    {$IFDEF CLR}

    tmpChart:=TCustomChart(DBChart1);
    LoadChartFromFile(tmpChart,AFileName);
    DBChart1:=TDBChart(tmpChart);

    {$ELSE}


    //  LoadChartFromFile(TCustomChart(DBChart1),AFileName);

    tmp:=TFileStream.Create(TeeCheckExtension(AFileName),fmOpenRead or fmShareDenyWrite);
    try
      LoadChartFromStreamCheck(TCustomChart(DBChart1),tmp,nil,True);

      while tmp.Position<tmp.Size do
      begin
        tmpSource:=tmp.ReadComponent(nil);

        if Assigned(tmpSource) then
        begin
          Self.InsertComponent(tmpSource);
          LBSources.Items.AddObject(tmpSource.Name,tmpSource);
        end;
      end;

      EnableSourceButtons;

    finally
      tmp.Free;
    end;
    {$ENDIF}

    { check Left / Top position if Alignment is "none" }
    if DBChart1.Align=alNone then
    begin
      DBChart1.Left:=0;
      DBChart1.Top:=0;
    end;

    { disable the DrawLineTool if it exists.. (do not create) }
    if FindDrawLineTool<>nil then
       DrawLineTool.EnableDraw:=False;

    { set the main form Caption with the loaded filename }
    CurrentFile:=AFileName;
    MainSetCaption;

    { add the loaded filename to "recent files" menu }
    FRecentFiles.Add(TeeCheckExtension(AFileName));

  finally
    { create the "Selector" object }
    CreateSelector;

    CreateFullScreen;

    { set some menu items }
    SetChartMenuItems;

    { Gallery in 2D or 3D }
    ChartGalleryPanel1.View3D:=DBChart1.View3D;

    { Select the first series (if it exists) }
    if DBChart1.SeriesCount>0 then
    begin
      ChartListBox1.SelectedSeries:=DBChart1[0];
      ChartListBox1Click(Self);
    end;

    { reset data Grid }
    ChartGrid1.RecalcDimensions;

    { refresh Chart Page Navigator }
    ChartPageNavigator1.EnableButtons;

    { update Selector and inspector }
    Selector.ClearSelection;
  end;

  { mark the Chart as "not modified" }
  TeeModified(False);

  { make sure the Chart tab is selected }
  ShowChartTab;
end;

Procedure TMainForm.CreateFullScreen;

  Function FindFullScreen:TFullScreenTool;
  var t: Integer;
  begin
    result:=nil;
    for t:=0 to DBChart1.Tools.Count-1 do
    if DBChart1.Tools[t] is TFullScreenTool then
    begin
      result:=TFullScreenTool(DBChart1.Tools[t]);
      break;
    end;
  end;

begin { create full screen tool }

  repeat
    FullScreen:=FindFullScreen;
    if Assigned(FullScreen) then
       FullScreen.Free;
  until not Assigned(FullScreen);

  FullScreen:=DBChart1.Tools.Add(TFullScreenTool) as TFullScreenTool;
  FullScreen.OnReset:=ResetFullScreen;
end;

Procedure TMainForm.SetChartMenuItems;
begin { set menu items depending on Chart properties }
  Legend1.Checked:=DBChart1.Legend.Visible;
  Axes1.Checked  :=DBChart1.Axes.Visible;
  Titles1.Checked :=DBChart1.Title.Visible or DBChart1.Foot.Visible;
  AutoSize1.Checked:=DBChart1.Align=alClient;

  {$IFNDEF LINUX}
  {$IFNDEF CLR}
  OpenGL1.Checked:=TeeOpenGL1.Active;
  {$ENDIF}
  {$ENDIF}
end;

Procedure TMainForm.MainSetCaption;
var tmp: String;
begin { set the Caption on the main form }
  tmp:=TeeMsg_TeeChartOffice+' - ';
  if CurrentFile='' then Caption:=tmp+TeeMsg_Chart1
                    else Caption:=tmp+ExtractFileName(CurrentFile);
end;

Function TMainForm.ToogleModified(Item: TMenuItem):Boolean;
begin { toogle menu item and set Chart modified }
  result:=Toogle(Item);
  TeeModified;
end;

procedure TMainForm.Axes1Click(Sender: TObject);
begin { show / hide Chart axes }
  DBChart1.Axes.Visible:=ToogleModified(Axes1);
end;

procedure TMainForm.TeeChartWeb1Click(Sender: TObject);
begin { go to Steema TeeChartOffice web home page }
  TeeGotoURL(Handle,TeeSteemaMainURL);
end;

procedure TMainForm.ChartTools1Click(Sender: TObject);
begin { show the Chart editor at the Tools Tab }
  with ChartEditor1 do
  begin
    DefaultTab:=cetTools;
    Execute;
    DefaultTab:=cetMain;
  end;
end;

procedure TMainForm.DBChart1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);

  Procedure CheckCornerCursor;
  begin { change Cursor if moving around the Chart right-bottom corner }
    with DBChart1 do
    if Selector.ClickedCorner(X,Y) then
    begin
      Cursor:=crSizeNWSE;
      OriginalCursor:=crSizeNWSE;
      CancelMouse:=True;
    end
    else { reset Chart Cursor to default }
    if Cursor=crSizeNWSE then
    begin
      Cursor:=crDefault;
      OriginalCursor:=crDefault;
    end;
  end;

var Part: TChartClickedPart;
    S   : String;
begin { check what Chart part is under the mouse, and show it at the status bar }

  { first check the Selector component exists. If not, create it }
  if FindSelector=nil then CreateSelector;

  { what chart part is under the mouse ?  }
  DBChart1.CalcClickedPart(TeePoint(X,Y),Part);
  Case Part.Part of
        cpLegend:  S:=TeeMsg_Legend;
         cpAxis:   S:=DBChart1.AxisTitleOrName(Part.AAxis);
         cpSeries: begin
                     S:=SeriesTitleOrName(Part.ASeries)+' '+IntToStr(Part.PointIndex);
                     Selector.Part.PointIndex:=Part.PointIndex;
                     StatusBar1.Invalidate;
                   end;
    cpSeriesMarks: S:=SeriesTitleOrName(Part.ASeries)+' '+TeeMsg_Marks;
      cpSubTitle,
        cpTitle,
      cpSubFoot,
        cpFoot:   S:=SelectedTitleName;
  else
  begin
    S:='';
    { mouse is at right-bottom chart corner for resizing ? }
    CheckCornerCursor;
  end;
  end;

  { change the StatusBar first panel text }
  StatusBar1.Panels[0].Text:=S;
end;

procedure TMainForm.DBChart1DblClick(Sender: TObject);
begin { Show the Chart editor when double-clicking the Chart }
  if Assigned(Selector.Annotation) then
  begin
    EditAnnotationClick(Self);
    DBChart1.CancelMouse:=True;
    Selector.StopDragging;
    TeeModified;
  end
  else
  if Selector.Part.Part<>cpNone then
  begin
    { show chart editor for the current selected part }
    EditChartPart(nil,DBChart1,Selector.Part);
    { just in case the Selector tool is removed when editing }
    if FindSelector=nil then CreateSelector;
    { stop mouse }
    DBChart1.CancelMouse:=True;
    Selector.StopDragging;
    { mark chart as modified }
    TeeModified;
  end;
end;

procedure TMainForm.OpenGL1Click(Sender: TObject);
begin { enable / disable OpenGL rendering }

  {$IFNDEF LINUX}
  Screen.Cursor:=crHourGlass;
  try
    { make sure we are in 3D... }
    DBChart1.View3D:=True;

    { activate OpenGL }
    {$IFNDEF CLR}
    TeeOpenGL1.Active:=ToogleModified(OpenGL1);
    {$ENDIF}
  finally
    Screen.Cursor:=crDefault;
  end;

  {$ENDIF}
end;

procedure TMainForm.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin { check if necessary to Save before closing }
  if FModified then
  begin
    CanClose:=CheckSave;
    if CanClose and FModified then
    begin
      Save1Click(Self);
      CanClose:=not FModified;
    end;
  end
  else CanClose:=True;
end;

Function TMainForm.CheckSave:Boolean;

  Function CurrentFileName:String;
  begin
    result:=ExtractFileName(CurrentFile);
    if result='' then result:=TeeMsg_Chart1;
  end;

begin { ask the user if wants to Save the current Chart }
  result:=False;
  if not FModified then
     result:=True
  else
  Case MessageDlg(Format(TeeMsg_WantToSave,[CurrentFileName]),
                  mtConfirmation,[mbYes,mbNo,mbCancel],0) of
    mrYes   : result:=True;
    mrNo    : begin
                TeeModified(False);
                result:=True;
              end;
    mrCancel: result:=False;
  end;
end;

procedure TMainForm.Print1Click(Sender: TObject);
begin { Print the Chart }
  with TPrintDialog.Create(Self) do
  try
    if Execute then DBChart1.Print;
  finally
    Free;
  end;
end;

procedure TMainForm.New1Click(Sender: TObject);
begin { reset the current Chart (create a new Chart) }
  CreateNewChart;
  ShowChartTab;
end;

Function TMainForm.CreateNewChart(InitSeries:Boolean=True):Boolean;
var tmp : Boolean;
    tmpS : TFastLineSeries;
begin { create a new Chart, remove current chart series and tools }

  // First of all, check nothing is pending to save...
  tmp:=False;
  FormCloseQuery(Self,tmp);

  if tmp then
  begin
    // Initialize chart
    ResetChart;

    // Apply default theme...
    CheckDefaultTheme;

    if InitSeries then
    begin
      { create Selector tool }
      CreateSelector;

      CreateFullScreen;

      { Create default Gallery }
      tmpS:=TFastLineSeries.Create(nil);
      try
        if not ExistGallerySeries(tmpS) then
           CreateGallery(ChartListXY);
      finally
        tmpS.Free;
      end;

      { refresh Page navigator }
      ChartPageNavigator1.EnableButtons;

      { refresh Series list buttons }
      EnableButtons;

      { refresh inspector }
      SetInspectorProperties;
    end;
  end;

  result:=tmp;
end;

Procedure TMainForm.ResetChart;
var tmpEmpty : TDBChart;
begin { empty the current chart }

  { remove "selector" }
  Selector.ClearSelection;
  Selector:=nil;

  { remove all "Series" }
  DBChart1.FreeAllSeries;
  DBChart1.Tools.Clear;

  ChartGrid1.RecalcDimensions;

  CurrentFile:='';
  MainSetCaption;

  { Create an empty chart }
  tmpEmpty:=TDBChart.Create(nil);
  try
    tmpEmpty.AllowZoom:=False;
    tmpEmpty.AllowPanning:=pmNone;

    tmpEmpty.Color:=clWhite;

    { Assign empty to current }
    TThemesList.Apply(DBChart1,tmpEmpty);
    //DBChart1.Assign(tmpEmpty);

    DBChart1.Title.Text.Add(TeeMsg_Chart1);

  finally
    tmpEmpty.Free;
  end;
end;

type
  TTeeWizardAccess=class(TTeeDlgWizard);

procedure TMainForm.NewusingWizard1Click(Sender: TObject);
{$IFDEF CLR}
var tmpChart : TCustomChart;
{$ENDIF}
begin { create a new Chart using the Wizard }
  With TTeeWizardAccess(TTeeDlgWizard.Create(Self)) do
  try
    if ShowModal=mrOk then
    begin
      { assign the new Chart }
      if Self.CreateNewChart(False) then
      begin
        {$IFDEF CLR}
        tmpChart:=TCustomChart(Self.DBChart1);
        CopyPreviewChart(tmpChart);
        Self.DBChart1:=TDBChart(tmpChart);
        {$ELSE}
        CopyPreviewChart(TCustomChart(Self.DBChart1));
        {$ENDIF}

        { setup Series list box and Gallery }
        ChartListBox1Click(Self);

        ShowChartTab;
      end;

      TeeModified;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.HideSerieslist1Click(Sender: TObject);
begin { Hide the Series list panel }
  PanelSeries.TabVisible:=False;
  SeriesList1.Checked:=False;
  CheckInspectorList;
end;

Procedure TMainForm.CheckInspectorList;
begin { check if necessary to show Panel1 (around Inspector and Series list) }
  Panel1.Visible:=PanelSeries.TabVisible or PanelInspector.Visible;
  Splitter1.Visible:=Panel1.Visible;
  Splitter2.Visible:=PanelSeries.TabVisible and PanelInspector.Visible;
  if Splitter2.Visible then Splitter2.Top:=PanelInspector.Top-1;
end;

procedure TMainForm.Inspector1Click(Sender: TObject);
begin { show / hide the Inspector panel }
  PanelInspector.Visible:=Toogle(Inspector1);
  CheckInspectorList;
end;

procedure TMainForm.Serieslist1Click(Sender: TObject);
begin  { show / hide the Series list panel }
  PanelSeries.TabVisible:=Toogle(SeriesList1);
  CheckInspectorList;
end;

procedure TMainForm.Hideinspector1Click(Sender: TObject);
begin { Hide the Inspector panel }
  PanelInspector.Visible:=False;
  Inspector1.Checked:=False;
  CheckInspectorList;
end;

Function TMainForm.StatusHint:TStatusPanel;
begin { returns status bar Panel for Hint text }
  result:=StatusBar1.Panels[2];
end;

{ Registry key to store the "recent files" }
const TeeChartOfficeRecentKey=TeeChartOfficeKey+'\RecentFiles';

Procedure TMainForm.TeeCommander1SetLabel(Sender:TTeeCommander; Var Text:String);
begin { show the TeeCommander "hint" in the status bar }
  if Text=TeeCommanMsg_NormalLabel then Text:='';
  StatusHint.Text:=Text;
end;

{ internal accessors (to access Protected properties) }
type TChartGridAccess=class(TChartGrid);
     TChartListBoxAccess=class(TChartListBox);

procedure TMainForm.FormCreate(Sender: TObject);

  Procedure CreateConfiguration;
  begin { create and load program configuration }
    FConfig:=TTeeConfiguration.Create;

    with FConfig do
    begin
      Identifier:=TeeChartOfficeKey+'\Config';
      Add(Self);
      Add('SeriesList','Checked',SeriesList1);
      Add('StatusBar','Visible',StatusBar1);
      Add('Gallery','Visible',ChartGalleryPanel1);
      Add('GalleryRight','Checked',RightSide1);
      Add('GallerySmooth','Checked',Smooth1);
      Add('GalleryBorder','Checked',Borders1);
      Add('GallerySmall','Checked',Small1);

      Add('ToolSeriesList','Checked',TopToolBar);

      Add('ToolFont','Checked',Font1);
      Add('ToolMain','Checked',Standard1);
      Add('ToolTools','Checked',Tools2);

      Add('ToolBarsTop','Checked',AlignToTop1);

      Add('DataAtTop','Checked',dataTop);

      Add('ShowWelcome','Checked',CBShowStartup);

      { load configuration from registry }
      Load;

      { Set menu items with loaded settings }
      Statusbar2.Checked:=StatusBar1.Visible;
      PanelSeries.TabVisible:=SeriesList1.Checked;
      Gallery1.Checked:=ChartGalleryPanel1.Visible;

      if not RightSide1.Checked then
      begin
        SplitterGallery.Align:=alLeft;
        ChartGalleryPanel1.Align:=alLeft;
        SplitterGallery.Left:=ChartGalleryPanel1.Left+ChartGalleryPanel1.Width;
      end;

      PanelFont.Visible:=Font1.Checked;
      TeeCommander1.Visible:=Standard1.Checked;
      PanelTools.Visible:=Tools2.Checked;

      ChartGalleryPanel1.Smooth:=Smooth1.Checked;
      TChartGalleryPanel.SaveSmooth(Smooth1.Checked);

      if not TopToolBar.Checked then
      begin
        ToolBar1.Align:=alBottom;
        ToolBar2.Align:=alBottom;
      end;

      if AlignToTop1.Checked then
      begin
        ControlBar1.Align:=alTop;
        AlignToBottom1.Checked:=False;
      end
      else
      begin
        ControlBar1.Align:=alBottom;
        AlignToBottom1.Checked:=True;
      end;

      ArrangeToolbars;

      CheckInspectorList;
    end;
  end;

  procedure FillDefaultSeriesArrays;
  begin
    // 2D
    
    ChartListXY[0]:=TLineSeries;
    ChartListXY[1]:=TBarSeries;
    ChartListXY[2]:=THorizBarSeries;
    ChartListXY[3]:=TPieSeries;
    ChartListXY[4]:=TPointSeries;
    ChartListXY[5]:=THorizLineSeries;
    ChartListXY[6]:=TDonutSeries;
    ChartListXY[7]:=TBarJoinSeries;
    ChartListXY[8]:=TVolumeSeries;
    ChartListXY[9]:=TFastLineSeries;
    ChartListXY[10]:=TAreaSeries;
    ChartListXY[11]:=THistogramSeries;
    ChartListXY[12]:=TBezierSeries;
    ChartListXY[13]:=TPyramidSeries;
    ChartListXY[14]:=TPolarSeries;
    ChartListXY[15]:=TRadarSeries;
    ChartListXY[16]:=TMyPointSeries;
    ChartListXY[17]:=THorizAreaSeries;

    // 3D

    ChartListXYZ[0]:=TSurfaceSeries;
    ChartListXYZ[1]:=TWaterFallSeries;
    ChartListXYZ[2]:=TContourSeries;
    ChartListXYZ[3]:=TTriSurfaceSeries;
    ChartListXYZ[4]:=TColorGridSeries;
    ChartListXYZ[5]:=TPoint3DSeries;
  end;

var tmp : TBitmap;
begin { initialization }

  FillDefaultSeriesArrays;

  DrawGrayScale   :=-1;
  DrawGrayInverted:=False;

  PageControlSeries.HotTrack:=True;
  PageControlSeries.ActivePage:=PanelSeries;

  EnableSourceButtons;

  DBChart1.Color:=clWhite;
  Inspector.Color:=clWhite;
  ChartGalleryPanel1.Color:=clWhite;

  Inspector.DefaultColWidth:=100;

  {$IFNDEF CLX}
  Text1.Default:=True;
  Edit2.Default:=True;
  Edit3.Default:=True;
  Edit4.Default:=True;
  Edit5.Default:=True;
  Edit6.Default:=True;
  EditAnnotation.Default:=True;
  {$ENDIF}


  Smooth1.OnClick:=Smooth1Click;
  
  OpenDialog1.Options:=[ {$IFNDEF CLX}
                         ofHideReadOnly,
                         {$ENDIF}
                         ofFileMustExist,
                         {$IFNDEF CLX}
                         ofCreatePrompt,
                         {$ENDIF}
                         ofEnableSizing];

  SaveDialog1.Options:=[ ofOverwritePrompt,
                         {$IFNDEF CLX}
                         ofHideReadOnly,
                         {$ENDIF}
                         ofEnableSizing];

  {$IFNDEF CLX}

  { set scrolling box bars as Flat }
  with ScrollBox2 do
  begin
    HorzScrollBar.Style:=ssFlat;
    VertScrollBar.Style:=ssFlat;
  end;

  { default tabs at bottom }
  PageControl1.TabPosition:=tpBottom;
  {$ENDIF}

  {$IFNDEF LINUX}
  {$IFNDEF CLR}
  TeeOpenGL1:=TTeeOpenGL.Create(Self);
  TeeOpenGL1.TeePanel:=DBChart1;
  {$ENDIF}
  {$ENDIF}

  { disable showing axes labels at chart Gallery when maximizing }
  TeeGalleryCheckMaximize:=False;

  Smooth1.Checked:=ChartGalleryPanel1.DefaultSmooth;

  // Reduce a little bit the height of series listbox items,
  // to fit more series...

  {$IFDEF CLR}
  ChartListBox1.ItemHeight:=ChartListBox1.ItemHeight-2;
  {$ELSE}
  with TChartListBoxAccess(ChartListBox1) do ItemHeight:=ItemHeight-2;
  {$ENDIF}

  {$IFNDEF CLX}

  { tell Windows to accept dragged files from Explorer }
  DragAcceptFiles(Handle,True);

  {$ENDIF}

  { redirect the TeeCommander toolbar "hints" to status bar }
  TeeCommander1.OnSetLabel:=TeeCommander1SetLabel;

  { set the commander to use the ChartEditor and ChartPreviewer
    in this Form instead of the internal ones }
  TeeCommander1.ChartEditor:=ChartEditor1;
  TeeCommander1.Previewer:=ChartPreviewer1;

  { Create the "recent files" submenu in File-> menu }
  FRecentFiles:=TRecentFiles.Create;
  with FRecentFiles do
  begin
    MenuItem:=Reopen1;
    MenuSep:=N3;
    ReOpenFileEvent:=Self.ReOpenFile;
    ReadRegistry(TeeChartOfficeRecentKey);
  end;

  {$IFDEF D16}
  CurrentTheme:=TeeReadStringOption('TeeChartOffice_Theme','');
  if CurrentTheme<>'' then
     TStyleManager.TrySetStyle(CurrentTheme);
  {$ENDIF}

  ChartGridNavigator1.Buttons[nbDelete].Visible:=True;
  ChartGridNavigator1.Buttons[nbEdit].Visible:=True;
  ChartGridNavigator1.Buttons[nbPost].Visible:=True;
  ChartGridNavigator1.Buttons[nbCancel].Visible:=True;

  { create the Configuration object and load from registry }
  CreateConfiguration;

  { set ChartGrid OnChangeColor event }
  ChartGrid1.OnChangeColor:=ChartGridChangeColor;

  { disable controls in Font toolbar }
  EnablePanelFont(False);

  { set this main form caption }
  MainSetCaption;

  { create the "selector" object, to allow selecting Chart parts }
  CreateSelector;

  CreateFullScreen;

  { Set Data grid internal option }
  {$IFDEF CLR}
  ChartGrid1.AllowChanges:=True;
  {$ELSE}
  TChartGridAccess(ChartGrid1).AllowChanges:=True;
  {$ENDIF}

  PageControl1.ActivePage:=TabDesign;
  
  { Start at Welcome tab }

  if CBShowStartup.Checked then
     MainPage.ActivePage:=TabWelcome
  else
     ShowChartTab;

  // VCL <--> CLX Compatibility.
  // Load ImageList bitmaps from resource.
  tmp:=TBitmap.Create;
  try
    TeeLoadBitmap(tmp,'TeeOfficeAllBmps','');
    if not tmp.Empty then
       ImageList3.AddMasked(tmp,clFuchsia);
  finally
    tmp.Free;
  end;

  { Set up hook with Edit Series form }
  InternalOnCreateEditSeriesObj:=OnCreateEditSeries;
end;

Function TMainForm.SelectedTitleName:String;
begin { returns the name of the selected Title or Footer }
  case Selector.Part.Part of
    cpSubTitle,
        cpTitle: result:=TeeMsg_Title;
    cpSubFoot,
         cpFoot: result:=TeeMsg_Foot;
  else
    result:='';
  end;
end;

Procedure TMainForm.SelectorSelected(Sender:TObject);
var tmp:        TTeeFont;
    tmpJustify: TEnableJustify;
    tmpJustification : TAlignment;

   Procedure SelectTitle(const ATitle:TChartTitle);
   begin
     tmp:=ATitle.Font;
     { set Title right-click popup menu }
     DBChart1.PopupMenu:=PopupMenuTitle;
     { select at Inspector }
     ComboBoxParts.Items[ComboPart_Title]:=SelectedTitleName;
     ComboBoxParts.ItemIndex:=ComboPart_Title;
     { enable text Justify }
     tmpJustify:=ejAll;
     tmpJustification:=Selector.SelectedTitle.Alignment;

     { Selected Border }
     SelectedBorder:=ATitle.Frame;
   end;

   Procedure SelectSeries(APartIndex:Integer);
   var tmpSt: String;
   begin
     { change text in combobox at inspector }
     tmpSt:=SeriesTitleOrName(Selector.Series);
     if APartIndex=ComboPart_Marks then
        tmpSt:=tmpSt+' '+TeeMsg_Marks;

     ComboBoxParts.Items[APartIndex]:=tmpSt;

     { set item index }
     ComboBoxParts.ItemIndex:=APartIndex;

     { use selected Series Marks Font }
     if APartIndex=ComboPart_Marks then { Series Marks }
     begin
       with Selector.Series.Marks do
            if Visible then tmp:=Font;

       DBChart1.PopupMenu:=PopupMenuMarks;

     end
     else
       DBChart1.PopupMenu:=PopupMenuSeries;

     { Set selected Series at series-list-box }
     ChartListBox1.ClearSelection;
     ChartListBox1.SelectedSeries:=Selector.Series;
     ChartListBox1Click(Self);

     if APartIndex=ComboPart_Marks then
     begin
       Selector.Part.Part:=cpSeriesMarks;
       { Selected Border }
       SelectedBorder:=Selector.Series.Marks.Frame;
     end
     else SelectedBorder:=Selector.Series.Pen;

     if Selector.Part.PointIndex<>-1 then
        ChartGrid1.Row:=Selector.Part.PointIndex+2;
   end;

   Procedure SelectAxis;
   begin
     { axis selected }
     tmp:=Selector.Part.AAxis.LabelsFont;

     { change text and item index }
     ComboBoxParts.Items[ComboPart_Axis]:=DBChart1.AxisTitleOrName(Selector.Part.AAxis);
     ComboBoxParts.ItemIndex:=ComboPart_Axis;

     { labels text justification }
     with Selector.Part.AAxis do
     begin
       if Horizontal then tmpJustify:=ejNo
       else
       begin
         tmpJustify:=ejNoCenter;

         if LabelsAlign=alDefault then
            if OtherSide then tmpJustification:=taLeftJustify
                         else tmpJustification:=taRightJustify
         else
            if OtherSide then tmpJustification:=taRightJustify
                         else tmpJustification:=taLeftJustify;
       end;
     end;

     DBChart1.PopupMenu:=PopupMenuAxis;

     { Selected Border }
     SelectedBorder:=Selector.Part.AAxis.Axis;
   end;

   Procedure SelectWall(const AWall:TChartWall);
   var tmpSt : String;
   begin
     { change text and item index }
     if AWall=DBChart1.LeftWall then tmpSt:=TeeMsg_LeftWall
     else
     if AWall=DBChart1.BottomWall then tmpSt:=TeeMsg_BottomWall
     else
     if AWall=DBChart1.RightWall then tmpSt:=TeeMsg_RightWall
     else
     if AWall=DBChart1.BackWall then tmpSt:=TeeMsg_BackWall;

     { set text }
     ComboBoxParts.Items[ComboPart_Wall]:=tmpSt;
     ComboBoxParts.ItemIndex:=ComboPart_Wall;

     { set popup menu }
     DBChart1.PopupMenu:=PopupMenuWall;

     { Selected Border }
     SelectedBorder:=AWall.Frame;
   end;

   Procedure SelectLegend;
   begin
     tmp:=DBChart1.Legend.Font;
     DBChart1.PopupMenu:=PopupLegend;
     { select at Inspector }
     ComboBoxParts.ItemIndex:=ComboPart_Legend;
     { Selected Border }
     SelectedBorder:=DBChart1.Legend.Frame;
   end;

begin { when something in the Chart is clicked,
        set the Font toolbar. Also set popup-menus. }

  DBChart1.PopupMenu:=nil;
  SelectedBorder:=nil;
  tmpJustify:=ejNo;

  tmp:=nil;
  Case Selector.Part.Part of
    cpLegend     : SelectLegend;
    cpTitle      : SelectTitle(DBChart1.Title);
    cpSubTitle   : SelectTitle(DBChart1.SubTitle);
    cpFoot       : SelectTitle(DBChart1.Foot);
    cpSubFoot    : SelectTitle(DBChart1.SubFoot);
    cpAxis       : SelectAxis;
    cpSeriesPointer,
    cpSeries     : SelectSeries(ComboPart_Series);
    cpSeriesMarks: SelectSeries(ComboPart_Marks);
    cpChartRect  : SelectWall(Selector.Wall);
  else
    { choose right-click popup menu }
    if Assigned(Selector.Annotation) then
    begin
      tmp:=Selector.Annotation.Shape.Font;
      DBChart1.PopupMenu:=PopupMenuAnn;

      { add Annotation to combobox the first time }
      with ComboBoxParts do
      if Items.IndexOf(TeeMsg_Annotation)=-1 then
         Items.Add(TeeMsg_Annotation);

      ComboBoxParts.ItemIndex:=ComboPart_Annot;

      { Selected Border }
      SelectedBorder:=Selector.Annotation.Shape.Frame;
    end
    else
    begin
      DBChart1.PopupMenu:=PopupMenuPanel;
      ComboBoxParts.ItemIndex:=ComboPart_Chart;
    end;
  end;

  { set Font toolbar }
  SetPanelFont(tmp,tmpJustify,tmpJustification);

  { set Border toolbar }
  SetBorderToolbar;

  { set Properties }
  SetInspectorProperties;
  Inspector.Row:=1;
end;

Procedure TMainForm.SetInspectorProperties;
begin { set properties at inspector, if any }
  { if Series menu, do merging }
  if DBChart1.PopupMenu=PopupMenuSeries then MergeSeriesMenu;
  { Set menu properties at inspector }
  Inspector.SetProperties(DBChart1.PopupMenu);
end;

Procedure TMainForm.EnablePanelFont(IsEnabled:Boolean);
var t: Integer;
begin { enable / disable buttons in the Font toolbar }
  for t:=0 to PanelFont.ControlCount-1 do
      PanelFont.Controls[t].Enabled:=IsEnabled;
  if IsEnabled then ShapeFontColor.Pen.Color:=clBlack
  else
  begin
    ShapeFontColor.Pen.Color:=clSilver;
    ShapeFontColor.Brush.Color:=clWhite;
    ComboFonts.ItemIndex:=-1;
    ComboFontSize.ItemIndex:=-1;
    ComboFontSize.Text:='';
    UDFontInter.Position:=0;
  end;
end;

procedure TMainForm.Save1Click(Sender: TObject);
begin { save a Chart, check if necessary to show the Save dialog }
  if CurrentFile='' then
  begin
    SaveDialog1.FileName:=TeeMsg_Chart1;
    if SaveDialog1.Execute then
       CurrentFile:=SaveDialog1.FileName;
  end;

  if CurrentFile<>'' then DoSaveChart;
end;

Procedure TMainForm.DoSaveChart;
Var tmp : TFileStream;
    t   : Integer;
    tmpSource : TComponent;
begin { save the Chart to a *.tee file and add it to "recent files" menu }

  { disable things we dont want to be saved }
  Selector.ParentChart:=nil;
  FullScreen.ParentChart:=nil;
  DBChart1.OnDblClick:=nil;
  DBChart1.OnMouseMove:=nil;
  DBChart1.OnAfterDraw:=nil;
  try
    // Save the Chart !

    // SaveChartToFile(DBChart1,CurrentFile); <-- replaced with code below

    tmp:=TFileStream.Create(TeeCheckExtension(CurrentFile),fmCreate);
    try
      SaveChartToStream(DBChart1,tmp,True,False);
      for t:=0 to LBSources.Items.Count-1 do
      begin
        tmpSource:=TComponent(LBSources.Items.Objects[t]);
        tmp.WriteComponent(tmpSource);
      end;
    finally
      tmp.Free;
    end;

    FRecentFiles.Add(TeeCheckExtension(CurrentFile));
    MainSetCaption;
    TeeModified(False);
  finally

    { reset internal events and Selector tool }
    FullScreen.ParentChart:=DBChart1;
    Selector.ParentChart:=DBChart1;
    DBChart1.OnDblClick:=DBChart1DblClick;
    DBChart1.OnMouseMove:=DBChart1MouseMove;
    DBChart1.OnAfterDraw:=DBChart1AfterDraw;
  end;
end;

procedure TMainForm.ReOpenFile(const FileName: String);
begin { when clicking the "recent files" menu, open a file }
  if CheckSave then
     LoadChart(FileName);
end;

procedure TMainForm.Exit1Click(Sender: TObject);
begin { finish application }
  Close;
end;

procedure TMainForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  { when closing the program, save the "recent files" to registry }
  FRecentFiles.WriteRegistry(TeeChartOfficeRecentKey);

  // Save current configuration (IDE options)
  FConfig.Save;
end;

procedure TMainForm.ImportfromWeb1Click(Sender: TObject);

  Procedure ImportChartFromWeb;
  begin
    if CheckSave then { ask pending save }
    begin
      Screen.Cursor:=crHourGlass;
      try
        StatusHint.Text:=Format(TeeMsg_ImportingWeb,[ChartWebSource1.URL]);
        StatusBar1.Update;
        try
          { reset and load chart from web }
          ResetChart;
          try
            ChartWebSource1.Execute;
          finally
            { always create the "selector" tool }
            CreateSelector;
          end;
        finally
          StatusHint.Text:='';
        end;

        CurrentFile:='';

        { mark chart as modified }
        TeeModified;
      finally
        Screen.Cursor:=crDefault;
      end;
    end;
  end;

begin { Show the Web Chart Gallery or load a Chart from a web URL pointing
        to a *.tee file }

  {$IFNDEF CLX}

  With TWebGallery.Create(nil) do
  try
    URL.Text:=ChartWebSource1.URL;

    { show the dialog... }
    if ShowModal=mrOk then
    begin
      { load chart from web address URL }
      ChartWebSource1.URL:=URL.Text;
      ImportChartFromWeb;
    end;
  finally
    Free;
  end;

  {$ENDIF}
end;

type TSeriesAccess=class(TChartSeries);

procedure TMainForm.TeeCommander1EditedChart(Sender: TTeeCommander;
  AChart: TCustomChart);
begin { after showing the Chart Editor dialog, set the Modified variable }
  TeeModified;
end;

procedure TMainForm.ChartGalleryPanel1ChangeChart(Sender: TObject);
var tmpClass:         TChartSeriesClass;
    tmpFunctionClass: TTeeFunctionClass;
    SubIndex:         Integer;
    tmpSeries:        TChartSeries;
begin { change the selected Series type (ie: from Line to Bar) }

  // Deprecated
  tmpFunctionClass:=nil;
  SubIndex:=0;

  if ChartGalleryPanel1.GetSeriesClass(tmpClass,tmpFunctionClass,SubIndex) then
  begin
    tmpSeries:=ChartListBox1.SelectedSeries;

    if Assigned(tmpSeries) then
      if tmpSeries.ClassType<>tmpClass then
      begin
        { reset selector }
        with Selector do
             if (Part.Part=cpSeries) or (Part.Part=cpSeriesMarks) then
                ClearSelection;

        { change series type }
        ChangeSeriesType(tmpSeries,tmpClass);

        {$IFNDEF CLR}
        TSeriesAccess(tmpSeries).SetSubGallery(tmpSeries,SubIndex);
        {$ENDIF}

        ChangeToNewSeries(tmpSeries);
      end
      else
      if InSubGallery then
      begin
        SubIndex:=ChartGalleryPanel1.Charts.IndexOf(ChartGalleryPanel1.SelectedChart);

        if SubIndex>-1 then
        begin
          { series type is the same, but sub-type is different }
          {$IFNDEF CLR}
          TSeriesAccess(tmpSeries).SetSubGallery(tmpSeries,SubIndex);
          {$ENDIF}

          { check series properties }
          CheckSeriesButtons(tmpSeries);

          TeeModified;
        end;
      end;
  end;
end;

procedure TMainForm.ChangeToNewSeries(Series:TChartSeries);
begin
  { reset Gallery series }
  ChartGalleryPanel1.SelectedSeries:=Series;

  { reset ListBox series }
  ChartListBox1.SelectedSeries:=Series;

  { check series properties }
  CheckSeriesButtons(Series);

  { set Selector }
  Selector.Series:=Series;

  { set toolbar buttons }
  EnableToolButtons(Series);

  TeeModified;
end;

Procedure RegisterTeeChartOffice;
Const TeeChart_MIME='\MIME\Database\Content Type\application/teechart';
{$IFNDEF LINUX}
Var tmp : TRegistry;
{$ENDIF}

  {$IFNDEF LINUX}
  Function ExistExtension:Boolean;
  begin { Returns True if the *.tee extension is correctly registered }
    result:=tmp.KeyExists('.tee');
    if result then
       if tmp.OpenKey('TeeChart\DefaultIcon',True) then
          result:=tmp.ReadString('')=ParamStr(0)+',0';
  end;
  {$ENDIF}

begin  { register the *.tee file extension to allow using TeeChartOffice
         when double-clicking a *.tee file in Windows Explorer }

  {$IFNDEF LINUX}
  tmp:=TRegistry.Create;
  with tmp do
  try
    RootKey:=HKEY_CLASSES_ROOT;
    if not ExistExtension then { check if exists... }
    begin
      { extension }
      if OpenKey('.tee',True) then
      try
        WriteString('','TeeChart');
        WriteString('Content Type','application/teechart');
      finally
        CloseKey;
      end;
      { application }
      if OpenKey('TeeChart',True) then
      begin
        WriteString('','TeeChart file');
        if OpenKey('DefaultIcon',True) then
        begin
          WriteString('',ParamStr(0)+',0');
          CloseKey;
        end;
        if OpenKey('TeeChart',True) then
        if OpenKey('Shell',True) then
           if OpenKey('Open',True) then
           begin
             WriteString('',TeeMsg_OpenWithTeeChartOffice);
             if OpenKey('Command',True) then
                WriteString('',ParamStr(0)+' "%1"');
           end;
      end;

      {$IFNDEF CLR}
      { notify Windows on creating file *.tee association }
      SHChangeNotify(SHCNE_ASSOCCHANGED,SHCNF_IDLIST,nil,nil);
      {$ENDIF}
    end;
    { Add MIME content-type to registry database... }
    if not KeyExists(TeeChart_MIME) then
    begin
      if OpenKey(TeeChart_MIME,True) then
         WriteString('Extension','.tee');
    end;
  finally
    Free;
  end;

  {$ENDIF}
end;

Procedure TMainForm.SetPanelFont(AFont:TTeeFont; EnableJustify:TEnableJustify;
                                                 Justification:TAlignment);
begin { set the Font toolbar buttons with the selected Font properties }
  IPanelFont:=AFont;

  if Assigned(IPanelFont) then
  begin
    with ComboFonts do ItemIndex:=Items.IndexOf(IPanelFont.Name);
    ComboFontSize.Text:=IntToStr(IPanelFont.Size);

    ShapeFontColor.Visible:=True;
    if not ComboFonts.Enabled then EnablePanelFont(True);

    With IPanelFont do
    begin
      FontBold.Down     :=fsBold in Style;
      FontItalic.Down   :=fsItalic in Style;
      FontUnderline.Down:=fsUnderline in Style;
      FontStrike.Down   :=fsStrikeOut in Style;
      ShapeFontColor.Brush.Color:=Color;
      UDFontInter.Position:=InterCharSize;
    end;

    { enable/disable the Text Justify buttons }
    FontLeftAlign.Enabled:=EnableJustify<>ejNo;
    FontCenterAlign.Enabled:=EnableJustify=ejAll;
    FontRightAlign.Enabled:=EnableJustify<>ejNo;

    if EnableJustify<>ejNo then
    begin
      Case Justification of
        taLeftJustify: FontLeftAlign.Down:=True;
        taCenter     : FontCenterAlign.Down:=True;
      else
        FontRightAlign.Down:=True;
      end;
    end;
  end
  else
  if ComboFonts.Enabled then EnablePanelFont(False);
end;

procedure TMainForm.SBOutlineClick(Sender: TObject);
begin { change the selected Font Outline pen }
  if EditChartPen(Self,IPanelFont.OutLine) then
     TeeModified;
end;

procedure TMainForm.EditFontInterChange(Sender: TObject);
begin { change the selected Font inter-char space }
  if Assigned(IPanelFont) then
  begin
    IPanelFont.InterCharSize:=UDFontInter.Position;
    TeeModified;
  end;
end;

procedure TMainForm.ComboFontSizeChange(Sender: TObject);
begin { change the selected Font size }
  if ComboFontSize.ItemIndex<>-1 then
  begin
    with IPanelFont do
      Size:=StrToIntDef(ComboFontSize.Items[ComboFontSize.ItemIndex],Size);
    TeeModified;
  end;
end;

procedure TMainForm.ComboFontsChange(Sender: TObject);
begin { change the selected Font name ie: Arial }
  IPanelFont.Name:=ComboFonts.Items[ComboFonts.ItemIndex];
  TeeModified;
end;

procedure TMainForm.FontBoldClick(Sender: TObject);
var tmp: TFontStyles;
begin  { change the selected Font style }
  tmp:=[];
  if FontBold.Down then tmp:=tmp+[fsBold];
  if FontItalic.Down then tmp:=tmp+[fsItalic];
  if FontUnderline.Down then tmp:=tmp+[fsUnderline];
  if FontStrike.Down then tmp:=tmp+[fsStrikeOut];
  IPanelFont.Style:=tmp;
  TeeModified;
end;

Function TMainForm.DoEditColor(AColor:TColor; Var Changed:Boolean):TColor;
var tmpOld : TColor;
begin { show the color dialog. Return Changed parameter }
  tmpOld:=AColor;
  result:=EditColor(Self,AColor);
  Changed:=result<>tmpOld;
end;

procedure TMainForm.ShapeFontColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Changed : Boolean;
begin { change the selected Font color }
  IPanelFont.Color:=DoEditColor(IPanelFont.Color,Changed);
  if Changed then
  begin
    ShapeFontColor.Brush.Color:=IPanelFont.Color;
    TeeModified;
  end;
end;

procedure TMainForm.Gallery1Click(Sender: TObject);
begin { show / hide the chart gallery }
  ChartGalleryPanel1.Visible:=Toogle(Gallery1);
end;

procedure TMainForm.Statusbar2Click(Sender: TObject);
begin { show / hide the status bar }
  StatusBar1.Visible:=Toogle(StatusBar2);
end;

procedure TMainForm.TimerStatusTimer(Sender: TObject);
{$IFNDEF LINUX}

  Procedure CheckKey(AKey,APanel:Integer; Const AText:String);
  begin
    if GetKeyState(AKey)<>0 then StatusBar1.Panels[APanel].Text:=AText
                            else StatusBar1.Panels[APanel].Text:='';
  end;

{$ENDIF}

begin { refresh the status bar key lock panels }

  {$IFNDEF LINUX}

  CheckKey(VK_CAPITAL,4,TeeMsg_Caps);
  CheckKey(VK_NUMLOCK,5,TeeMsg_NUM);
  CheckKey(VK_SCROLL, 6,TeeMsg_SCR);

  {$ENDIF}
end;

procedure TMainForm.FormResize(Sender: TObject);
begin { readjust the status bar size for key lock panels }
  StatusHint.Width:=Width-280;
end;

procedure TMainForm.Standard1Click(Sender: TObject);
begin  { show / hide the Standard toolbar }
  TeeCommander1.Visible:=Toogle(Standard1);
  ArrangeToolbars;
end;

procedure TMainForm.Font1Click(Sender: TObject);
begin  { show / hide the Font toolbar }
  PanelFont.Visible:=Toogle(Font1);
  ArrangeToolbars;
end;

procedure TMainForm.Page1Click(Sender: TObject);
begin { show / hide the Page toolbar }
  PanelPage.Visible:=Toogle(Page1);
  ArrangeToolbars;
end;

procedure TMainForm.AligntoBottom1Click(Sender: TObject);
begin { align toolbars to top or bottom of form }
  Toogle(TMenuItem(Sender));

  if AlignToTop1.Checked then ControlBar1.Align:=alTop
                         else ControlBar1.Align:=alBottom;
end;

procedure TMainForm.View3D1Click(Sender: TObject);
begin { show the Chart Gallery in 2D / 3D mode }
  ChartGalleryPanel1.View3D:=Toogle(View3D1);
  DBChart1.View3D:=ChartGalleryPanel1.View3D;
  TeeModified;
end;

procedure TMainForm.ComboBoxPartsChange(Sender: TObject);

  Procedure CheckSeries;
  begin { if no series is selected, try to select the first one }
    if (not Assigned(ChartListBox1.SelectedSeries)) and
       (DBChart1.SeriesCount>0) then
         ChartListBox1.SelectedSeries:=DBChart1[0];
  end;

begin { set Inspector properties }
  with Selector.Part do
  Case ComboBoxParts.ItemIndex of
    ComboPart_Chart: begin
                        Part:=cpChartRect;
                        Selector.Wall:=nil;
                      end;
    ComboPart_Legend: Part:=cpLegend;
    ComboPart_Title: Part:=cpTitle;
    ComboPart_Series: begin
         CheckSeries;
         if Assigned(ChartListBox1.SelectedSeries) then
         begin
           Selector.Series:=ChartListBox1.SelectedSeries;
           exit;
         end
         else Part:=cpNone;
       end;
    ComboPart_Marks: begin
         CheckSeries;
         if Assigned(ChartListBox1.SelectedSeries) then
         begin
           Part:=cpSeriesMarks;
           ASeries:=ChartListBox1.SelectedSeries;
         end
         else Part:=cpNone;
       end;
    ComboPart_Axis: begin
                      Part:=cpAxis;
                      AAxis:=DBChart1.LeftAxis;
                    end;
    ComboPart_Wall: begin
                      Selector.Wall:=DBChart1.BackWall;
                      exit;
                    end;
  else
    exit;
  end;

  { tell Selector tool }
  SelectorSelected(Self);
  Selector.Repaint;
end;

procedure TMainForm.Copy1Click(Sender: TObject);
begin { copy the Chart to clipboard as Bitmap, or Chart Data as Text }
  if PageControl1.ActivePage=TabDesign then
     DBChart1.CopyToClipboardBitmap
  else
    { chart data as text }
    with TSeriesDataText.Create(DBChart1) do
    try
      TextDelimiter:=TeeTabDelimiter;
      CopyToClipboard;
    finally
      Free;
    end;
end;

procedure TMainForm.ShowMarksClick(Sender: TObject);
begin { toogle the current Series Marks property }
  With ChartListBox1 do
  if SelectedSeries<>nil then
  begin
    SelectedSeries.Marks.Visible:=ShowMarks.Down;
    TeeModified;
  end;
end;

procedure TMainForm.ColorEachClick(Sender: TObject);
begin { toogle the current Series ColorEachPoint property }
  With ChartListBox1 do
  if Assigned(SelectedSeries) then
  begin
    SelectedSeries.ColorEachPoint:=ColorEach.Down;
    DoColorEachChange;
  end;
end;

Procedure TMainForm.DoColorEachChange;
begin { reset chart grid and series buttons when ColorEach property changes }
  ChartListBox1.Invalidate;

  if (PageControl1.ActivePage=TabData) or PanelGrid.Visible then
     ChartGrid1.Repaint;

  CheckSeriesButtons(Selector.Part.ASeries);
  TeeModified;
end;

procedure TMainForm.Titles1Click(Sender: TObject);
begin { show / hide Chart Titles }
  with DBChart1 do
  begin
    Title.Visible    :=ToogleModified(Titles1);
    SubTitle.Visible :=Title.Visible;
    Foot.Visible     :=Title.Visible;
    SubFoot.Visible  :=Title.Visible;
  end;
  CheckTitleSelector;
end;

procedure TMainForm.Hide1Click(Sender: TObject);
begin { show / hide Chart gallery }
  Gallery1Click(Sender);
end;

procedure TMainForm.SeriesToolBarItemClick(Sender: TObject);
begin { show / hide the Series toolbar }
  ToolbarSeries.Visible:=Toogle(SeriesToolBarItem);
  ArrangeToolbars;
end;

procedure TMainForm.ShowAtLegendClick(Sender: TObject);
begin { Show / hide the current Series at Legend }
  With ChartListBox1 do
  if SelectedSeries<>nil then
  begin
    SelectedSeries.ShowInLegend:=ShowAtLegend.Down;

    { show the Legend if ShowAtLegend is True }
    if ShowAtLegend.Down then DBChart1.Legend.Visible:=True;

    Invalidate;

    CheckLegendSelector;

    TeeModified;
  end;
end;

procedure TMainForm.AnnotationClick(Sender: TObject);
var tmpSt : String;
    tmp   : TAnnotationTool;
    A,B   : Integer;
    tmpIndex : Integer;
begin  { Add a new annotation text to the Chart }
  tmpSt:=TeeMsg_Annotation;
  { ask the user }
  if InputQuery(Annotation.Hint,TeeMsg_Text,tmpSt) then
  begin
    { create the Annotation }
    tmp:=TAnnotationTool.Create(Self);
    tmp.Text:=tmpSt;
    tmp.ParentChart:=DBChart1;

    { move the Selector tool to last }
    With DBChart1 do
    begin
      A:=Tools.IndexOf(Selector);
      B:=Tools.IndexOf(tmp);
      Tools.Exchange(A,B);
      tmpIndex:=Tools[A].ComponentIndex;
      Tools[A].ComponentIndex:=Tools[B].ComponentIndex;
      Tools[B].ComponentIndex:=tmpIndex;
    end;

    { Set the Selector to select the Annotation }
    Selector.Annotation:=tmp;
    TeeModified;
  end;
end;

Procedure TMainForm.DisableDrawLine;
begin { Disable the DrawLine tool and up the tool button }
  if SBDrawLine.Down then SBDrawLine.Down:=False;
  if DrawLineTool.Active then SBDrawLineClick(Self);
end;

procedure TMainForm.SBZoomClick(Sender: TObject);
var tmpSt: String;
begin { Enable / Disable zooming Chart points dragging the mouse }
  DBChart1.Zoom.Allow:=SBZoom.Down;

  if SBZoom.Down then
  begin
    { disable drawing lines }
    DisableDrawLine;

    TeeCommander1.ButtonNormal.Down:=True;

    { change visual settings }
    with DBChart1.Zoom do
    begin
      Pen.Color:=clDkGray;
      Brush.Style:=bsSolid;
    end;

    { disable scroll }
    DBChart1.AllowPanning:=pmNone;

    { set cursor to cross "+" }
    DBChart1.Cursor:=crCross;

    tmpSt:=TeeMsg_ZoomInstructions;
  end
  else
  begin
    DBChart1.Cursor:=crDefault;
    tmpSt:='';
  end;

  Selector.Active:=not SBZoom.Down;
  DBChart1.OriginalCursor:=DBChart1.Cursor;

  { set Status bar text }
  StatusHint.Text:=tmpSt;
end;

procedure TMainForm.SBScrollClick(Sender: TObject);
var tmpSt: String;
begin { Enable / Disable Scrolling Chart points dragging the mouse }
  if SBScroll.Down then
  begin
    { disable drawing lines }
    DisableDrawLine;

    TeeCommander1.ButtonNormal.Down:=True;

    DBChart1.AllowPanning:=pmBoth;
    DBChart1.ScrollMouseButton:=mbLeft;

    { set cursor to "hand" }
    DBChart1.Cursor:=crTeeHand;

    { disable zoom }
    DBChart1.Zoom.Allow:=False;

    { status bar text }
    tmpSt:=TeeMsg_ScrollInstructions;
  end
  else
  begin
    DBChart1.AllowPanning:=pmNone;
    DBChart1.Cursor:=crDefault;
    tmpSt:='';
  end;

  Selector.Active:=not SBScroll.Down;
  DBChart1.OriginalCursor:=DBChart1.Cursor;

  { set Status bar text }
  StatusHint.Text:=tmpSt;
end;

Function TMainForm.FindDrawLineTool:TDrawLineTool;
var t: Integer;
begin { returns nil if there is no DrawLineTool }
  result:=nil;

  With DBChart1.Tools do
  for t:=0 to Count-1 do
    if Items[t] is TDrawLineTool then
    begin
      result:=TDrawLineTool(Items[t]);
      break;
    end;
end;

Function TMainForm.DrawLineTool:TDrawLineTool;
begin { find a DrawLine tool in Chart tools list. If not, create it ! }
  result:=FindDrawLineTool;

  if not Assigned(result) then
  begin
    result:=TDrawLineTool.Create(Self);
    result.ParentChart:=DBChart1;
  end;

  result.OnNewLine:=DrawLineNewLine;
  result.OnDraggedLine:=DrawLineNewLine;
end;

procedure TMainForm.SBDrawLineClick(Sender: TObject);
var tmpSt: String;
begin { Enable / Disable Drawing Lines over the Chart dragging the mouse }
  DrawLineTool.EnableDraw:=SBDrawLine.Down;

  if SBDrawLine.Down then
  begin
    TeeCommander1.ButtonNormal.Down:=True;

    { disable zoom and scroll }
    DBChart1.Zoom.Allow:=False;
    DBChart1.AllowPanning:=pmNone;

    { status bar text }
    tmpSt:=TeeMsg_DrawLineInstructions;
  end
  else
  begin
    tmpSt:='';
  end;

  Selector.Active:=not SBDrawLine.Down;

  { set cursor }
  DBChart1.Cursor:=crDefault;
  DBChart1.OriginalCursor:=DBChart1.Cursor;

  { status bar text }
  StatusHint.Text:=tmpSt;
end;

procedure TMainForm.UseSeriesColor1Click(Sender: TObject);
begin  { toogle Legend using Series colors as Font Colors }
  DBChart1.Legend.FontSeriesColor:=ToogleModified(UseSeriesColor1);
end;

procedure TMainForm.Inverted1Click(Sender: TObject);
begin { toogle Legend Inverted }
  DBChart1.Legend.Inverted:=ToogleModified(Inverted1);
end;

Procedure TMainForm.DrawLineNewLine(Sender: TObject);
begin { A manual drawn line has been added, or dragged }
  TeeModified;
end;

procedure TMainForm.TeeModified(YesNo: Boolean);
begin { The Chart has been modified (or not) }
  FModified:=YesNo;

  if FModified then
  begin
    StatusBar1.Panels[3].Text:=TeeMsg_Modified;
    Inspector.Repaint;
    RepaintPreview;
  end
  else
    StatusBar1.Panels[3].Text:='';
end;

Procedure CreateColorBitmap(Item: TMenuItem; AColor:TColor);
begin { create a bitmap for the menu item, filled with AColor }
  with Item.Bitmap do
  begin
    Width:=15;
    Height:=15;
    Canvas.Brush.Color:=AColor;
    Canvas.Rectangle(0,0,14,14);
  end;

  Item.Tag:=AColor;
  Item.HelpContext:=2; { set as Color item }
end;

procedure TMainForm.PopupLegendPopup(Sender: TObject);
begin { set Legend Popup menu items }
  With DBChart1.Legend do
  begin
    Visible1.Checked:=Visible;
    CheckBoxes1.Checked:=CheckBoxes;
    Inverted1.Checked:=Inverted;
    UseSeriesColor1.Checked:=FontSeriesColor;

    {$IFNDEF CLR}
    DividingLines1.Tag:=Integer(DividingLines);
    {$ENDIF}

    LegendTransparent.Checked:=Transparent;
    Case Alignment of
      laLeft  : Left1.Checked:=True;
      laRight : Right1.Checked:=True;
      laTop   : Top1.Checked:=True;
      laBottom: Bottom1.Checked:=True;
    end;
    if Symbol.Position=spLeft then
       Left2.Checked:=True
    else
       Right2.Checked:=True;
    Continous1.Checked:=Symbol.Continuous;
    Case LegendStyle of
      lsAuto,
      lsValues    : Values1.Checked:=True;
      lsSeries    : SeriesNames1.Checked:=True;
      lsLastValues: Lastvalues1.Checked:=True;
    end;
    CreateColorBitmap(Color4,Color);

    {$IFNDEF CLR}
    LegendBorder.Tag:=Integer(Pen);
    LegendGradient.Tag:=Integer(Gradient);
    LegendFont.Tag:=Integer(Font);
    {$ENDIF}
  end;
end;

procedure TMainForm.Checkboxes1Click(Sender: TObject);
begin { toogle Legend showing check-boxes }
  DBChart1.Legend.CheckBoxes:=ToogleModified(Checkboxes1);
end;

procedure TMainForm.Dividinglines1Click(Sender: TObject);
begin { toogle Legend dividing lines }
  if EditChartPen(Self,DBChart1.Legend.DividingLines) then
     TeeModified;
end;

procedure TMainForm.LegendGradientClick(Sender: TObject);
begin { edit the Legend gradient }
  With DBChart1.Legend do
  if EditTeeGradient(Self,Gradient) then
  begin
    if Gradient.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.LegendTransparentClick(Sender: TObject);
begin { show / hide Legend transparent }
  DBChart1.Legend.Transparent:=ToogleModified(LegendTransparent);
end;

procedure TMainForm.Bottom1Click(Sender: TObject);
begin { change the Legend position }
  with DBChart1.Legend do
  begin
    if Sender=Left1 then  Alignment:=laLeft else
    if Sender=Right1 then Alignment:=laRight else
    if Sender=Top1 then   Alignment:=laTop else
                          Alignment:=laBottom;
    { disable custom positioning }
    CustomPosition:=False;
  end;
  TeeModified;
end;

procedure TMainForm.Right2Click(Sender: TObject);
begin { change the Legend Symbols position }
  with DBChart1.Legend.Symbol do
  if Sender=Left2 then Position:=spLeft else
                       Position:=spRight;
  TeeModified;
end;

procedure TMainForm.Continous1Click(Sender: TObject);
begin { toogle Legend Symbol Continous }
  DBChart1.Legend.Symbol.Continuous:=ToogleModified(Continous1);
end;

procedure TMainForm.Lastvalues1Click(Sender: TObject);
begin { change the Legend style }
  with DBChart1.Legend do
  if Sender=Seriesnames1 then LegendStyle:=lsSeries else
  if Sender=Values1 then LegendStyle:=lsValues else
                         LegendStyle:=lsLastValues;
  TeeModified;
end;

Procedure TMainForm.CheckLegendSelector;
begin { disable Legend selection if Legend is not visible }
  if not DBChart1.Legend.Visible then
     if Selector.Part.Part=cpLegend then Selector.ClearSelection;
end;

procedure TMainForm.PopupMenuTitlePopup(Sender: TObject);
begin { set Title popup menu items when right-clicking a title/foot }
  With Selector.SelectedTitle do
  begin
    TitleVisible.Checked:=Visible;
    TitleTransparent.Checked:=Transparent;
    CustomPosition1.Checked:=CustomPosition;
    TitleShadow.Checked:=ShadowSize>0;
    TitleAutoSize.Checked:=AdjustFrame;
    Case Alignment of
      taLeftJustify : TitleLeft.Checked:=True;
      taCenter      : TitleCenter.Checked:=True;
      taRightJustify: TitleRight.Checked:=True;
    end;
    CreateColorBitmap(Color1,Color);

    {$IFNDEF CLR}
    TitleBorder.Tag:=Integer(Pen);
    TitleGradient.Tag:=Integer(Gradient);
    TitleFont.Tag:=Integer(Font);
    {$ENDIF}
  end;
end;

procedure TMainForm.LegendBorderClick(Sender: TObject);
begin { edit the Legend border pen }
  with DBChart1.Legend do
  if EditChartPen(Self,Pen) then
  begin
    if Pen.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.TitleBorderClick(Sender: TObject);
begin { edit the selected Title border pen }
  With Selector.SelectedTitle do
  if EditChartPen(Self,Pen) then
  begin
    if Pen.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.TitleVisibleClick(Sender: TObject);
begin { show / hide the selected Chart Title/Foot }
  Selector.SelectedTitle.Visible:=Toogle(TitleVisible);
  CheckTitleSelector;
  TeeModified;
end;

procedure TMainForm.TitleGradientClick(Sender: TObject);
begin { edit the selected Title Gradient }
  With Selector.SelectedTitle do
  if EditTeeGradient(Self,Gradient) then
  begin
    if Gradient.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.TitleTransparentClick(Sender: TObject);
begin { set selected Title Transparent }
  Selector.SelectedTitle.Transparent:=ToogleModified(TitleTransparent);
end;

procedure TMainForm.TitleShadowClick(Sender: TObject);
begin { show / hide selected Title shadow }
  Toogle(TitleShadow);
  with Selector.SelectedTitle do
  if TitleShadow.Checked then ShadowSize:=3
                         else ShadowSize:=0;
  TeeModified;
end;

procedure TMainForm.TitleAutosizeClick(Sender: TObject);
begin { toogle auto-sizing the selected Title }
  with Selector.SelectedTitle do
  begin
    AdjustFrame:=Toogle(TitleAutoSize);
    if not AdjustFrame then Transparent:=False;
  end;
  TeeModified;
end;

Procedure TMainForm.CheckTitleSelector;
var tmp: TChartTitle;
begin { remove selection of Chart Title/Foot if not visible }
  tmp:=Selector.SelectedTitle;
  if Assigned(tmp) and (not tmp.Visible) then
     Selector.ClearSelection;
end;

procedure TMainForm.Color1Click(Sender: TObject);
var Changed : Boolean;
begin { edit selected Title color }
  with Selector.SelectedTitle do
  begin
    Color:=DoEditColor(Color,Changed);
    if Changed then
    begin
      Transparent:=False;
      CreateColorBitmap(Color1,Color);
      TeeModified;
    end;
  end;
end;

procedure TMainForm.TitleRightClick(Sender: TObject);
begin { change the Title text alignment }
  with Selector.SelectedTitle do
  if Sender=TitleLeft then Alignment:=taLeftJustify else
  if Sender=TitleRight then Alignment:=taRightJustify else
                            Alignment:=taCenter;
  TeeModified;
end;

procedure TMainForm.Text1Click(Sender: TObject);
var tmpForm : TFormTeeTitle;
begin { edit the selected Title text }
  tmpForm:=TFormTeeTitle.CreateTitle(nil,DBChart1,Selector.SelectedTitle);
  with tmpForm do
  try
    Position:=poScreenCenter;
    BorderStyle:=TeeBorderStyle;
    BorderIcons:=[biSystemMenu];
    Caption:=TeeMsg_TitleEditor;
    Panel1.Align:=alBottom;
    CBTitles.Visible:=False;
    With TButton.Create(tmpForm) do
    begin
      Parent:=Panel1;
      Caption:=TeeMsg_Close;
      Left:=tmpForm.Width-100;
      Top:=4;
      ModalResult:=mrOk;
      Default:=True;
    end;

    { Translate }
    TeeTranslateControl(tmpForm);

    { Show }
    if ShowModal=mrOk then
       TeeModified;
  finally
    Free;
  end;
end;

procedure TMainForm.DeleteDataSetClick(Sender: TObject);
var tmp     : TChartSeries;
    tmpData : TComponent;
    t       : Integer;
begin
  tmp:=TFormTeeSeries(TButton(Sender).Owner).TheSeries;
  if Assigned(tmp) and Assigned(tmp.DataSource) then
     if TeeYesNo(TeeMsg_SureToDeleteDataSet) then
     begin
       TeeModified;
       tmpData:=tmp.DataSource;
       tmp.DataSource:=nil;

       TFormTeeSeries(TButton(Sender).Owner).PageSeriesChange(Sender);
       
       for t:=0 to tmp.ParentChart.SeriesCount-1 do
       if tmp.ParentChart[t].DataSource=tmpData then
          exit;
       tmpData.Free;

     end;
end;

procedure TMainForm.EditDataSetClick(Sender: TObject);
{$IFNDEF CLX}
{$IFNDEF NOUSE_BDE}
var tmp     : TChartSeries;
    tmpData : TComponent;
{$ENDIF}
{$ENDIF}
begin { show DataSet dialog to edit current dataset }
  {$IFNDEF CLX}
  {$IFNDEF NOUSE_BDE}
  tmp:=TFormTeeSeries(TButton(Sender).Owner).TheSeries;

  if Assigned(tmp) then
  With TNewDataSet.Create(nil) do
  try
    with TBaseSourceEditor(TFormTeeSeries(TButton(Sender).Owner).DataSourceStyle).CBSources do
    begin
      if ItemIndex=-1 then tmpData:=tmp.DataSource
                      else tmpData:=TComponent(Items.Objects[ItemIndex]);
    end;

    if Assigned(tmpData) then
    begin
      SetOptions(tmpData);
      ButtonNextClick(nil);

      if ShowModal=mrOk then
      begin
        with TBaseSourceEditor(TFormTeeSeries(TButton(Sender).Owner).DataSourceStyle).CBSources do
        begin
          if ItemIndex=-1 then tmp.DataSource:=CurrentSource
                          else Items.Objects[ItemIndex]:=CurrentSource;
        end;

        Self.TeeModified;
      end;
    end;
  finally
    Free;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TMainForm.NewDataSetClick(Sender: TObject);
{$IFNDEF CLX}
{$IFNDEF NOUSE_BDE}
var tmp : TDataSet;
{$ENDIF}
{$ENDIF}
begin { create a new DataSet dialog }
  {$IFNDEF CLX}
  {$IFNDEF NOUSE_BDE}
  With TNewDataSet.Create(nil) do
  try
    if ShowModal=mrOk then
    begin
      Self.TeeModified;
      tmp:=CreateDataSet(Self);

      with TBaseDBChartEditor(TFormTeeSeries(TButton(Sender).Owner).DataSourceStyle) do
      begin
        FormShow(Self);
        with CBSources do
        begin
          ItemIndex:=Items.IndexOfObject(tmp);
          OnChange(Self);
        end;
      end;

      // Add new dataset to Data Sources list
      LBSources.Items.AddObject(tmp.Name,tmp);
      EnableSourceButtons;
    end;
  finally
    Free;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TMainForm.PopupMenuPanelPopup(Sender: TObject);
begin { setup popup menu for Chart Panel options }
  With DBChart1 do
  begin
    {$IFNDEF CLR}
    PanelBorder.Tag:=Integer(Border);
    PanelGradient.Tag:=Integer(Gradient);
    PanelBackImage.Tag:=Integer(BackImage);
    Frame1.Tag:=Integer(Frame);
    {$ENDIF}

    CreateColorBitmap(PanelColor,Color);
    PanelView3D.Checked:=View3D;
    { color mode }
    if Monochrome then Monochrome1.Checked:=True else
    if DrawGrayScale=-1 then Colors1.Checked:=True
    else
    begin
      if DrawGrayInverted then InvertedGrayScale1.Checked:=True else
      if DrawGrayScale=0 then GrayScale2.Checked:=True else
      if DrawGrayScale=1 then GrayScaleVisual1.Checked:=True;
    end;

    { bevel }
    Case BevelOuter of
      bvLowered: Lower1.Checked:=True;
      bvRaised: Raise1.Checked:=True;
    else
      None1.Checked:=True;
    end;
  end;
end;

procedure TMainForm.Edit2Click(Sender: TObject);
begin { show the Chart Panel editor dialog... }
  EditChartPage(Self,DBChart1,teeEditPanelPage);
  TeeModified;
end;

procedure TMainForm.PanelColorClick(Sender: TObject);
var Changed : Boolean;
begin { edit Chart panel color }
  DBChart1.Color:=DoEditColor(DBChart1.Color,Changed);
  if Changed then
  begin
    DBChart1.Gradient.Visible:=False;
    CreateColorBitmap(PanelColor,DBChart1.Color);
    TeeModified;
  end;
end;

procedure TMainForm.PanelBackimageClick(Sender: TObject);
begin { show Chart panel background image dialog }
  Edit2Click(Sender);
end;

procedure TMainForm.PanelGradientClick(Sender: TObject);
begin { edit Chart panel gradient... }
  if EditTeeGradient(Self,DBChart1.Gradient) then
     TeeModified;
end;

procedure TMainForm.PanelBorderClick(Sender: TObject);
begin { edit Chart panel border pen... }
  if EditChartPen(Self,DBChart1.Border) then
     TeeModified;
end;

procedure TMainForm.TeeChartHelp1Click(Sender: TObject);
begin { show main Help }
  {$IFNDEF CLX}
  Application.HelpCommand(HELP_INDEX,0);
  {$ENDIF}
end;

procedure TMainForm.OnlineSupport1Click(Sender: TObject);
begin { go to Steema TeeChartOffice OnlineSupport web home page }
  TeeGotoURL(Handle,TeeSteemaSupportURL);
end;

procedure TMainForm.Saveas1Click(Sender: TObject);
begin { show the Save As... dialog }
  if CurrentFile='' then SaveDialog1.FileName:=TeeMsg_Chart1
                    else SaveDialog1.FileName:=CurrentFile;
  if SaveDialog1.Execute and (SaveDialog1.FileName<>'') then
  begin
    CurrentFile:=SaveDialog1.FileName;
    if CurrentFile<>'' then DoSaveChart;
  end;
end;

procedure TMainForm.Sendto1Click(Sender: TObject);
begin { show the e-mail Send dialog }
  With TTeeExportForm.Create(nil) do
  try
    { set Chart }
    ExportPanel:=Self.DBChart1;

    { execute the OnShow event to setup controls }
    FormShow(Self);

    { set JPEG format }
    with LBFormat do
    begin
      ItemIndex:=Items.IndexOf(TeeMsg_AsJPEG);
      if ItemIndex=-1 then ItemIndex:=1; { as Bitmap }
    end;

    Self.Selector.DrawHandles:=False;
    try
      { emulate click on Send button }
      BSendClick(Self);
    finally
      Self.Selector.DrawHandles:=True;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.Panel2Resize(Sender: TObject);
begin { resize the Inspector combobox }
  ComboBoxParts.Width:=Panel2.Width-6;
end;

procedure TMainForm.EditAnnotationClick(Sender: TObject);
begin { edit selected Annotation }
  with TAnnotationToolEdit.Create(nil) do
  try
    BorderStyle:=TeeBorderStyle;
    Align:=alNone;
    Position:=poScreenCenter;
    Tag:=ObjectToTag(Selector.Annotation);
    ShowModal;
    TeeModified;
  finally;
    Free;
  end;
end;

procedure TMainForm.Delete1Click(Sender: TObject);
begin { remove selected Annotation }
  Selector.Annotation.Free;
  Selector.ClearSelection;
  Selector.Repaint;
  TeeModified;
end;

procedure TMainForm.AnnBorderClick(Sender: TObject);
begin { edit selected Annotation border }
  with Selector.Annotation.Shape do
  if EditChartPen(Self,Pen) then
  begin
    if Pen.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.AnnColorClick(Sender: TObject);
var Changed : Boolean;
begin { edit selected Annotation color }
  With Selector.Annotation.Shape do
  begin
    Color:=DoEditColor(Color,Changed);
    if Changed then
    begin
      Gradient.Visible:=False;
      Transparent:=False;
      CreateColorBitmap(AnnColor,Color);
      TeeModified;
    end;
  end;
end;

procedure TMainForm.AnnGradientClick(Sender: TObject);
begin { edit selected Annotation Gradient }
  With Selector.Annotation.Shape do
  if EditTeeGradient(Self,Gradient) then
  begin
    if Gradient.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.Transparent1Click(Sender: TObject);
begin { toogle selected Annotation transparency }
  Selector.Annotation.Shape.Transparent:=ToogleModified(Transparent1);
end;

procedure TMainForm.PopupMenuAnnPopup(Sender: TObject);
begin { set Annotation popup menu items }
  With Selector.Annotation do
  begin
    Transparent1.Checked:=Shape.Transparent;
    Custom1.Checked:=Shape.CustomPosition;
    Case Position of
      ppLeftTop    : LeftTop1.Checked:=True;
      ppLeftBottom : LeftBottom1.Checked:=True;
      ppRightTop   : RightTop1.Checked:=True;
      ppRightBottom: RightBottom1.Checked:=True;
    end;

    CreateColorBitmap(AnnColor,Shape.Color);

    {$IFNDEF CLR}
    AnnBorder.Tag:=Integer(Shape.Frame);
    AnnGradient.Tag:=Integer(Shape.Gradient);
    AnnoFont.Tag:=Integer(Shape.Font);
    {$ENDIF}
  end;
end;

procedure TMainForm.Custom1Click(Sender: TObject);
begin  { set selected Annotation position to custom }
  Selector.Annotation.Shape.CustomPosition:=ToogleModified(Custom1);
end;

procedure TMainForm.RightBottom1Click(Sender: TObject);
begin { set selected Annotation position }
  with Selector.Annotation do
  if Sender=LeftTop1 then Position:=ppLeftTop else
  if Sender=RightTop1 then Position:=ppRightTop else
  if Sender=LeftBottom1 then Position:=ppLeftBottom else
  if Sender=RightBottom1 then Position:=ppRightBottom;

  TeeModified;
end;

procedure TMainForm.Edit4Click(Sender: TObject);
begin { edit Series Marks }
  EditSeriesMarks(Self,Selector.Series);
  TeeModified;
end;

procedure TMainForm.Arrow1Click(Sender: TObject);
begin { edit Series Marks Arrow pen }
  if EditChartPen(Self,Selector.Series.Marks.Arrow) then
     TeeModified;
end;

procedure TMainForm.MarksBorderClick(Sender: TObject);
begin { edit Series Marks border }
  if EditChartPen(Self,Selector.Series.Marks.Frame) then
     TeeModified;
end;

procedure TMainForm.Color3Click(Sender: TObject);
var Changed : Boolean;
begin { edit Series Marks Back Color }
  With Selector.Series.Marks do
  begin
    BackColor:=DoEditColor(BackColor,Changed);
    if Changed then
    begin
      Transparent:=False;
      CreateColorBitmap(Color3,BackColor);
      TeeModified;
    end;
  end;
end;

procedure TMainForm.MarksGradientClick(Sender: TObject);
begin { edit Series Marks Gradient }
  with Selector.Series.Marks do
  if EditTeeGradient(Self,Gradient) then
  begin
    if Gradient.Visible then Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.Transparent2Click(Sender: TObject);
begin { toogle Series Marks transparency }
  Selector.Series.Marks.Transparent:=ToogleModified(Transparent2);
end;

procedure TMainForm.ShowHints1Click(Sender: TObject);
begin { toogle showing text hints at Chart Gallery }
  ChartGalleryPanel1.ShowHint:=Toogle(ShowHints1);
end;

procedure TMainForm.Options1Click(Sender: TObject);
var WasEnglish : Boolean;
begin { show the Options dialog }
  WasEnglish:=not Assigned(TeeLanguage);

  if TeeAskLanguage then
  begin
    { Set new language }
    TeeSetLanguage(True);

    { Translate current main form }
    if WasEnglish and Assigned(TeeLanguage) then
    begin
      TranslateMainForm;

      { Repaint Inspector }
      Inspector.Header.Update;

      { Change "Save as..." dialog title }
      SaveDialog1.Title:=TeeMsg_SaveAs;

      { Re-fill inspector grid with translated properties }
      SetInspectorProperties;
    end
    else ShowMessage(TeeMsg_ShouldClose);
  end;
end;

procedure TMainForm.Edit5Click(Sender: TObject);
begin { edit selected Axis }
  EditChartAxis(Self,Selector.Part.AAxis);
  TeeModified;
end;

procedure TMainForm.Labels1Click(Sender: TObject);
begin { show / hide selected Axis labels }
  Selector.Part.AAxis.Labels:=ToogleModified(Labels1);
end;

procedure TMainForm.Inverted2Click(Sender: TObject);
begin { toogle selected Axis Inverted }
  Selector.Part.AAxis.Inverted:=ToogleModified(Inverted2);
end;

procedure TMainForm.Ticks1Click(Sender: TObject);
begin { edit selected Axis Ticks pen }
  if EditChartPen(Self,Selector.Part.AAxis.Ticks) then
     TeeModified;
end;

procedure TMainForm.Grid1Click(Sender: TObject);
begin { edit selected Axis Grid lines pen }
  if EditChartPen(Self,Selector.Part.AAxis.Grid) then
     TeeModified;
end;

procedure TMainForm.Axisline1Click(Sender: TObject);
begin  { edit selected Axis line pen }
  if EditChartPen(Self,Selector.Part.AAxis.Axis) then
     TeeModified;
end;

procedure TMainForm.PopupMenuAxisPopup(Sender: TObject);
begin { set popup menu selected Axis items }
  with Selector.Part.AAxis do
  begin
    Inverted2.Checked:=Inverted;
    Labels1.Checked:=Labels;

    {$IFNDEF CLR}
    Ticks1.Tag:=Integer(Ticks);
    Grid1.Tag:=Integer(Grid);
    AxisLine1.Tag:=Integer(Axis);
    AxisMinorGrid.Tag:=Integer(MinorGrid);
    AxisFont.Tag:=Integer(LabelsFont);
    {$ENDIF}

    AxisVisible.Checked:=Visible;
  end;
end;

procedure TMainForm.CheckBoxGridLabelsClick(Sender: TObject);
begin { show / hide Text labels column at Data Grid }
  ChartGrid1.ShowLabels:=CheckBoxGridLabels.Checked;
  ChartGrid1.Repaint;
end;

procedure TMainForm.CheckBoxXClick(Sender: TObject);
begin { show / hide Text labels column at Data Grid }
  if CheckBoxX.Checked then ChartGrid1.ShowXValues:=cgsYes
                       else ChartGrid1.ShowXValues:=cgsNo;
  ChartGrid1.Repaint;
end;

procedure TMainForm.AutoSize1Click(Sender: TObject);
begin { set Chart size to Automatic (aligned to container) }
  Toogle(AutoSize1);
  if AutoSize1.Checked then DBChart1.Align:=alClient
                       else DBChart1.Align:=alNone;
  TeeModified;
end;

procedure TMainForm.Hide2Click(Sender: TObject);
begin { hide general TeeCommander toolbar }
  Standard1Click(Self);
end;

procedure TMainForm.Tools2Click(Sender: TObject);
begin { show / hide the Chart Tools toolbar }
  PanelTools.Visible:=Toogle(Tools2);
  ArrangeToolbars;
end;

procedure TMainForm.PopupMenuGalleryPopup(Sender: TObject);
begin { set Gallery popup menu items }
  ShowHints1.Checked:=ChartGalleryPanel1.ShowHint;
  View3D1.Checked:=ChartGalleryPanel1.View3D;
end;

procedure TMainForm.Updateversion1Click(Sender: TObject);
begin { show a dialog to update the current version }
  {$IFNDEF LINUX}
  if CheckSave then
     UpdateVersion(TeeChartOfficeVersion,TChartOfficeVersionURL,TeeMsg_URLMagic);
  {$ENDIF}
end;

{$IFNDEF CLX}

// Open *.tee files mouse-dropped from Windows Explorer
procedure TMainForm.WMDROPFILES(var Message: TWMDROPFILES);
var FileName : {$IFDEF CLR}StringBuilder{$ELSE}Array[0..255] of Char{$ENDIF};
begin 

  if DragQueryFile(Message.Drop,$FFFFFFFF,nil,0)>0 then
  begin
    {$IFDEF CLR}
    FileName:=StringBuilder.Create;
    {$ENDIF}

    DragQueryFile(Message.Drop,0,{$IFNDEF CLR}@{$ENDIF}FileName,SizeOf(FileName));

    if CheckSave then
       LoadChart(FileName{$IFDEF CLR}.ToString{$ENDIF}); { load dropped file }
  end;
end;

{$ENDIF}

procedure TMainForm.Color4Click(Sender: TObject);
var Changed : Boolean;
begin { change Chart Legend background Color }
  with DBChart1.Legend do
  begin
    Color:=DoEditColor(Color,Changed);
    if Changed then
    begin
      Transparent:=False;
      CreateColorBitmap(Color4,Color);
      TeeModified;
    end;
  end;
end;

procedure TMainForm.Rightside1Click(Sender: TObject);
begin { align the Chart gallery to Right or Left side }
  Toogle(RightSide1);

  if RightSide1.Checked then ChartGalleryPanel1.Align:=alRight
                        else ChartGalleryPanel1.Align:=alLeft;
end;

procedure TMainForm.PopupMenuSeriesPopup(Sender: TObject);
begin { set up Series popup menu }
  { prepare items }
  with Selector.Series do
  begin
    ShowAtLegend1.Checked:=ShowInLegend;
    ShowMarks1.Checked:=Marks.Visible;
    ColorEach1.Checked:=ColorEachPoint;
    Visible2.Checked:=Active;
    CreateColorBitmap(Color5,SeriesColor);
  end;
end;

Procedure TMainForm.MergeSeriesMenu;

  Procedure MergeMenu(AMenu:TPopupMenu);

    Function CreateItem(AItem:TMenuItem):TMenuItem;
    begin
      { create menu item }
      result:=TMenuItem.Create(AMenu);
      with AItem do
      begin
        result.Caption:=Caption;
        result.Tag:=Tag;
        result.Checked:=Checked;
        result.RadioItem:=RadioItem;
        result.OnClick:=OnClick;
        result.HelpContext:=HelpContext;
      end;
    end;

  var t,
      tt: Integer;
      tmp : TMenuItem;
  begin
    { call OnPopup to prepare items }
    AMenu.OnPopup(Self);
    { copy items }
    for t:=0 to AMenu.Items.Count-1 do
    begin
      { add item }
      tmp:=CreateItem(AMenu.Items[t]);

      { add sub-items }
      for tt:=0 to AMenu.Items[t].Count-1 do
          tmp.Add(CreateItem(AMenu.Items[t].Items[tt]));

      { add to parent menu }
      PopupMenuSeries.Items.Add(tmp);
    end;
  end;

var tmp : TMenuItem;
begin { merge Series popup menu with selected Series type popup menu }
  { delete previously added items }
  With PopupMenuSeries do
  begin
    tmp:=Items[Items.Count-1];
    While tmp<>SeriesPopupSep do
    begin
      Items.Delete(Items.Count-1);
      tmp.Free;
      tmp:=Items[Items.Count-1];
    end;
  end;

  { add / merge context items }
  if Selector.Series is TLineSeries then
     MergeMenu(PopupLine)
  else
  if Selector.Series is TCustomBarSeries then
     MergeMenu(PopupBar)
  else
  if Selector.Series is TPieSeries then
     MergeMenu(PopupPie)
  else
  if Selector.Series is TFastLineSeries then
     MergeMenu(PopupFastLine)
  else
  if Selector.Series is TPointSeries then
     MergeMenu(PopupPoint);
end;

procedure TMainForm.PopupMenuMarksPopup(Sender: TObject);
begin { set up Series Marks popup menu }
  With Selector.Part.ASeries.Marks do
  begin
    Transparent2.Checked:=Transparent;
    Visible3.Checked:=Visible;
    CreateColorBitmap(Color3,BackColor);

    {$IFNDEF CLR}
    Arrow1.Tag:=Integer(Arrow);
    MarksBorder.Tag:=Integer(Pen);
    MarksGradient.Tag:=Integer(Gradient);
    MarksFont.Tag:=Integer(Font);
    {$ENDIF}

    MarksStyle.Items[Ord(Style)].Checked:=True;
  end;
end;

procedure TMainForm.Visible2Click(Sender: TObject);
begin { show / hide the selected Series }
  With ChartListBox1 do
  if Assigned(SelectedSeries) then
     SelectedSeries.Active:=ToogleModified(Visible2);
end;

procedure TMainForm.Coloreach1Click(Sender: TObject);
begin { toogle "color each point" of the selected Series }
  Selector.Part.ASeries.ColorEachPoint:=Toogle(ColorEach1);
  DoColorEachChange;
end;

procedure TMainForm.ShowatLegend1Click(Sender: TObject);
begin { show / hide selected Series at legend }
  Selector.Part.ASeries.ShowInLegend:=Toogle(ShowAtLegend1);
  CheckSeriesButtons(Selector.Part.ASeries);
  TeeModified;
end;

procedure TMainForm.ShowMarks1Click(Sender: TObject);
begin { show / hide selected Series Marks }
  Selector.Part.ASeries.Marks.Visible:=Toogle(ShowMarks1);
  CheckSeriesButtons(Selector.Part.ASeries);
  TeeModified;
end;

procedure TMainForm.Color5Click(Sender: TObject);
var Changed : Boolean;
begin { change the selected Series color }
  with Selector.Part.ASeries do
  begin
    SeriesColor:=DoEditColor(SeriesColor,Changed);
    if Changed then
    begin
      CreateColorBitmap(Color5,SeriesColor);
      { disable "color each point" if true }
      if ColorEachPoint then
      begin
        ColorEachPoint:=False;
        SetInspectorProperties; { repaint inspector }
      end;
      TeeModified;
    end;
  end;
end;

Procedure TMainForm.OnCreateEditSeries(Sender:TFormTeeSeries; AChart:TCustomChart);
begin { set New,Edit,Delete buttons OnClick events }
  with Sender do
  begin
    NewDataButton.OnClick:=NewDataSetClick;
    EditDataButton.OnClick:=EditDataSetClick;
    DeleteDataButton.OnClick:=DeleteDataSetClick;
  end;
end;

procedure TMainForm.Datasource1Click(Sender: TObject);
begin { show selected Series DataSource dialog }
  EditSeriesDataSource(Self,Selector.Series);

  { force grid to recalculate }
  ChartGrid1.RecalcDimensions;
  { mark modified }
  TeeModified;
end;

procedure TMainForm.LegendFontClick(Sender: TObject);
begin { edit Legend font }
  if EditTeeFont(Self,DBChart1.Legend.Font) then
     TeeModified;
end;

procedure TMainForm.SBHintsClick(Sender: TObject);
begin { enable / disable mouse tips when passing over a Series point }
  MarkTipsTool.Active:=SBHints.Down;
  if SBHints.Down then DisableDrawLine;
end;

function TMainForm.MarkTipsTool: TMarksTipTool;
var t: Integer;
begin { find a Mark Tips tool in Chart tools list. If not found, create it ! }
  result:=nil;
  With DBChart1.Tools do
  for t:=0 to Count-1 do
    if Items[t] is TMarksTipTool then
    begin
      result:=TMarksTipTool(Items[t]);
      break;
    end;

  if not Assigned(result) then
  begin { create Marks Tip tool }
    result:=TMarksTipTool.Create(Self);
    result.ParentChart:=DBChart1;
    result.Style:=smsValue;
  end;

  { set tips to show on mouse move, instead of on mouse clicks }
  result.MouseAction:=mtmMove;

  { set a delay of 100 millisecs }
  result.MouseDelay:=100;
end;

procedure TMainForm.ChartEditor1Close(Sender: TObject);
begin { Editor closed. Set menu items with Chart properties }
  SetChartMenuItems;
  if FindSelector=nil then CreateSelector;
  { Restore selected handles }
  Selector.DrawHandles:=True;
  TeeModified;
end;

procedure TMainForm.Frame1Click(Sender: TObject);
begin { edit Chart BackWall border frame pen }
  if EditChartPen(Self,DBChart1.Frame) then
     TeeModified;
end;

procedure TMainForm.Shadow1Click(Sender: TObject);
begin { edit Annotation Shadow settings }
  EditAnnotationClick(Sender);
end;

procedure TMainForm.CustomPosition1Click(Sender: TObject);
begin { change custom positioning of selected Chart Title }
  Selector.SelectedTitle.CustomPosition:=ToogleModified(CustomPosition1);
end;

procedure TMainForm.AxisFontClick(Sender: TObject);
begin { edit selected Axis Labels Font }
  if EditTeeFont(Self,Selector.Part.AAxis.LabelsFont) then
     TeeModified;
end;

procedure TMainForm.Visible3Click(Sender: TObject);
begin { show / hide Series Marks }
  Selector.Part.ASeries.Marks.Visible:=Toogle(Visible3);
  ShowMarks.Down:=Visible3.Checked;
  TeeModified;
end;

procedure TMainForm.PopupLineBorderClick(Sender: TObject);
begin { edit selected series (line,bar,horiz.bar,pie) border }
  if EditChartPen(Self,Selector.Series.Pen) then
     TeeModified;
end;

procedure TMainForm.PopupLinePopup(Sender: TObject);
begin { set up Line series popup menu }
  With Selector.Series as TLineSeries do
  begin
    {$IFNDEF CLR}
    PopupLineBorder.Tag:=Integer(LinePen);
    PopupLinePattern.Tag:=Integer(LineBrush);
    PopupLineOutline.Tag:=Integer(OutLine);
    {$ENDIF}

    PopupLineStairs.Checked:=Stairs;
    PopupLineInverted.Checked:=InvertedStairs;
  end;
end;

procedure TMainForm.PopupLineStairsClick(Sender: TObject);
begin { toogle Line series Stairs property }
  (Selector.Series as TLineSeries).Stairs:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PopupLineInvertedClick(Sender: TObject);
begin { toogle selected Line series Inverted Stairs mode }
  (Selector.Series as TLineSeries).InvertedStairs:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.XY1Click(Sender: TObject);
begin { set selected Series Marks style }
  Selector.Series.Marks.Style:=TSeriesMarksStyle((Sender as TMenuItem).MenuIndex);
  TeeModified;
end;

procedure TMainForm.WallBorderClick(Sender: TObject);
begin { edit selected Wall border pen }
  if EditChartPen(Self,Selector.Wall.Pen) then
     TeeModified;
end;

procedure TMainForm.WallColorClick(Sender: TObject);
var Changed : Boolean;
begin { edit selected Wall Color }
  with Selector.Wall do
  begin
    Color:=DoEditColor(Color,Changed);
    if Changed then
    begin
      Transparent:=False;
      Gradient.Visible:=False;
      CreateColorBitmap(WallColor,Color);
      TeeModified;
    end;
  end;
end;

procedure TMainForm.WallGradientClick(Sender: TObject);
begin { edit selected Back Wall gradient }
  if EditTeeGradient(Self,Selector.Wall.Gradient) then
  begin
    if Selector.Wall.Gradient.Visible then
       Selector.Wall.Transparent:=False;
    TeeModified;
  end;
end;

procedure TMainForm.WallTransparentClick(Sender: TObject);
begin { toogle selected Wall Transparent property }
  Selector.Wall.Transparent:=ToogleModified(WallTransparent);
end;

procedure TMainForm.WallVisibleClick(Sender: TObject);
begin { show / hide selected Wall } 
  Selector.Wall.Visible:=ToogleModified(WallVisible);
end;

procedure TMainForm.PopupMenuWallPopup(Sender: TObject);
begin { setup popup menu for selected Chart Wall options }
  With Selector.Wall do
  begin
    WallTransparent.Checked:=Transparent;
    WallVisible.Checked:=Visible;
    WallDark3D.Checked:=Dark3D;
    CreateColorBitmap(WallColor,Color);

    {$IFNDEF CLR}
    WallGradient.Tag:=Integer(Gradient);
    WallBorder.Tag:=Integer(Pen);
    {$ENDIF}

    WallGradient.Visible:=Selector.Wall=DBChart1.BackWall;
  end;
end;

procedure TMainForm.WallDark3DClick(Sender: TObject);
begin { toogle selected Wall Dark 3D property }
  Selector.Wall.Dark3D:=ToogleModified(WallDark3D);
end;

procedure TMainForm.Edit3Click(Sender: TObject);
begin { edit selected Wall }
  EditChartWall(nil,Selector.Wall);
  TeeModified;
end;

procedure TMainForm.PopupLinePatternClick(Sender: TObject);
begin { edit selected Series pattern Brush }
  if EditChartBrush(Self,Selector.Series.Brush) then
     TeeModified;
end;

procedure TMainForm.BarEllipseClick(Sender: TObject);
begin { set selected Bar series style }
  TCustomBarSeries(Selector.Series).BarStyle:=TBarStyle((Sender as TMenuItem).MenuIndex);
  TeeModified;
end;

procedure TMainForm.BarUseOriginClick(Sender: TObject);
begin { toogle selected Bar series Use Origin property }
  TCustomBarSeries(Selector.Series).UseYOrigin:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PopupBarPopup(Sender: TObject);
begin { set selected Bar series properties }
  With Selector.Series as TCustomBarSeries do
  begin
    {$IFNDEF CLR}
    BarBorder.Tag:=Integer(Pen);
    BarPattern.Tag:=Integer(Brush);
    BarGradient.Tag:=Integer(Gradient);
    {$ENDIF}

    BarWidthItem.Tag:=BarWidthPercent;

    BarUseOrigin.Checked:=UseYOrigin;
    BarStyleItem.Items[Ord(BarStyle)].Checked:=True;
    BarSideMargins.Checked:=SideMargins;
  end;
end;

procedure TMainForm.BarGradientClick(Sender: TObject);
begin { edit selected Bar Gradient }
  if EditTeeGradient(Self,TCustomBarSeries(Selector.Series).Gradient,True,True) then
     TeeModified;
end;

Function TMainForm.InputInteger(Const St:String; Const Num:Integer):Integer;
var Old : Integer;
   tmp : String;
begin { ask the user an Integer and return new value. Do Modified if different }
  Old:=Num;
  tmp:=IntToStr(Num);
  if InputQuery(TeeMsg_EnterValue,St,tmp) then
  begin
    result:=StrToInt(tmp);
    if Old<>result then
       TeeModified;
  end
  else
     result:=Num;
end;

procedure TMainForm.BarWidthItemClick(Sender: TObject);
begin { modify selected Bar series Width % }
  with TCustomBarSeries(Selector.Series) do
  begin
    BarWidthPercent:=InputInteger(TeeMsg_BarWidth,BarWidthPercent);
    (Sender as TMenuItem).Tag:=BarWidthPercent;
  end;
end;

procedure TMainForm.AxisMinorGridClick(Sender: TObject);
begin { edit Axis Minor Grid pen... }
  if EditChartPen(Self,Selector.Part.AAxis.MinorGrid) then
     TeeModified;
end;

procedure TMainForm.AxisVisibleClick(Sender: TObject);
begin { show / hide selected Axis }
  Selector.Part.AAxis.Visible:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.BarSideMarginsClick(Sender: TObject);
begin { enable / disable side margins on selected Bar series }
  TCustomBarSeries(Selector.Series).SideMargins:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PopupPiePopup(Sender: TObject);
begin { set selected Pie series properties }
  With Selector.Series as TPieSeries do
  begin
    {$IFNDEF CLR}
    PieBorder.Tag:=Integer(Pen);
    {$ENDIF}

    PiePatterns.Checked:=UsePatterns;
    PieDark3D.Checked:=Dark3D;
    PieCircled.Checked:=Circled;
    PieRotation.Tag:=RotationAngle;
  end;
end;

procedure TMainForm.PieCircledClick(Sender: TObject);
begin { toogle selected Pie series Circled property }
  TPieSeries(Selector.Series).Circled:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PieDark3DClick(Sender: TObject);
begin { toogle selected Pie series Dark 3D property }
  TPieSeries(Selector.Series).Dark3D:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PiePatternsClick(Sender: TObject);
begin { toogle selected Pie series Use Patterns property }
  TPieSeries(Selector.Series).UsePatterns:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PieRotationClick(Sender: TObject);
begin { modify selected Pie series Rotation angle (0..360) }
  with TCircledSeries(Selector.Series) do
  begin
    RotationAngle:=InputInteger(TeeMsg_PieRotation,RotationAngle);
    (Sender as TMenuItem).Tag:=RotationAngle;
  end;
end;

procedure TMainForm.PopupFastLinePopup(Sender: TObject);
begin { set selected Fast-Line series properties }
  With Selector.Series as TFastLineSeries do
  begin
    {$IFNDEF CLR}
    FastLineBorder.Tag:=Integer(Pen);
    {$ENDIF}
  end;
end;

procedure TMainForm.PopupPointPopup(Sender: TObject);
begin  { set selected Point series properties }
  With (Selector.Series as TPointSeries).Pointer do
  begin
    PointDark.Checked:=Dark3D;
    PointDraw3D.Checked:=Draw3D;
    PointHeight.Tag:=VertSize;
    PointWidth.Tag:=HorizSize;
    {$IFNDEF CLR}
    PointBorder.Tag:=Integer(Pen);
    {$ENDIF}
    PointStyleItem.Items[Ord(Style)].Checked:=True;
  end;
end;

procedure TMainForm.PointDarkClick(Sender: TObject);
begin { toogle drawing 3D parts of Point series with darker color }
  TPointSeries(Selector.Series).Pointer.Dark3D:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PointDraw3DClick(Sender: TObject);
begin { toogle drawing selected Point series in 3D }
  TPointSeries(Selector.Series).Pointer.Draw3D:=ToogleModified(Sender as TMenuItem);
end;

procedure TMainForm.PointHeightClick(Sender: TObject);
begin { modify selected Point series Height size }
  with TPointSeries(Selector.Series).Pointer do
  begin
    VertSize:=InputInteger(TeeMsg_PointHeight,VertSize);
    (Sender as TMenuItem).Tag:=VertSize;
  end;
end;

procedure TMainForm.PointWidthClick(Sender: TObject);
begin { modify selected Point series Width size }
  with TPointSeries(Selector.Series).Pointer do
  begin
    HorizSize:=InputInteger(TeeMsg_PointWidth,HorizSize);
    (Sender as TMenuItem).Tag:=HorizSize;
  end;
end;

procedure TMainForm.Smalldot1Click(Sender: TObject);
begin { set selected Point series style }
  TPointSeries(Selector.Series).Pointer.Style:=TSeriesPointerStyle((Sender as TMenuItem).MenuIndex);
  TeeModified;
end;

procedure TMainForm.Textmode1Click(Sender: TObject);
begin { show / hide the Text tab }
  TabText.TabVisible:=Toogle(TextMode1);
end;

const
  TeeSamples='..\Samples\';

function GetSampleFiles(out APath:String):TStringList;
begin
  if DirectoryExists(TeeSamples) then
  begin
    result:=TeeGetFilesFromDir(TeeSamples+'*.tee');
    APath:=TeeSamples;
  end
  else
  begin
    result:=TeeGetFilesFromDir('Samples\*.tee');
    APath:='Samples\';
  end;
end;

procedure TMainForm.PageControl1Change(Sender: TObject);
var tmpOutput : TMemoryStream;
    tmpInput  : TMemoryStream;
    tmp       : TChartPreview;
begin { convert the Chart to text format }
  if PageControl1.ActivePage=TabText then
  begin

    // CLX and Linux do not include TRichEdit,
    // so create it here...
    if not Assigned(MemoText) then
    begin
      MemoText:=TRichEdit.Create(Self);
      with MemoText do
      begin
        Align :=alClient;
        ReadOnly:=True;
        ScrollBars:=ssBoth;
        TabOrder:=0;
        WordWrap:=False;
        Parent:=TabText;
      end;
    end;

    { disable things we dont want to be saved }
    Selector.ParentChart:=nil;
    DBChart1.OnDblClick:=nil;
    DBChart1.OnMouseMove:=nil;
    try
      { save the Chart ! }
      tmpOutput:=TMemoryStream.Create;
      try
        tmpOutput.WriteComponent(DBChart1);
        { convert to text }
        tmpInput:=TMemoryStream.Create;
        try
          tmpOutput.Position:=0;
          ObjectBinaryToText(tmpOutput,tmpInput);
          { show at Memo }
          tmpInput.Position:=0;
          MemoText.Lines.LoadFromStream(tmpInput);

          {$IFNDEF CLX}

          { highlight }
          TeeHighLightRichEdit(MemoText);

          {$ENDIF}
        finally
          tmpInput.Free;
        end;
      finally
        tmpOutput.Free;
      end;
    finally
      { reset internal events and Selector tool }
      Selector.ParentChart:=DBChart1;
      DBChart1.OnDblClick:=DBChart1DblClick;
      DBChart1.OnMouseMove:=DBChart1MouseMove;
    end;
  end
  else
  if PageControl1.ActivePage=TabPrint then
  begin
    if TabPrint.ControlCount=0 then
    begin
      Screen.Cursor:=crHourGlass;
      try
        tmp:=TChartPreview.Create(Self);
        tmp.BClose.Hide;
        tmp.TeePreviewPanel1.Panel:=DBChart1;
        AddFormTo(tmp,TabPrint);
        tmp.Align:=alClient;
      finally
        Screen.Cursor:=crDefault;
      end;
    end
    else
      RepaintPreview;
  end
  else
    RePositionChartGrid;
end;

{ if showing Data, focus the Chart Data Grid }
procedure TMainForm.RepositionChartGrid;
var isTab : Boolean;
begin
  IsTab:=PageControl1.ActivePage=TabData;

  if IsTab then
  begin
    ChartGrid1.Parent:=TabData;
    ChartGrid1.BorderStyle:=bsNone;

    PanelData.Parent:=TabData;
    PanelGrid.Visible:=False;
    Splitter3.Visible:=False;

    ChartGrid1.SetFocus
  end
  else
  if Hide3.Checked then
  begin
    PanelGrid.Visible:=False;
    Splitter3.Visible:=False;
  end
  else
  begin
    ChartGrid1.Parent:=PanelGrid;
    ChartGrid1.BorderStyle:=bsSingle;

    if dataTop.Checked then
       PanelGrid.Align:=alTop
    else
       PanelGrid.Align:=alBottom;

    PanelData.Parent:=PanelGrid;
    PanelGrid.Visible:=True;
    Splitter3.Visible:=True;
    Splitter3.Top:=PanelGrid.Top-1;
  end;
end;

procedure TMainForm.ShowChartTab;
begin { Switch to Chart design tab }
  MainPage.ActivePage:=TabSheet1;
  PageControl1.ActivePage:=TabDesign;
  Menu:=MainMenu1;
end;

procedure TMainForm.SelectedFunctionGallery(Sender: TObject);
begin { Switch to Chart tab when adding TeeFunctions from gallery tab }
  ShowChartTab;
end;

procedure TMainForm.RepaintPreview;
begin { Refresh Print Preview panel contents }
  if PageControl1.ActivePage=TabPrint then
     if TabPrint.ControlCount>0 then
        TChartPreview(TabPrint.Controls[0]).TeePreviewPanel1.Invalidate;
end;

procedure TMainForm.PanelView3DClick(Sender: TObject);
begin { toogle Chart 3D }
  DBChart1.View3D:=ToogleModified(PanelView3D);
  ChartGalleryPanel1.View3D:=DBChart1.View3D;
end;

procedure TMainForm.StatusBar1DrawPanel(StatusBar: TStatusBar;
  Panel: TStatusPanel; const Rect: TRect);
var tmpColor : TColor;
begin { draw selected point color at status bar }
  if Assigned(Selector) and
     (Selector.Part.Part=cpSeries) and
     (Selector.Part.PointIndex<>-1) and
     (Selector.Series.Count>Selector.Part.PointIndex) then
       tmpColor:=Selector.Series.ValueColor[Selector.Part.PointIndex]
  else
       tmpColor:=StatusBar.Color;

  with StatusBar.Canvas do
  begin
    Brush.Color:=tmpColor;
    FillRect(Rect);
  end;
end;

procedure TMainForm.Colors1Click(Sender: TObject);
begin { full color mode }
  DBChart1.Monochrome:=False;
  DrawGrayScale:=-1;
  DrawGrayInverted:=False;
  DBChart1.Invalidate;
  TeeModified;
end;

procedure TMainForm.SetGrayScale(Method:Integer; Inverted:Boolean);
begin { gray scale mode }
  DBChart1.Monochrome:=False;
  DrawGrayScale:=Method;
  DrawGrayInverted:=Inverted;
  DBChart1.Invalidate;
  TeeModified;
end;

procedure TMainForm.GrayScale2Click(Sender: TObject);
begin { gray scale mode }
  SetGrayScale(0,False);
end;

procedure TMainForm.Monochrome1Click(Sender: TObject);
begin { monochrome mode }
  DBChart1.Monochrome:=True;
  DrawGrayScale:=-1;
  TeeModified;
end;

procedure TMainForm.DBChart1AfterDraw(Sender: TObject);
begin { if DrawGrayScale... }
  if DrawGrayScale<>-1 then
     TeeGrayScale( (DBChart1.Canvas as TTeeCanvas3D).Bitmap,
                   DrawGrayInverted,
                   DrawGrayScale);
end;

procedure TMainForm.GrayScaleVisual1Click(Sender: TObject);
begin { Gray Scale visual mode }
  SetGrayScale(1,False);
end;

procedure TMainForm.InvertedGrayScale1Click(Sender: TObject);
begin { inverted Gray Scale }
  if DrawGrayScale=-1 then DrawGrayScale:=0;
  SetGrayScale(DrawGrayScale,True);
end;

{$IFDEF K3}
procedure TMainForm.ChartGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: WideString);
{$ELSE}
procedure TMainForm.ChartGrid1SetEditText(Sender: TObject; ACol,
  ARow: Integer; const Value: String);
{$ENDIF}
begin { chart data grid has been edited }
  TeeModified;
end;

procedure TMainForm.StatusBar1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
{$IFNDEF CLR}
var tmpRect : TRect;
{$ENDIF}
begin { change cursor when mouse is over status bar second (color) panel }
  {$IFNDEF CLR}
  {$IFDEF CLX}
  tmpRect:=TeeRect(0,0,0,0);
  {$ELSE}
  SendMessage(StatusBar1.Handle, SB_GETRECT, 1, Integer(@tmpRect));
  {$ENDIF}

  if PointInRect(tmpRect,X,Y) then
     StatusBar1.Cursor:=crHandPoint
  else
     StatusBar1.Cursor:=crDefault;
  {$ENDIF}
end;

procedure TMainForm.CBColorsClick(Sender: TObject);
begin { show / hide colors at Chart Grid }
  ChartGrid1.ShowColors:=CBColors.Checked;
end;

Procedure TrimWorkingSet;
{$IFNDEF LINUX}
var MainHandle : THandle;
{$ENDIF}
begin  { reduce allocated memory at startup }
  {$IFNDEF LINUX}
  MainHandle:=OpenProcess(PROCESS_ALL_ACCESS,False,GetCurrentProcessID);
  SetProcessWorkingSetSize(MainHandle,$ffffffff,$ffffffff);
  CloseHandle(MainHandle);
  {$ENDIF}
end;

procedure TMainForm.PopupLineOutlineClick(Sender: TObject);
begin { edit selected line series outline border }
  if EditChartPen(Self,TLineSeries(Selector.Series).OutLine) then
     TeeModified;
end;

procedure TMainForm.LabelsFormat1Click(Sender: TObject);
var tmp : TChartAxis;
begin { show formatting editor for selected Axis Labels }
  tmp:=Selector.Part.AAxis;
  with TFormatEditor.Create(nil) do
  try
    IsDate:=tmp.IsDateTime;
    if IsDate then
    begin
      Format:=tmp.DateTimeFormat;
      if Format='' then
         Format:=DateTimeDefaultFormat(tmp.Maximum);
    end
    else Format:=tmp.AxisValuesFormat;

    if ShowModal=mrOk then
    begin
      if IsDate and tmp.IsDateTime then
         tmp.DateTimeFormat:=TheFormat
      else
         tmp.AxisValuesFormat:=TheFormat;
      TeeModified;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.Hide3Click(Sender: TObject);
begin { hide Chart Grid and navigator }
  Toogle(Hide3);

  if Hide3.Checked then
  begin
    dataTop.Checked:=False;
    dataBottom.Checked:=False;
  end;

  RepositionChartGrid;
end;

procedure TMainForm.BottomTabClick(Sender: TObject);
begin { set Tabs position }
  {$IFNDEF CLX}
  if Sender=LeftTab then PageControl1.TabPosition:=tpLeft else
  if Sender=RightTab then PageControl1.TabPosition:=tpRight else
  if Sender=TopTab then PageControl1.TabPosition:=tpTop else
                        PageControl1.TabPosition:=tpBottom;

  TMenuItem(Sender).Checked:=True;
  {$ENDIF}
end;

procedure TMainForm.SelectorResizing(Sender: TObject);
begin { When resizing the Chart, show its current Width x Height at Status bar }
  with DBChart1 do
       StatusHint.Text:=Format(TeeMsg_Size,[Width,Height]);
end;

procedure TMainForm.None1Click(Sender: TObject);
begin { change the Chart bevel style }
  if Sender=Lower1 then DBChart1.BevelOuter:=bvLowered else
  if Sender=Raise1 then DBChart1.BevelOuter:=bvRaised else
                        DBChart1.BevelOuter:=bvNone;
  TeeModified;
end;

procedure TMainForm.MarksFontClick(Sender: TObject);
begin  { edit selected Series Marks font }
  if EditTeeFont(Self,Selector.Series.Marks.Font) then
     TeeModified;
end;

procedure TMainForm.TitleFontClick(Sender: TObject);
begin  { edit selected Title font }
  if EditTeeFont(Self,Selector.SelectedTitle.Font) then
     TeeModified;
end;

procedure TMainForm.AnnoFontClick(Sender: TObject);
begin { edit selected Annotation font }
  if EditTeeFont(Self,Selector.Annotation.Shape.Font) then
     TeeModified;
end;

procedure TMainForm.SelectorDragging(Sender: TObject);
begin { show at status bar the selected shape Left and Top
        positions when dragging it }
  With Selector.DraggingShape do
       StatusHint.Text:=Format(TeeMsg_Position,[Left,Top]);
end;

procedure TMainForm.ChartGridChangeColor(Sender: TObject);
begin { when a color is changed at Chart Data Grid }
  TeeModified;
end;

procedure TMainForm.Commander3DClick(Sender: TObject);
begin { call the original commander 3D button (switch 2D / 3D) and
        after that, set the Gallery 3D }
  Old3DEvent(TeeCommander1.Button3D);
  ChartGalleryPanel1.View3D:=DBChart1.View3D;
end;

procedure TMainForm.FontLeftAlignClick(Sender: TObject);
begin { change selected Title or Footer text alignment }
  if Selector.Part.AAxis<>nil then
  begin
    with Selector.Part.AAxis do
    if OtherSide then
       if Sender=FontLeftAlign then LabelsAlign:=alDefault
                               else LabelsAlign:=alOpposite
    else
       if Sender=FontLeftAlign then LabelsAlign:=alOpposite
                               else LabelsAlign:=alDefault;
  end
  else
  if Selector.SelectedTitle<>nil then
  with Selector.SelectedTitle do
       if Sender=FontLeftAlign   then Alignment:=taLeftJustify else
       if Sender=FontCenterAlign then Alignment:=taCenter else
                                      Alignment:=taRightJustify;
end;

procedure TMainForm.Bottom2Click(Sender: TObject);
begin { move Top / Bottom the Series toolbar }
  Toogle(TMenuItem(Sender));

  if Sender=TopToolBar then ToolBar1.Align:=alTop
                       else ToolBar1.Align:=alBottom;
  if Sender=TopToolBar then ToolBar2.Align:=alTop
                       else ToolBar2.Align:=alBottom;
end;

procedure TMainForm.Whatsthis1Click(Sender: TObject);
begin { show the "?" cursor to obtain help when clicking }
  {$IFNDEF CLX}
  DefWindowProc(Handle, WM_SYSCOMMAND, SC_CONTEXTHELP, 0);
  {$ENDIF}
end;

procedure TMainForm.ChartEditor1Show(Sender: TObject);
begin { remove the selected "handles" from chart when showing the editor }
  Selector.DrawHandles:=False;

  { Translate editor }
  TeeTranslateControl(Sender as TCustomForm);
end;

procedure TMainForm.ChartListBox1RemovedSeries(Sender: TChartListBox;
  Series: TCustomChartSeries);
begin { Series has been removed (destroyed) }
  if Assigned(Selector) then Selector.ClearSelection;
  TeeModified;
end;

procedure TMainForm.ShapeBorderColorMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Changed : Boolean;
begin { Change the Selected Pen color }
  SelectedBorder.Color:=DoEditColor(SelectedBorder.Color,Changed);
  if Changed then
  begin
    ShapeBorderColor.Brush.Color:=SelectedBorder.Color;
    TeeModified;
  end;
end;

{$IFDEF CLX}
procedure TMainForm.ComboPenStyleDrawItem(Sender: TObject; Index: Integer;
      Rect: TRect; State: TOwnerDrawState; var Handled: Boolean);
{$ELSE}
procedure TMainForm.ComboPenStyleDrawItem(Control: TWinControl;
  Index: Integer; Rect: TRect; State: TOwnerDrawState);
{$ENDIF}
var tmp : TColor;
begin { Draw Pen styles at Combo items }
  if (SelectedBorder<>nil) then
  With TControlCanvas(ComboPenStyle.Canvas) do
  begin
    {$IFDEF CLX}
    Brush.Style:=bsSolid;
    if (odFocused in State) or (odSelected in State) then
       Brush.Color:=clHighLight;
    {$ENDIF}

    FillRect(Rect);

    if Index<>ComboPenStyle.Items.Count-1 then
    begin
      {$IFNDEF CLX}
      if Index<>ComboPenStyle.Items.Count-2 then
      {$ENDIF}
         Pen.Style:=TPenStyle(Index);

      Pen.Color:=SelectedBorder.Color;

      if odSelected in State then
         Pen.Color:=ColorToRGB(clHighlightText)
      else
      begin
        tmp:=ComboPenStyle.Color;

        if Pen.Color=ColorToRGB(tmp) then
           if Pen.Color=clWhite then Pen.Color:=clBlack
                                else Pen.Color:=clWhite;
      end;

      {$IFNDEF CLX}
      if IsWindowsNT and (Index=ComboPenStyle.Items.Count-2) then
         Pen.Handle:=TeeCreatePenSmallDots(Pen.Color);
      {$ENDIF}

      MoveTo(Rect.Left+4,Rect.Top+8);
      LineTo(Rect.Right-4,Rect.Top+8);
    end;
  end;
end;

procedure TMainForm.ComboPenStyleChange(Sender: TObject);
var tmp    : Boolean;
    ThePen : TPen;
begin { Change Selected Pen style }
  tmp:=False;

  ThePen:=SelectedBorder;

  if ComboPenStyle.ItemIndex=ComboPenStyle.Items.Count-1 then
  begin
    ThePen.Style:=psClear;

    if ThePen is TChartPen then
       TChartPen(ThePen).SmallDots:=False;
  end
  else
  if (ThePen is TChartPen) and IsWindowsNT and
     (ComboPenStyle.ItemIndex=ComboPenStyle.Items.Count-2) then
  begin
    TChartPen(ThePen).SmallDots:=True;
    tmp:=False;
  end
  else
  begin
    tmp:=True;

    ThePen.Style:=TPenStyle(ComboPenStyle.ItemIndex);

    if ThePen is TChartPen then
       TChartPen(ThePen).SmallDots:=False;
  end;

  BorderWidth.Enabled:=tmp;
  TeeModified(True);
end;

procedure TMainForm.BorderWidthChange(Sender: TObject);
begin { Change Selected Pen Width }
  if Assigned(SelectedBorder) then
  begin
    if SelectedBorder.Width<>BorderWidth.Position then // <-- Width needs this pre-check
    begin
      SelectedBorder.Width:=BorderWidth.Position;
      TeeModified(True);
    end;
  end;
end;

Procedure TMainForm.SetBorderToolbar;
var tmp : TChartPen;
begin { Set controls in Border toolbar }
  tmp:=SelectedBorder;

  if Assigned(tmp) then
  begin
    ShapeBorderColor.Brush.Color:=tmp.Color;
    ShapeBorderColor.Visible:=True;

    if not ComboPenStyle.Enabled then
       EnableControls(True,[ComboPenStyle,BorderWidth]);

    BorderWidth.Position:=tmp.Width;

    if tmp.SmallDots then
    begin
      ComboPenStyle.ItemIndex:=ComboPenStyle.Items.Count-2;
      BorderWidth.Enabled:=False;
    end
    else
      ComboPenStyle.ItemIndex:=Ord(tmp.Style);
  end
  else
  begin
    ShapeBorderColor.Visible:=False;

    if ComboPenStyle.Enabled then
       EnableControls(False,[ComboPenStyle,BorderWidth]);
  end;
end;

procedure TMainForm.SetGalleryBorders;
var t   : Integer;
    tt  : Integer;
    tmp : TChartSeries;
begin
  with ChartGalleryPanel1 do
  for t:=0 to Charts.Count-1 do
      for tt:=0 to Charts[t].SeriesCount-1 do
      begin
        tmp:=Charts[t][tt];
        tmp.Pen.Visible:=Borders1.Checked;
        if tmp is TCustomSeries then
           TCustomSeries(tmp).Pointer.Pen.Visible:=Borders1.Checked
        else
        if tmp is TCustomPolarSeries then
           TCustomPolarSeries(tmp).Pointer.Pen.Visible:=Borders1.Checked;
      end;
end;

procedure TMainForm.Borders1Click(Sender: TObject);
begin { Show / Hide borders in all Charts at the Gallery }
  Toogle(Borders1);
  SetGalleryBorders;
end;

procedure TMainForm.Top2Click(Sender: TObject);
begin { align data grid navigator and controls to top or bottom  }
  Toogle(TMenuItem(Sender));
  if Top2.Checked then PanelData.Align:=alTop
                  else PanelData.Align:=alBottom;
end;

procedure TMainForm.PopupMenuGridPopup(Sender: TObject);
begin { Show / Hide data grid alignment sub-menu, if it is a window }
  AlignGrid1.Visible:=not TabData.Visible;
end;

procedure TMainForm.Right3Click(Sender: TObject);
begin { Change data grid alignment (when showing as a window) }
  Toogle(TMenuItem(Sender));
  if Sender=Top3 then
  begin
    PanelGrid.Align:=alTop;
    Splitter3.Align:=alTop;
    Splitter3.Top:=PanelGrid.Top+PanelGrid.Height;
  end
  else
  if Sender=Bottom3 then
  begin
    PanelGrid.Align:=alBottom;
    Splitter3.Align:=alBottom;
  end
  else
  if Sender=Left3 then
  begin
    PanelGrid.Align:=alLeft;
    Splitter3.Align:=alLeft;
    Splitter3.Left:=PanelGrid.Left+PanelGrid.Width;
  end
  else
  if Sender=Right3 then
  begin
    PanelGrid.Align:=alRight;
    Splitter3.Align:=alRight;
    Splitter3.Left:=PanelGrid.Left;
  end;
end;

procedure TMainForm.ChartListBox1ChangeOrder(Sender: TChartListBox;
  Series1, Series2: TCustomChartSeries);
begin
  TeeModified;
end;

procedure TMainForm.ChartListBox1ChangeColor(Sender: TChartListBox;
  Series: TCustomChartSeries);
begin
  TeeModified;
end;

procedure TMainForm.Options2Click(Sender: TObject);
begin
  with TOptionsForm.Create(Self) do
  try
    if ShowModal=mrOk then
    begin
      Self.ChartGalleryPanel1.Smooth:=TChartGalleryPanel.DefaultSmooth;
    end;
  finally
    Free;
  end;
end;

procedure TMainForm.Symbol1Click(Sender: TObject);
begin { edit Series Marks Symbols tab }
  EditSeriesMarks(Self,Selector.Series,True);
  TeeModified;
end;

procedure TMainForm.FormDestroy(Sender: TObject);
begin
  {$IFDEF TEEUSEMENUACTIONS}
  FMenuActions.Free;
  {$ENDIF}

  FreeAndNil(FRecentFiles);
  FreeAndNil(FConfig);
end;

procedure TMainForm.DataSources1Click(Sender: TObject);
begin { show / hide the Data Sources panel }
  TabDataSources.TabVisible:=Toogle(DataSources1);
  PageControlSeries.ActivePage:=TabDataSources;
end;

procedure TMainForm.SBNewDataSourceClick(Sender: TObject);
{$IFNDEF CLX}
{$IFNDEF NOUSE_BDE}
var tmp : TDataSet;
{$ENDIF}
{$ENDIF}
begin { show the Data Source dialog to add a new Data Source }
  {$IFNDEF CLX}
  {$IFNDEF NOUSE_BDE}
  With TNewDataSet.Create(nil) do
  try
    if ShowModal=mrOk then
    begin
      tmp:=CreateDataSet(Self);
      LBSources.Items.AddObject(tmp.Name,tmp);
      EnableSourceButtons;
      Self.TeeModified;
    end;
  finally
    Free;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TMainForm.SBDeleteSourceClick(Sender: TObject);
begin { delete the current selected Data Source }
  if TeeYesNo('Sure to delete Data Source '+SelectedSource.Name) then
  begin
    LBSources.Items.Delete(LBSources.ItemIndex);
    EnableSourceButtons;
    TeeModified;
  end;
end;

procedure TMainForm.SBEditSourceClick(Sender: TObject);
begin  { show the Data Source editor dialog to edit the selected Data Source }
  {$IFNDEF CLX}
  {$IFNDEF NOUSE_BDE}
  With TNewDataSet.Create(nil) do
  try
    SetOptions(SelectedSource);
    ButtonNextClick(nil);
    ButtonBack.Hide;
    if ShowModal=mrOk then
       Self.TeeModified;
  finally
    Free;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TMainForm.LBSourcesClick(Sender: TObject);
begin
  EnableSourceButtons;
end;

Function TMainForm.SelectedSource:TComponent;
begin
  result:=TComponent(LBSources.Items.Objects[LBSources.ItemIndex]);
end;

procedure TMainForm.SBRenameSourceClick(Sender: TObject);
var tmp : String;
begin { Show a dialog to change the selected Data Source title text }
  tmp:=SelectedSource.Name;

  if InputQuery('Rename Data Source','Data Source Name:',tmp) then
  begin
    SelectedSource.Name:=tmp;
    LBSources.Items[LBSources.ItemIndex]:=tmp;
    TeeModified;
  end;
end;

procedure TMainForm.ChangeGalleryChartSize;
var ChartGalleryWidth : Integer;
begin
  if Small1.Checked then ChartGalleryWidth:=80
                    else ChartGalleryWidth:=120;

  ChartGalleryPanel1.Width:=ChartGalleryWidth;
end;

//  ScrollBox1Resize(ScrollBox1);
procedure TMainForm.Small1Click(Sender: TObject);
begin
  Toogle(Small1);
  ChangeGalleryChartSize;
end;

procedure TMainForm.Smooth1Click(Sender: TObject);
begin
  ChartGalleryPanel1.Smooth:=Toogle(Smooth1);
end;

procedure TMainForm.EditColor1Click(Sender: TObject);
begin
  ChartGrid1.ChangeColor;
end;

procedure TMainForm.DefaultColor1Click(Sender: TObject);
begin
  ChartGrid1.ChangeColor(clTeeColor);
end;

procedure TMainForm.Makenullpoint1Click(Sender: TObject);
begin
  ChartGrid1.ChangeColor(clNone);
end;

procedure TMainForm.extfont1Click(Sender: TObject);
begin
  EditTeeFont(Self,ChartGrid1.Font);

  with TBitmap.Create,Canvas do
  try
    Font.Assign(ChartGrid1.Font);
    ChartGrid1.DefaultRowHeight:=2+TextHeight(TeeCharForHeight);
  finally
    Free;
  end;
end;

procedure TMainForm.Insertrow1Click(Sender: TObject);
begin
  ChartGrid1.Insert;
end;

procedure TMainForm.Deleterow1Click(Sender: TObject);
begin
  ChartGrid1.Delete
end;

procedure TMainForm.PopupDataPopup(Sender: TObject);
var tmpColor : TColor;
begin
  EditColor1.Visible:=Assigned({$IFNDEF CLR}TChartGridAccess{$ENDIF}(ChartGrid1).GetSeriesColor(tmpColor));

  DefaultColor1.Visible:=EditColor1.Visible and (tmpColor<>clTeeColor);
  Makenullpoint1.Visible:=EditColor1.Visible and (tmpColor<>clNone);
  N1.Visible:=EditColor1.Visible;
end;

procedure TMainForm.DBChart1DragOver(Sender, Source: TObject; X,
  Y: Integer; State: TDragState; var Accept: Boolean);
begin
  Accept:=Source is TGalleryChart;
end;

procedure TMainForm.DBChart1DragDrop(Sender, Source: TObject; X,
  Y: Integer);
var tmp : TChartSeries;
begin
  tmp:=DBChart1.AddSeries(TChartSeriesClass((Source as TGalleryChart)[0].ClassType));
  tmp.FillSampleValues;
  ChangeToNewSeries(tmp);
end;

procedure TMainForm.ChartListBox1ChangeActive(Sender: TChartListBox;
  Series: TCustomChartSeries);
begin
  TeeModified;
end;

procedure TMainForm.ResetFullScreen(Sender: TObject);
begin
  FullScreen1.Checked:=False;
  Selector.Active:=True;
end;

procedure TMainForm.FullScreen1Click(Sender: TObject);
begin
  FullScreen1.Checked:=not FullScreen1.Checked;
  FullScreen.Active:=FullScreen1.Checked;
  Selector.Active:=not FullScreen.Active;
end;

procedure TMainForm.LabelStartHereClick(Sender: TObject);
begin
  MainPage.ActivePage:=TabSamples;
  MainPageChange(Self);
end;

procedure TMainForm.DBChart1ValidDataSource(Sender: TCustomAxisPanel;
  ASeries: TChartSeries; AComponent: TComponent; var Valid: Boolean);
begin
  if Valid and (AComponent is TChartSeries) then
     Valid:=TChartSeries(AComponent).ParentChart=ASeries.ParentChart;
end;

// This event is called when clicking the "v" down arrow icon at chart gallery
// to show the "sub" gallery.

// Commented out due to an AV at Chart TeeProcs BroadcastMouseEvent
// that happens when destroying current clicked chart:
procedure TMainForm.ChartGalleryPanel1ShowSubGallery(Sender: TObject);
//var tmpClass : TChartSeriesClass;
begin
//  tmpClass:=TChartSeriesClass(ChartGalleryPanel1.SelectedSeries.ClassType);
//  CreateGallery([tmpClass]);
end;

procedure TMainForm.ChartTool3SelectCell(Sender: TObject);
begin
  ChartTool1.Pointer.Visible:=ChartTool3.SelectedCell<>-1;

  if ChartTool1.Pointer.Visible then
  begin
    ChartTool1.Pointer.Value:=Series1.YValues[ChartTool3.SelectedCell];
    ChartTool1.Pointer.Color:=Series1.ValueColor[ChartTool3.SelectedCell];
  end;
end;

procedure TMainForm.WelcomeChartDblClick(Sender: TObject);
begin
  EditChart(Self,WelcomeChart);
end;

procedure TMainForm.SamplesGallerySelectedChart(Sender: TObject);
begin
  if CheckSave then
  begin
    LoadChart(SamplesGallery.SelectedChart.Foot.Caption);

    // Set to New chart (force saving to another file)
    CurrentFile:='';
    MainSetCaption;
  end;
end;

procedure TMainForm.BOpenSampleClick(Sender: TObject);
begin
  SamplesGallerySelectedChart(Self);
end;

procedure TMainForm.MainPageChange(Sender: TObject);

   procedure InitSamples;
   var tmp : TStringList;
       t   : Integer;
       c   : TGalleryChart;
       tmpC : TCustomChart;
       SamplePath : String;
   begin
     SamplesGallery.View3D:=False;

     tmp:=GetSampleFiles(SamplePath);
     try
       ProgressBar1.Position:=0;
       ProgressBar1.Visible:=True;

       for t:=0 to tmp.Count-1 do
       begin
         ProgressBar1.Position:=Round(t*100/tmp.Count);

         c:=TGalleryChart.Create(Self);
         c.View3D:=False;
         c.Axes.Hide;

         c.Title.Caption:=RemoveFileExtension(tmp[t]);
         c.Foot.Caption:=SamplePath+tmp[t];

         tmpC:=TDBChart.Create(Self);
         try
           LoadChartFromFile(tmpC,SamplePath+tmp[t]);
           c.BackImage.Graphic:=tmpC.TeeCreateBitmap(clWhite,TeeRect(0,0,400,400)); // leak?
         finally
           tmpC.Free;
         end;

         c.BackImageInside:=True;

         SamplesGallery.Charts.Add(c);
         SamplesGallery.FinishAdd(c);
         c.Parent:=SamplesGallery;
       end;

       ProgressBar1.Position:=100;
       
       SamplesGallery.ResizeCharts;
     finally
       tmp.Free;
       ProgressBar1.Visible:=False;
     end;
   end;

var tmpFunc : TTeeGallery;
begin
  ChartAnimation1.Stop;

  if MainPage.ActivePage=TabWelcome then
     InitWelcomeChart
  else
  if (MainPage.ActivePage=TabFunctions) and (TabFunctions.ControlCount=0) then
  begin
    tmpFunc:=TTeeGallery.AddFunctionGallery(Self,DBChart1,SelectedFunctionGallery);
    tmpFunc.ChartFunctions.Gradient.Visible:=False;
    tmpFunc.ChartFunctions.Color:=clWhite;

    tmpFunc.CBFuncPage.ItemIndex:=0;
    tmpFunc.CBFuncPageChange(tmpFunc.CBFuncPage);

    AddFormTo(tmpFunc,TabFunctions);
    tmpFunc.Align:=alClient;
  end
  else
  if (MainPage.ActivePage=TabSamples) and (SamplesGallery.Charts.Count=0) then
  begin
    Screen.Cursor:=crHourGlass;
    try
      InitSamples;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;

  if MainPage.ActivePage=TabSheet1 then
     Menu:=MainMenu1
  else
     Menu:=nil;
end;

procedure TMainForm.Pen1Click(Sender: TObject);
begin{ show / hide the Pen toolbar }
  PanelPen.Visible:=Toogle(Pen1);
  ArrangeToolbars;
end;

procedure TMainForm.ChartTool4Click(Sender: TAnnotationTool;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  TeeGotoURL(Handle,'http://www.steema.com');
end;

procedure TMainForm.SamplesGalleryChangeChart(Sender: TObject);
begin
  BOpenSample.Enabled:=True;
end;

procedure TMainForm.CBLanguageChange(Sender: TObject);
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

procedure TMainForm.dataTopClick(Sender: TObject);
begin
  Toogle(dataTop);
  Hide3.Checked:=False;
  RepositionChartGrid;
end;

procedure TMainForm.dataBottomClick(Sender: TObject);
begin
  Toogle(dataBottom);
  Hide3.Checked:=False;
  RepositionChartGrid;
end;

procedure TMainForm.Import1Click(Sender: TObject);
begin
  with TImport_Form.Create(Self) do
  try
    if ShowModal=mrOk then
    begin
      FillChart(Self.DBChart1,False);

      { force grid to recalculate }
      ChartGrid1.RecalcDimensions;

      { mark modified }
      TeeModified;
    end;
  finally
    Free;
  end;
end;

end.

