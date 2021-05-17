{*****************************************}
{ TeeChart version 9                      }
{ Many examples and demos.                }
{ Copyright 1995-2021 by Steema Software. }
{ All Rights Reserved.                    }
{*****************************************}
unit Main;
{$I TeeDefs.inc}

{$IFDEF TEELITE}
{$DEFINE TEENOTHEMES}
{$ENDIF}
 
interface

uses
   {$IFNDEF LINUX}
   Windows, Messages,
   {$ENDIF}
   SysUtils, Classes, Math,

   {$IFNDEF D9} // Delphi 2005 error: VERSIONINFO resource duplicated at midas.res
   {$IFDEF D6}  // Delphi 5 does not include MidasLib.dcu
   {$IFNDEF CPUX64}
   //MidasLib,
   {$ENDIF}
   {$ENDIF}
   {$ENDIF}

   {$IFDEF D16}
   System.UITypes,
   {$ENDIF}

   {$IFDEF CLX}
   QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
   QComCtrls, QMenus, QButtons, Types, TeeURL, QTypes,
   QImgList,
   {$ELSE}
   Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
   ComCtrls, Menus, Buttons, RichEdit,
   ImgList,
   {$IFDEF D7}
   {$ENDIF}
   {$ENDIF}

   jpeg,

   Chart, TeeAbout, TeeProcs, TeeDraw3D, TeCanvas, TeEngine,
   {$IFNDEF TEENOTHEMES}
   TeeThemeEditor,
   {$ENDIF}

   {$IFDEF D7}
   Themes,
   {$ENDIF}
   
   TeeConst,

   {$IFNDEF TEELITE}
   TeeTools,
   {$ENDIF}

   {$IFDEF D16}
   Chart_LiveBindings,
   Series_LiveBindings,
   Series_LabelsBinding,
   {$ENDIF}

   //Base, TeeGDIPlus, TeePNGImage {, System.ImageList, Vcl.Imaging.pngimage};
   Base, TeeGDIPlus, System.ImageList, Vcl.Imaging.pngimage, frxClass;

Const
  TeeRegistryKey = '\Software\Steema Software\TeeChart Pro v'+TeeChartVersion+' VCL';
  TeeIniFileName  = 'tee'+TeeChartVersion+'new.ini';

  sc_DragMove = $f012;
  sc_Leftsize = $f001;
  sc_Rightsize = $f002;
  sc_Upsize = $f003;
  sc_UpLeftsize = $f004;
  sc_UpRightsize = $f005;
  sc_Dnsize = $f006;
  sc_DnLeftsize = $f007;
  sc_DnRightsize = $f008;

type
  {$IFDEF CLX}
  TRichEdit=class(TMemo);
  {$ENDIF}

  TTeeFormInfo=class
  public
    FormClass : TFormClass;
    UnitName  : String;
  end;

  TTeeNewForm = class(TForm)
    StatusBar1: TStatusBar;
    Splitter1: TSplitter;
    Panel2: TPanel;
    Images: TImageList;
    PopupMenu1: TPopupMenu;
    ShowAll1: TMenuItem;
    Timer1: TTimer;
    Presentation1: TMenuItem;
    Timer2: TTimer;
    PageExample: TPageControl;
    TabExample: TTabSheet;
    TabSource: TTabSheet;
    TabSupport: TTabSheet;
    ButtonConfig: TButton;
    Checksource1: TMenuItem;
    N1: TMenuItem;
    Exportall1: TMenuItem;
    TabForm: TTabSheet;
    Memo3: TMemo;
    N2: TMenuItem;
    CanvasGDI1: TMenuItem;
    CanvasOpenGL1: TMenuItem;
    N3: TMenuItem;
    ExporttoHTML1: TMenuItem;
    FullScreenChart1: TMenuItem;
    CanvasAntiAlias1: TMenuItem;
    N4: TMenuItem;
    VerifyallMemos1: TMenuItem;
    CanvasGDI2: TMenuItem;
    Font1: TMenuItem;
    Draw3D2: TDraw3D;
    SpeedButton1: TSpeedButton;
    SpeedButton2: TSpeedButton;
    LabelWWW: TLabel;
    Draw3D3: TDraw3D;
    Memo2: TMemo;
    Memo1: TMemo;
    Label4: TLabel;
    Draw3D4: TDraw3D;
    Draw3D5: TDraw3D;
    Chart1: TChart;
    LabelTopic: TLabel;
    Label6: TLabel;
    Label5: TLabel;
    MemoSupport: TMemo;
    BSupport: TBitBtn;
    spMinimize: TSpeedButton;
    spMaximize: TSpeedButton;
    Draw3D6: TDraw3D;
    Draw3D7: TDraw3D;
    sbNormal: TSpeedButton;
    sbClose: TSpeedButton;
    Panel3: TPanel;
    CBoxGDIPlus: TCheckBox;
    PageControl1: TPageControl;
    TabSheet2: TTabSheet;
    TreeView2: TTreeView;
    TabSearch: TTabSheet;
    Panel1: TPanel;
    Label2: TLabel;
    Label3: TLabel;
    SearchButton: TSpeedButton;
    CBSearch: TComboFlat;
    CBSearchSource: TCheckBox;
    CBFindAll: TCheckBox;
    TreeSearch: TTreeView;
    Image1: TImage;
    BNext: TSpeedButton;
    BPrevious: TSpeedButton;
    procedure FormCreate(Sender: TObject);
    procedure TreeView1Change(Sender: TObject; Node: TTreeNode);
    procedure BNextClick(Sender: TObject);
    procedure BPreviousClick(Sender: TObject);
    procedure LabelWWWClick(Sender: TObject);
    procedure ShowAll1Click(Sender: TObject);
    procedure TreeView1GetImageIndex(Sender: TObject; Node: TTreeNode);
    procedure TreeView1GetSelectedIndex(Sender: TObject; Node: TTreeNode);
    procedure PageControl1Change(Sender: TObject);
    procedure Presentation1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure PageExampleChange(Sender: TObject);
    procedure ButtonConfigClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure Checksource1Click(Sender: TObject);
    procedure CBSearchKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBSearchChange(Sender: TObject);
    procedure Panel1Resize(Sender: TObject);
    procedure SearchButtonClick(Sender: TObject);
    procedure PopupMenu1Popup(Sender: TObject);
    procedure MemoSupportChange(Sender: TObject);
    procedure BSupportClick(Sender: TObject);
    procedure Exportall1Click(Sender: TObject);
    procedure CanvasGDI1Click(Sender: TObject);
    procedure CanvasOpenGL1Click(Sender: TObject);
    procedure ExporttoHTML1Click(Sender: TObject);
    procedure FullScreenChart1Click(Sender: TObject);
    procedure CanvasAntiAlias1Click(Sender: TObject);
    procedure VerifyallMemos1Click(Sender: TObject);
    procedure CanvasGDI2Click(Sender: TObject);
    procedure Font1Click(Sender: TObject);
    procedure CBoxGDIPlusClick(Sender: TObject);
    procedure Draw3D1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure SpeedButton1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure Draw3D2MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure PageExampleDrawTab(Control: TCustomTabControl;
      TabIndex: Integer; const Rect: TRect; Active: Boolean);
    procedure Button1Click(Sender: TObject);
    procedure spMinimizeClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure spMaximizeClick(Sender: TObject);
    procedure sbNormalClick(Sender: TObject);
    procedure sbCloseClick(Sender: TObject);
  private
     { Private declarations }
     OldCodeFile     : String;
     RichEditCode    : TRichEdit;
     RichEditForm    : TRichEdit;

     CheckSource     : Boolean;

     {$IFNDEF TEELITE}
     FullScreen      : TFullScreenTool;
     {$ENDIF}

     {$IFNDEF CLX}
     FindDialog      : TFindDialog;
     {$ENDIF}

     {$IFDEF STEEMAVERSION}
     procedure AppException(Sender:TObject; E:Exception);
     {$ENDIF}
     
     procedure ChangeCanvas(Style:TNewCanvasStyle);
     Procedure CheckRegistry;
     Function CodeFile:String;
     Function CodePath:String;
     Function CreateRichEdit(const AParent:TWinControl):TRichEdit;
     function CurrentTeePanel:TCustomTeePanel;
     function CustomBorder:Boolean;
     Procedure DoSearch;
     Function ImageIndex(const Node:TTreeNode):Integer;

     {$IFNDEF CLX}
     procedure FindDialogFind(Sender: TObject);
     procedure RichEditKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
     {$ENDIF}

     procedure ShowForm(const ATree:TTreeView);
     procedure ShowFormClass(const AClass: TFormClass);
     Procedure ShowFormText;
     Procedure ShowSourceCode;
     Procedure TeeShowAboutBoxDemo(Const ACaption:String=''; Const AVersion:String='';
                          Const AExtra:String='');

     {$IFNDEF CLX}
  protected
     procedure CreateParams(var Params: TCreateParams) ; override;
     {$ENDIF}
  public
     { Public declarations }

     InternalCodePath : String;

     TheForm : TForm;

     procedure AddFormCode(const st:TStrings);
     Function FormOf(const ANode:TTreeNode):TTeeFormInfo;
     Function HasForm(const ANode:TTreeNode):Boolean;
     Function TheTree:TTreeView;
  end;

var
   TeeNewForm: TTeeNewForm;
   Loading : boolean;

Procedure TrimWorkingSet;

// http://www.delphidabbler.com/articles?article=23&part=1
function IsWindows64Bit: Boolean;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{$IFDEF D6}
{$WARN UNIT_PLATFORM OFF}
{$ENDIF}

Uses {$IFDEF LINUX}
     IniFiles,
     {$ELSE}
     MAPI, Registry ,MMSystem, FileCtrl,
     {$ENDIF}

     {$IFNDEF LINUX} // OpenGL examples not available in Linux
     {$IFNDEF TEELITE}
     Draw3D_Canvas,
     OpenGL_Editor,
     OpenGL_Football,
     OpenGL_Surface,
     OpenGL_TriSurface,
     OpenGL_Canvas,
     {$ENDIF}
     {$ENDIF}

     {$IFNDEF CLX}   // Database Examples not available in CLX
     TeeChartWizardDemo,

     {$IFNDEF NOUSE_BDE}
     Base_DBChart,
     DBChart_Speed,
     DBChart_Summary,
     DBChart_SummaryOrder,
     DBChart_Order,
     {$ENDIF}

     TeeGDIPlusEditor,

     {$IFNDEF TEELITE}
     TeeGDIPlusComponent,
     {$ENDIF}

     // Problem:
     // Delphi 8 cannot compile this demo when using TeeChart "Standard" version
     // when using the following DBChart_xxx demo units.
     //
     // With TeeChart "Pro" or BDS2005/2006 there is no problem.
     //
     // The error is:
     // "Fatal: Unit Borland.Vcl.DBCtrls was compiled with a
     //  different version of Borland.Vcl.Db.dsInactive"

     {$IFNDEF NOUSE_BDE}

     {$IFNDEF D8TeeStandard}
     DBChart_LocateRecord,
     DBChart_MasterDetail,
     DBChart_CrossTab,
     DBChart_SingleRecord,
     {$ENDIF}

     DBChart_AnyDataSet,

     {$IFNDEF TEELITE}
     Series_DataSet,
     {$ENDIF}

     ChartDataSet,

     DBChart_Agg,
     ChartEditor_HideDataSets,
     DBChart_CrossTabSource,
     DBChart_CrossTabSource_HideSeries,
     {$ENDIF}

     RichText_Drawing,

     {$IFNDEF TEELITE}
     TeeDemoGDIPlus,
     {$ENDIF}

     {$ELSE}
     CLX_NotAvail,
     {$ENDIF}

     {$IFNDEF TEELITE}
     Export_PDF,
     Export_GIF,
     Export_JPEG,
     Export_PNG,
     Series_XMLSource,
     Series_XMLSourceWeb,
     {$ENDIF}
     
     {$IFNDEF TEELITE}

     {$IFNDEF CPUX64}
     Export_PCX,
     {$ENDIF}

     Export_Email,
     Tool_Video,
     Tool_VideoPlayer,
     {$ENDIF}

     {$IFDEF NOUSE_BDE}
     CPU64Bit_NoAvail,
     {$ENDIF}

     TeeBMPOptions,

     {$IFNDEF LINUX}
     TeeExpForm,
     {$ENDIF}

     {$IFNDEF TEELITE}
     TeeDataTableEditor,
     TeeVMLCanvas, TeeSVGCanvas,
     TeePNG, TeeToolsGalleryDemos,
     TeeXAMLCanvas, TeeFlexCanvas, TeeVRML3D, TeeJavaScript,
     TeeXAMLCanvasEditor, TeeSVGCanvasEditor, TeeJavaScriptEditor,
     {$ENDIF}

     {$IFDEF STEEMAVERSION}
     TeeExceptionDialog,
     {$ENDIF}

     EditChar, TeePenDlg, TeeExport, TeeStringsEditor, TeeBrushDlg;
     
Const
  FolderSeparator = {$IFDEF LINUX} '/' {$ELSE} '\' {$ENDIF} ;

procedure TTeeNewForm.FormCreate(Sender: TObject);

  Function StringIn(Const S:String; Const Strings:Array of String):Boolean;
  var t : Integer;
  begin
    result:=False;
    for t:=Low(Strings) to High(Strings) do
    if Strings[t]=S then
    begin
      result:=True;
      exit;
    end;
  end;

  Procedure LoadTree(ATree:TTreeView; AMemo:TMemo);
  var i,
      t        : Integer;
      tmpClass : String;
      tmpUnit  : String;
      tmp      : TStringStream;
      FormInfo : TTeeFormInfo;
      {$IFDEF CLX}
      tmpLine  : Integer;
      tmpPos   : Integer;
      s        : String;
      {$ENDIF}
 begin
    {$IFDEF CLX}
    with AMemo.Lines do
    begin
      BeginUpdate;
      for tmpLine:=0 to Count-1 do
      begin
        s:=Strings[tmpLine];
        for tmpPos:=1 to Length(s) do
        if s[tmpPos]=' ' then s[tmpPos]:=#9
                         else break;
        Strings[tmpLine]:=s;
      end;
      EndUpdate;
    end;

    {$IFDEF D6}
    ActivateClassGroup(TControl);
    {$ENDIF}

    {$ENDIF}

    tmp:=TStringStream.Create(AMemo.Lines.Text);
    try
      ATree.Visible:=False;
      ATree.LoadFromStream(tmp);
      ATree.Visible:=True;
    finally
      tmp.Free;
    end;

    with ATree do
    begin
      for t:=0 to Items.Count-1 do
      with Items[t] do
      begin
        i:=Pos(',', Text);
        if i>0 then
        begin
          tmpClass:=Copy(Text, i+1, Length(Text));
          Text:=Copy(Text, 1, i-1);

          tmpUnit:='';
          i:=Pos(',',tmpClass);
          if i>0 then
          begin
            tmpUnit:=Copy(tmpClass,i+1,Length(tmpClass));
            tmpClass:=Copy(tmpClass,1,i-1);
          end;

          {$IFDEF D16}
          {$ELSE}
          if StringIn(tmpClass, [ 'TChartLiveBindings',
                                  'TSeriesLiveBindings',
                                  'TSeriesLabelsBinding' ]) then
             tmpClass:='TXE2OnlyAvail'; // TRAD_XE2_Only
          {$ENDIF}

          {$IFDEF NOUSE_BDE}
          if StringIn(tmpClass, [ 'TBaseDBChart',
                                  'TDBChartSpeed',
                                  'TDBChartSummary',
                                  'TDBChartOrder',
                                  'TDBChartRecordLocate',
                                  'TLinkedTablesForm',
                                  'TDBChartCrossTab',
                                  'TDBChartAny',
                                  'TDBChartSingleRecord',
                                  'TDBChartAgg',
                                  'TDBSummaryOrder',
                                  'TSeriesDataSetForm',
                                  'TChartEditorHideDataSets',
                                  'TDBCrossTabSourceDemo',
                                  'TDBCrossTabSourceDemoHideSeries',
                                  'TPCXExportForm',
                                  'TChartDataSetDemo']) then
            tmpClass:='TCPU64BitNoAvail';
          {$ENDIF}

          {$IFDEF CLX}
          if StringIn(tmpClass, [ 'TBaseDBChart',
                                  'TDBChartSpeed',
                                  'TDBChartSummary',
                                  'TDBChartOrder',
                                  'TDBChartRecordLocate',
                                  'TLinkedTablesForm',
                                  'TDBChartCrossTab',
                                  'TDBChartAny',
                                  'TDBChartSingleRecord',
                                  'TDBChartAgg',
                                  'TDBSummaryOrder',
                                  'TSeriesDataSetForm',
                                  'TChartEditorHideDataSets',
                                  'TChartWizardDemo',
                                  'TDBCrossTabSourceDemo',
                                  'TRichTextDrawing',
                                  'TGDIPlusForm',
                                  'TChartDataSetDemo']) then
               tmpClass:='TCLXNotAvail';
          {$ENDIF}

          {$IFDEF D8TeeStandard}
          if StringIn(tmpClass, [ 'TDBChartRecordLocate',
                                  'TLinkedTablesForm',
                                  'TDBChartCrossTab',
                                  'TDBChartSingleRecord']) then

               tmpClass:='TCLRNotAvail';
          {$ENDIF}

          {$IFDEF LINUX}
          if StringIn(tmpClass, [ 'TOpenGLEditorForm',
                                  'TOpenGLTriSurface',
                                  'TOpenGLCanvas'    ,
                                  'TOpenGLFootball',
                                  'TOpenGLSurface',
                                  'TDraw3DCanvas'
                                  ]) then
               tmpClass:='TCLXNotAvail';
          {$ENDIF}

          FormInfo:=TTeeFormInfo.Create;
          FormInfo.FormClass:=TFormClass(FindClass(tmpClass));
          FormInfo.UnitName:=tmpUnit;
          Data:=FormInfo;
        end;
      end;

      Items[0].Expand(False);
    end;
 end;

begin
  {$IFDEF STEEMAVERSION}
  Application.OnException:=AppException;
  {$ENDIF}

  {$IFDEF TEELITE}
  Application.Title:='TeeChart Standard v'+TeeChartVersion+' - What''s New !';
  ShowMessage('Attention:'#13#13+'Please be aware that a number of the forms in this demo'#13'were compiled with the TeeChart Professional version.');
  Caption:=Application.Title;
  {$ENDIF}

  {$IFDEF D7}
  Panel3.ParentBackground:=True;
  {$ENDIF}
  
  LabelWWW.Transparent:=True;  // <--- To solve D7 VCL design-time bug

  // QC 19859
  {$IFNDEF D11}

  {$IFNDEF CLX}
  if IsWindows64Bit then
  begin
    PageExample.OwnerDraw:=False;
    PageControl1.OwnerDraw:=False;
  end;
  {$ENDIF}

  {$ENDIF}

  if CustomBorder then
     Borderstyle := {$IFDEF CLX}fbsNone{$ELSE}bsNone{$ENDIF}
  else
  begin
    spMinimize.Hide;
    spMaximize.Hide;
    sbNormal.Hide;
    sbClose.Hide;
  end;

  //StatusBar1.Color := Draw3D3.Gradient.StartColor;
  //Color := Draw3D3.Gradient.StartColor;

  PageControl1.ActivePage:=TabSheet2;
  LoadTree(TreeView2,Memo2);

  {$IFNDEF CLX}
  //TreeView1.HotTrack:=True;
  TreeView2.HotTrack:=True;

  {$IFDEF D7}
  Panel2.ParentBackground:=False;
  {$ENDIF}

  {$ENDIF}

  PageExample.HotTrack:=True;

  if (Screen.Width<=1366) or (Screen.Height<=768) then
     WindowState:=wsMaximized
  else
  begin
    {$IFDEF CLX}
    Width:=Min(Screen.Width,980);
    Height:=Min(Screen.Height,700);

    {$ELSE}
    Width:=Min(Screen.{$IFDEF D7}WorkAreaWidth{$ELSE}Width{$ENDIF},980);
    Height:=Min(Screen.{$IFDEF D7}WorkAreaHeight{$ELSE}Height{$ENDIF},700);
    {$ENDIF}
  end;

  ChangeCanvas(ncGDIPlus); //init TeeChart in GDI+
end;

function TTeeNewForm.CustomBorder:Boolean;
begin
  {$IFDEF D16}
  with StyleServices do
       result:=(not Available) and (not Enabled);
  {$ELSE}
  {$IFDEF D7}
  with ThemeServices do
       result:=(not ThemesAvailable) and (not ThemesEnabled);
  {$ELSE}
  result:=False;
  {$ENDIF}
  {$ENDIF}
end;

procedure TTeeNewForm.ShowFormClass(const AClass: TFormClass);
begin
  { create and insert a Form, then show it... }
  TheForm:=AClass.Create(Self);

  {$IFDEF CLX}
  AddFormTo(TheForm,TabExample);
  {$ELSE}

  with TheForm do
  begin
    Visible:=False;
    BorderStyle:=bsNone;
    Parent:=TabExample;
    Align:=alClient;
    Show;
  end;
  {$ENDIF}
end;

Function TTeeNewForm.HasForm(const ANode:TTreeNode):Boolean;
begin
  result:=Assigned(ANode) and Assigned(ANode.Data);
end;

Function TTeeNewForm.FormOf(const ANode:TTreeNode):TTeeFormInfo;
begin
  result:=TTeeFormInfo(ANode.Data)
end;

procedure TTeeNewForm.ShowForm(const ATree:TTreeView);
var s : String;
    tmpClass : TFormClass;
begin
  if ATree.Selected<>nil then
  begin
    if HasForm(ATree.Selected) then
    begin
      // Find the Form corresponding to the Tree item, and create it
      tmpClass:=FormOf(ATree.Selected).FormClass;

      // If selected form is different than current form...
      if (not Assigned(TheForm)) or (tmpClass<>TheForm.ClassType) then
      begin
        FreeAndNil(TheForm);
        ShowFormClass(tmpClass);

        if CheckSource and (CodeFile<>'') then
           if not FileExists(CodePath+FolderSeparator+CodeFile+'.pas') then
              Raise Exception.Create(CodeFile+'.pas not found.');
      end;
    end;

    s:=CodeFile;
    if s<>'' then s:=' ('+s+'.pas)';

    StatusBar1.SimpleText:='     ' + ATree.Selected.Text+s;
  end;
end;

{ Show the corresponding Form, enable / disable the buttons }
procedure TTeeNewForm.TreeView1Change(Sender: TObject; Node: TTreeNode);
begin
  PageExample.ActivePage:=TabExample;

//  Color := cl3DLight;

  ShowForm(Sender as TTreeView);

  with Sender as TTreeView do
  begin
    BPrevious.Enabled := Assigned(Selected) and (Selected.AbsoluteIndex>0);
    BNext.Enabled := Assigned(Selected) and (Selected.AbsoluteIndex<Items.Count-1);
    TabSource.TabVisible:=CodeFile<>'';
    TabForm.TabVisible:=TabSource.TabVisible;
  end;

//  Color := Draw3D3.Gradient.StartColor;
end;

Function TTeeNewForm.TheTree:TTreeView;
begin
  if PageControl1.ActivePage=TabSheet2 then result:=TreeView2
  {else
  if PageControl1.ActivePage=TabSheet2 then result:=TreeView2}
                                       else result:=TreeSearch;
end;

procedure TTeeNewForm.BNextClick(Sender: TObject);
begin
  with TheTree do Items[Selected.AbsoluteIndex+1].Selected := true
end;

procedure TTeeNewForm.BPreviousClick(Sender: TObject);
begin
 with TheTree do Items[Selected.AbsoluteIndex-1].Selected := true
end;

procedure TTeeNewForm.LabelWWWClick(Sender: TObject);
begin
  TeeGotoURL(Handle, LabelWWW.Caption);
end;

procedure TTeeNewForm.ShowAll1Click(Sender: TObject);
var t : Integer;
    t1, t2 : Longint;
begin
  t1:=GetTickCount;

  With TheTree do
  for t:=0 to Items.Count-1 do
  begin
    Selected:=Items[t];
    Application.ProcessMessages;
  end;

  t2:=GetTickCount;

  StatusBar1.SimpleText:='Time: '+IntToStr(t2-t1)+' msec.';
end;

Function TTeeNewForm.ImageIndex(const Node:TTreeNode):Integer;
begin
  if Node.HasChildren then
     if Node.Expanded then result:= 1
                      else result:= 0
  else
  {if Node.TreeView=TreeView1 then
     result:= 2
  else}
     result:= 3;
end;

procedure TTeeNewForm.TreeView1GetImageIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.ImageIndex:=ImageIndex(Node);
end;

procedure TTeeNewForm.TreeView1GetSelectedIndex(Sender: TObject;
  Node: TTreeNode);
begin
  Node.SelectedIndex:=ImageIndex(Node);
end;

Function StringFromRegistry(const AValue:String):String;
begin
  result:='';

  {$IFDEF LINUX}
  with TIniFile.Create(TeeIniFileName) do
  try
    result:=ReadString('code',AValue,'');
  finally
    Free;
  end;
  {$ELSE}
  With TRegistry.Create do
  try
    if OpenKeyReadOnly(TeeRegistryKey) then
       result:=ReadString(AValue);
  finally
    Free;
  end;
  {$ENDIF}
end;

var
  SearchReaden:Boolean=False;

procedure TTeeNewForm.PageControl1Change(Sender: TObject);

  procedure ReadSearchCombo;
  var t : Integer;
      tmp : String;
  begin
    CBSearch.Clear;

    for t:=0 to 20 do
    begin
      tmp:=StringFromRegistry('Search'+IntToStr(t));
      if tmp<>'' then
         CBSearch.Items.Add(tmp);
    end;

    SearchReaden:=True;
  end;

begin
  if PageControl1.ActivePage=TabSearch then
  begin
    BPrevious.Enabled:=False;
    BNext.Enabled:=False;
    CBSearchSource.Enabled:=CodePath<>'';
    if not CBSearchSource.Enabled then CBSearchSource.Checked:=False;

    if (not SearchReaden) and (CBSearch.Items.Count=0) then
       ReadSearchCombo;

    CBSearch.SetFocus;
  end
  else
  begin
    TreeSearch.Selected:=nil;
    TreeView1Change(TheTree,TheTree.Selected);
  end;
end;

procedure TTeeNewForm.Presentation1Click(Sender: TObject);
begin
  Presentation1.Checked:=not Presentation1.Checked;
  Timer1.Enabled:=Presentation1.Checked;
  if Timer1.Enabled then TheTree.Selected:=TheTree.Items[0];
end;

procedure TTeeNewForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False;
  With TheTree do Selected:=Items[Selected.AbsoluteIndex+1];
  Timer1.Enabled:=True;
end;

{$IFNDEF LINUX}
{$R Sound.Res}

Procedure PlaySoundResource(Const Sound:String);
var tmp : Integer;
begin
  tmp:=LoadResource(HInstance,FindResource(HInstance,PChar(Sound),RT_RCDATA));

  PlaySound(LockResource(tmp),HInstance,
    SND_MEMORY or SND_SYNC or SND_NODEFAULT or SND_NOWAIT);
end;
{$ENDIF}

Procedure StringToRegistry(const AKey,AValue:String);
begin
  {$IFDEF LINUX}
  with TIniFile.Create(TeeIniFileName) do
  try
    WriteString('code',AKey,AValue);
    UpdateFile;
  finally
    Free;
  end;
  {$ELSE}
  With TRegistry.Create do
  try
    if OpenKey(TeeRegistryKey,True) then
       WriteString(AKey,AValue);
  finally
    Free;
  end;
  {$ENDIF}
end;

procedure TTeeNewForm.FormDestroy(Sender: TObject);

  procedure StoreSearchCombo;
  var t: Integer;
  begin
    for t:=0 to 20 do
        if CBSearch.Items.Count>t then
           StringToRegistry('Search'+IntToStr(t),CBSearch.Items[t]);
  end;

  procedure ClearTreeNodes(Tree:TTreeView);
  var t:Integer;
  begin
    for t:=0 to Tree.Items.Count-1 do
    if Assigned(Tree.Items[t].Data) then
       TTeeFormInfo(Tree.Items[t].Data).Free;
  end;

begin
  StoreSearchCombo;

  //ClearTreeNodes(TreeView1);
  ClearTreeNodes(TreeView2);

  {$IFNDEF LINUX}
  {$IFOPT D-}
  PlaySoundResource('THANKYOU');
  {$ENDIF}
  {$ENDIF}
end;

{$IFDEF CLX}
type  TTreeViewAccess=class(TTreeView);
{$ENDIF}

procedure TTeeNewForm.FormShow(Sender: TObject);
var tmp : String;

  Function FindItem(ATree:TTreeView):Boolean;
  var t : Integer;
  begin
    result:=False;
    With ATree do
    for t:=0 to Items.Count-1 do
    if HasForm(Items[t]) and
       (UpperCase(FormOf(Items[t]).FormClass.ClassName)=tmp) then
    begin
      Selected:=Items[t];
      result:=True;
      exit;
    end;
  end;

begin
  {$IFNDEF LINUX}
  if IsWindowsNT then { minimize used memory by Windows... }
     SetProcessWorkingSetSize(GetCurrentProcess,$FFFFFFFF,$FFFFFFFF);
  {$ENDIF}

  PageExample.ActivePage:=TabExample;

  if ParamCount>0 then { find an specific demo Form... (ie: TSmithForm) }
  begin
    tmp:=UpperCase(ParamStr(1));

    if tmp='AUTOTEST' then
    begin
      ShowAll1Click(Self);
      Close;
    end
    else
    //if not FindItem(TreeView1) then
       if FindItem(TreeView2) then
          PageControl1.ActivePage:=TabSheet2;

    Timer2.Enabled:=False;
  end
  else TreeView2.Selected:=TreeView2.Items[0];

  {$IFDEF CLX}
  // Fix CLX bug, when showing a TreeView...
  TTreeViewAccess(TreeView1).UpdateControl;
  {$ENDIF}

  TrimWorkingSet;
end;

Procedure DeleteFromRegistry(const AValue:String);
begin
  {$IFDEF LINUX}
  with TIniFile.Create(TeeIniFileName) do
  try
    DeleteKey('code',AValue);
    UpdateFile;
  finally
    Free;
  end;
  {$ELSE}
  With TRegistry.Create do
  try
    if OpenKey(TeeRegistryKey,False) then
       DeleteValue(AValue);
  finally
    Free;
  end;
  {$ENDIF}
end;

Function TTeeNewForm.CodePath:String;
begin
  if InternalCodePath='' then
  begin
    result:=Trim(StringFromRegistry('DemoPath'));

    if result='' then
       if FileExists('Tee'+TeeChartVersion+'New.dpr') then
          result:=GetCurrentDir;
  end
  else
    result:=InternalCodePath;
end;

Function TTeeNewForm.CodeFile:String;
begin
  if HasForm(TheTree.Selected) then
     result:=Trim(FormOf(TheTree.Selected).UnitName)
  else
     result:='';
end;

{$IFNDEF CLX}
Procedure HighLight(const RichEdit:TCustomRichEdit; const ACommentColor:TColor);
var p   : Integer;
    Len : Integer;
    tmp : String;

  Function IsKeyword(Const S:String):Boolean;
  Const Keywords:Array[0..50] of String=
         ('UNIT','INTERFACE','BEGIN','IMPLEMENTATION','PROCEDURE','INHERITED',
          'INITIALIZATION','END','CLASS','TYPE','VAR','PRIVATE','PUBLIC',
          'IF','ELSE','WHILE','FOR','REPEAT','RECORD','OBJECT','FUNCTION',
          'STRING','CONST','AND','NOT','IN','DO','THEN','WITH','USES',
          'TRY','FINALLY','EXCEPT','PACKED','CASE','OF','OVERLOAD','DEPRECATED',
          'AS','IS','FINALIZATION','OVERRIDE','SEALED','STATIC','OPERATOR',
          'STRICT','NIL','TRUE','FALSE','REFERENCE','VIRTUAL');

  var t:Integer;
  begin
    for t:=0 to High(Keywords) do
    if Keywords[t]=S then
    begin
      result:=True;
      exit;
    end;

    result:=False;
  end;

  Function NextWordIsKeyword:Boolean;

    Procedure HighLightComment(const EndChar:Char);
    begin
      RichEdit.SelStart:=p-1;
      Inc(p);

      While (p<=Len) and (tmp[p]<>EndChar) do
        Inc(p);

      With RichEdit do
      begin
        SelLength:=p-SelStart;

        With SelAttributes do
        begin
          Style:=[fsItalic];
          //Color:=ACommentColor;
        end;

        SelStart:=0;
        SelLength:=0;
      end;
    end;

  Const Valid=['A'..'Z','a'..'z','_'];
  var p2  : Integer;
      Key : String;
  begin
    While p<=Len do
    begin
      if {$IFDEF D12}CharInSet(tmp[p], Valid){$ELSE}(tmp[p] in Valid){$ENDIF} then
         break
      else
      if tmp[p]='{' then
         HighLightComment('}')
      else
      if (tmp[p]='/') and ((p+1)<=Len) and (tmp[p+1]='/') then
         HighLightComment(#13)
      else
         Inc(p);
    end;

    p2:=p;

    While (p<=Len) and {$IFDEF D12}CharInSet(tmp[p], Valid){$ELSE}(tmp[p] in Valid){$ENDIF} do Inc(p);

    if p=Len then
       Inc(p);

    if p>p2 then
    begin
      key:=Copy(tmp,p2,p-p2);
      result:=IsKeyword(UpperCase(Key));

      RichEdit.SelStart:=p2-1;
      RichEdit.SelLength:=p-p2;
      Inc(p);
    end
    else
      result:=False;
  end;

  function RemoveCRLF(const S:String):String;
  var i : Integer;
  begin
    result:=S;

    repeat
       i:=Pos(#13#10,result);

       if i>0 then
          Delete(result,i,1);

    until i=0;
  end;

begin
  RichEdit.Lines.BeginUpdate;
  try
    p:=1;

    {$IFDEF D12} // D2009 an up, remove #10
    tmp:=RemoveCRLF(RichEdit.Lines.Text);
    {$ELSE}
    tmp:=RichEdit.Lines.Text;
    {$ENDIF}

    Len:=Length(tmp);

    While p<Len do
       if NextWordIsKeyword then
          RichEdit.SelAttributes.Style:=[fsBold];

    RichEdit.SelStart:=0;
    RichEdit.SelLength:=0;
  finally
    RichEdit.Lines.EndUpdate;
  end;
end;
{$ENDIF}

Function TTeeNewForm.CreateRichEdit(const AParent:TWinControl):TRichEdit;
begin
  result:=TRichEdit.Create(Self);

  With result do
  begin
    Align:=alClient;
    ReadOnly:=True;
    WordWrap:=False;
    ScrollBars:=ssBoth;
    Font.Name:='Courier New';
    Font.Size:=9;
    Parent:=AParent;

    {$IFNDEF CLX}
    OnKeyDown:=RichEditKeyDown;
    PlainText:=True;  // 5.02
    {$ENDIF}
  end;
end;

procedure TTeeNewForm.CheckRegistry;
begin
  if not FileExists(CodePath+FolderSeparator+'Tee'+TeeChartVersion+'New.dpr') then
     DeleteFromRegistry('DemoPath');
end;

Procedure TTeeNewForm.ShowFormText;
var tmpForm : TFileStream;

    {$IFNDEF CLX}
    tmpOutput : TMemoryStream;
    {$ENDIF}

    tmpFileName : String;
begin
  CheckRegistry;
  ButtonConfig.Visible:=CodePath='';

  if (CodePath<>'') and (CodeFile<>'') then
  begin
    RichEditForm.Free;
    RichEditForm:=CreateRichEdit(TabForm);

    tmpFileName:=CodePath+FolderSeparator+CodeFile;

    {$IFDEF CLX}
    tmpFileName:=tmpFileName+'.xfm';
    {$ELSE}
    tmpFileName:=tmpFileName+'.dfm';
    {$ENDIF}

    tmpForm:=TFileStream.Create(tmpFileName,fmOpenRead);
    try
      {$IFDEF CLX}
      RichEditForm.Lines.LoadFromStream(tmpForm);
      {$ELSE}

      tmpOutput:=TMemoryStream.Create;
      try
        tmpForm.Position:=0;
        ObjectResourceToText(tmpForm,tmpOutput);

        // show form at RichEdit
        tmpOutput.Position:=0;
        RichEditForm.Lines.LoadFromStream(tmpOutput);

        {$IFNDEF CLX}
        HighLight(RichEditForm,clNavy);
        {$ENDIF}
      finally
        tmpOutput.Free;
      end;

      {$ENDIF}
    finally
      tmpForm.Free;
    end;
  end;
end;

Procedure TTeeNewForm.ShowSourceCode;
var UnitFileName : String;
begin
  CheckRegistry;
  ButtonConfig.Visible:=CodePath='';

  if (CodePath<>'') and (CodeFile<>'') then
  begin
    if OldCodeFile<>CodeFile then
    begin
      RichEditCode.Free;
      RichEditCode:=CreateRichEdit(TabSource);

      UnitFileName:=CodePath+FolderSeparator+CodeFile+'.pas';
      RichEditCode.Lines.LoadFromFile(UnitFileName);
      StatusBar1.SimpleText:=UnitFileName;

      {$IFNDEF CLX}
      HighLight(RichEditCode,clNavy);
      {$ENDIF}

      RichEditCode.SetFocus;

      OldCodeFile:=CodeFile;
    end;
  end
  else
  begin
    FreeAndNil(RichEditCode);
    OldCodeFile:='';
  end;
end;

procedure TTeeNewForm.PageExampleChange(Sender: TObject);
begin
  if PageExample.ActivePage=TabSource then ShowSourceCode
  else
  if PageExample.ActivePage=TabForm then ShowFormText
  else
  if PageExample.ActivePage=TabSupport then
  begin
    LabelTopic.Caption:=CodeFile;
    MemoSupport.Lines.Clear;
    MemoSupport.SetFocus;
  end;
end;

procedure TTeeNewForm.ButtonConfigClick(Sender: TObject);
var tmpDir : String;
begin
  {$IFNDEF LINUX}
  tmpDir:='';
  if TeeSelectFolder('Folder with TeeChart Pro v'+TeeChartVersion+
                     ' Demo Sources','',tmpDir) then
  begin
    StringToRegistry('DemoPath',tmpDir);
    PageExampleChange(Self);
  end;
  {$ENDIF}
end;

procedure TTeeNewForm.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Timer1.Enabled:=False;
  Timer2.Enabled:=False;
end;

procedure TTeeNewForm.Checksource1Click(Sender: TObject);
begin
  CheckSource:=True;
  try
    ShowAll1Click(Self);
  finally
    CheckSource:=False;
  end;
end;

type TTeeCustomMemo={$IFDEF CLX}TMemo{$ELSE}TCustomMemo{$ENDIF};

Procedure TTeeNewForm.DoSearch;

var SearchText : Array[1..100] of String;
    NumWords   : Integer;
    tmpMemo    : TStringList;
    FindAllWords : Boolean;

 // Return true if search found in S string...
 Function FoundTextIn(S:String):Boolean;
 var t : Integer;
 begin
   result:=False;
   S:=UpperCase(S);

   if FindAllWords then
   begin
     for t:=1 to NumWords do
         if Pos(SearchText[t],S)=0 then exit;
     result:=True;
   end
   else
   begin
     for t:=1 to NumWords do
         if Pos(SearchText[t],S)>0 then
         begin
           result:=True;
           exit;
         end;
   end;
 end;

 // Add AItem to search result tree...
 Procedure AddResult(AItem:TTreeNode);
 begin
   TreeSearch.Items.Add(nil,AItem.Text).Data:=AItem.Data;
 end;

 // Return true if search found in any of Lines...
 Function SearchInLines(Lines:TStrings):Boolean;
 var tt : Integer;
 begin
   result:=False;
   for tt:=0 to Lines.Count-1 do
       if FoundTextIn(Lines[tt]) then
       begin
         result:=True;
         break;
       end;
 end;

var tmpProg  : TProgressBar;
    tmpForms : TList;

 Procedure DoSearchTree(Tree:TTreeView; Offset:Integer);

   Function FoundTextInNode(Node:TTreeNode):Boolean;

     // Return true if search found in AMemo lines or text...
     Function SearchInMemo(AMemo:TTeeCustomMemo):Boolean;
     begin
       if AMemo.Lines.Count>0 then
          result:=SearchInLines(AMemo.Lines)
       else
          result:=FoundTextIn(AMemo.Text);
     end;

     // Return true if search found in AForm components
     Function SearchInForm(AForm:TCustomForm):Boolean;
     var t : Integer;
     begin
       result:=False;
       for t:=0 to AForm.ComponentCount-1 do
       if AForm.Components[t] is TTeeCustomMemo then
       begin
         result:=SearchInMemo(TTeeCustomMemo(AForm.Components[t]));
         if result then break;
       end;
     end;

   var tmpCodeFile  : String;
       tmpFileName  : String;
       tmpForm      : TForm;
       tmpFormClass : TFormClass;
   begin
     result:=False;

     if HasForm(Node) then
     begin
       // Avoid processing same form twice...
       tmpFormClass:=FormOf(Node).FormClass;

       if tmpForms.IndexOf(tmpFormClass)<>-1 then exit;

       tmpForms.Add(tmpFormClass);

       // First of all, search in tree node Text...
       result:=FoundTextIn(Node.Text);

       if not result then
       begin
         // Create form and search ...
         tmpForm:=tmpFormClass.Create(nil);
         try
           if tmpForm is TBaseForm then
              result:=SearchInMemo(TBaseForm(tmpForm).Memo1)
           {$IFNDEF CLX}
           {$IFNDEF NOUSE_BDE}
           else
           if tmpForm is TBaseDBChart then
              result:=SearchInMemo(TBaseDBChart(tmpForm).Memo1)
           {$ENDIF}
           {$ENDIF}
           else
              result:=SearchInForm(tmpForm);
         finally
  //           StrPCopy(St,tmpForm.ClassName);
  //           OutputDebugString(St);
           tmpForm.Free;
         end;

         if not result then
         begin
           // Load form source code and search...

           tmpCodeFile:=FormOf(Node).UnitName;

           if CBSearchSource.Checked and (tmpCodeFile<>'') then
           begin
             tmpFileName:=CodePath+FolderSeparator+tmpCodeFile+'.pas';
             if FileExists(tmpFileName) then
             begin
               tmpMemo.LoadFromFile(tmpFileName);
               result:=SearchInLines(tmpMemo);
             end;
           end;
         end;
       end;
     end;
   end;

  var t   : Integer;
      tmp,i : Integer;
  begin
    with Tree do
    for t:=0 to Items.Count-1 do
    begin
      try
      tmp:=Offset+Round(t*50/Items.Count);
      if tmpProg.Position<>tmp then tmpProg.Position:=tmp;
      except
        i:=t;
      end;

      try
      if FoundTextInNode(Items[t]) then AddResult(Items[t]);
      except
        i:=t;
      end;
    end;
  end;

  // Divide S string in words, using space as separator
  Procedure SplitWords(S:String);
  var i : Integer;
  begin
    NumWords:=0;

    Repeat
      i:=Pos(' ',S);

      if i>0 then
      begin
        Inc(NumWords);
        SearchText[NumWords]:=UpperCase(Copy(S,1,i-1));
        Delete(S,1,i);
      end;
    Until (i=0) or (S='');

    if S<>'' then
    begin
      Inc(NumWords);
      SearchText[NumWords]:=UpperCase(S);
    end;
  end;

var tmpSearchText : String;
begin
  Screen.Cursor:=crHourGlass;
  try
    TreeSearch.Items.BeginUpdate;
    try
      TreeSearch.Items.Clear;
      FreeAndNil(TheForm);

      tmpSearchText:=CBSearch.Text;

      if tmpSearchText<>'' then
      begin
        if CBSearch.Items.IndexOf(tmpSearchText)=-1 then
           CBSearch.Items.Add(tmpSearchText);

        tmpMemo:=TStringList.Create;
        try
          SplitWords(tmpSearchText);

          FindAllWords:=CBFindAll.Checked;

          tmpProg:=TProgressBar.Create(self);
          try
            tmpProg.Top:=3;
            tmpProg.Width:=PageControl1.Width;
            if tmpProg.Width>200 then tmpProg.Width:=200;
            tmpProg.Parent:=StatusBar1;
            tmpProg.Position:=0;

            tmpForms:=TList.Create;
            try
              //DoSearchTree(TreeView1,0);
              DoSearchTree(TreeView2,50);
            finally
              tmpForms.Free;
            end;
            tmpProg.Position:=100;

          finally
            tmpProg.Free;
          end;
        finally
          tmpMemo.Free;
        end;
      end;
    finally
      TreeSearch.Items.EndUpdate;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TTeeNewForm.CBSearchKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key=TeeKey_Return then DoSearch;
end;

procedure TTeeNewForm.CBSearchChange(Sender: TObject);
begin
  SearchButton.Enabled:=CBSearch.Text<>'';
end;

procedure TTeeNewForm.Panel1Resize(Sender: TObject);
begin
  SearchButton.Left:=Panel1.Width-29;
  CBSearch.Width:=Panel1.Width-40;
end;

procedure TTeeNewForm.SearchButtonClick(Sender: TObject);
begin
  DoSearch;
end;

{$IFNDEF CLX}
procedure TTeeNewForm.RichEditKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if (Key=VK_F3) or ((Key=Ord('F')) and (ssCtrl in Shift)) then
  begin
    if not Assigned(FindDialog) then
    begin
      FindDialog:=TFindDialog.Create(Self);
      FindDialog.OnFind:=FindDialogFind;
      FindDialog.Options:=FindDialog.Options+[frHideUpDown];
    end;

    with FindDialog do
    begin
      Position:=RichEditCode.ClientOrigin;
      FindDialog.Execute;
    end;
  end;
end;

type TRichEditAccess=class(TCustomRichEdit);

// From Delphi Help...
procedure TTeeNewForm.FindDialogFind(Sender: TObject);
var FoundAt, StartPos, ToEnd: Integer;
    tmpOptions : TSearchTypes;
begin
  with RichEditCode do
  begin
    StartPos:=SelStart;

    if SelLength<>0 then Inc(StartPos,SelLength);

    ToEnd:=Length(Text)-StartPos;

    tmpOptions:=[];

    if frMatchCase in FindDialog.Options then
       tmpOptions:=tmpOptions+[stMatchCase];
    if frWholeWord in FindDialog.Options then
       tmpOptions:=tmpOptions+[stWholeWord];

    FoundAt:=FindText(FindDialog.FindText,StartPos,ToEnd,tmpOptions);

    if FoundAt<>-1 then
    begin
      SelStart:=FoundAt;
      SelLength:=Length(FindDialog.FindText);
      SetFocus;
    end;
  end;
end;
{$ENDIF}

procedure TTeeNewForm.PopupMenu1Popup(Sender: TObject);
begin
  ShowAll1.Caption:='Show all ('+IntToStr(TheTree.Items.Count)+')';
end;

procedure TTeeNewForm.MemoSupportChange(Sender: TObject);
begin
  BSupport.Enabled:=MemoSupport.Text<>'';
end;

procedure SendEmail(Text,Subject:AnsiString);
{$IFNDEF LINUX}
var MapiMessage  : TMapiMessage;
    MError       : Cardinal;
    Recipients   : TMapiRecipDesc;
    s : AnsiString;
{$ENDIF}
begin
  {$IFNDEF LINUX}
  Screen.Cursor:=crHourGlass;
  try
    Subject:='[Tee'+TeeChartVersion+'New: '+Subject+']';

    with Recipients do
    begin
      ulReserved:=0;
      ulRecipClass:=MAPI_TO;
      lpszName:='TeeChart Support';

      s:='support@steema.com';

      lpszAddress:={$IFDEF D12}PAnsiChar{$ELSE}PChar{$ENDIF}(s);

      ulEIDSize:=0;
      lpEntryID:=nil;
    end;

    with MapiMessage do
    begin
      ulReserved := 0;

      lpszSubject := {$IFDEF D12}PAnsiChar{$ELSE}PChar{$ENDIF}(Subject);
      lpszNoteText := {$IFDEF D12}PAnsiChar{$ELSE}PChar{$ENDIF}(Text);

      lpszMessageType := nil;
      lpszDateReceived := nil;
      lpszConversationID := nil;
      flFlags := 0;
      lpOriginator := nil;
      nRecipCount := 1;
      lpRecips := @Recipients;
      nFileCount := 0;
      lpFiles := nil;
    end;

    MError:=MapiSendMail(0, {$IFDEF CLX}0{$ELSE}Application.Handle{$ENDIF},
      MapiMessage,
      MAPI_LOGON_UI or MAPI_NEW_SESSION, 0);

    if MError<>0 then
       raise Exception.CreateFmt('Error sending email',[MError]);
  finally
    Screen.Cursor:=crDefault;
  end;

  ShowMessage('Email to Steema Support is now at your Outbox.');
  {$ENDIF}
end;

{$IFNDEF LINUX}
// Routines to obtain file version, cpu, windows version, etc...
Function ExtractVersionInfo:String;
var ExeName   : String;
    Len       : DWord;
    I         : DWord;
    InfoSize  : Integer;
    InfoBuf   : PChar;
    Value     : PChar;
    Charset   : DWORD;
    Language  : WORD;
begin
  ExeName:=Application.ExeName;
  InfoSize:=GetFileVersionInfoSize(PChar(ExeName), I);

  if InfoSize > 0 then
  begin
    InfoBuf := AllocMem(InfoSize);
    GetFileVersionInfo(PChar(ExeName), 0, InfoSize, InfoBuf);

    if VerQueryValue(InfoBuf, '\VarFileInfo\Translation',Pointer(Value), Len) then
    begin
       Language := PWORD(Value)^;
       CharSet  := PWORD(Value + 2)^;
    end
    else
    begin
      Language := 0;
      CharSet  := 0;
    end;

    result:=Format('%-16s : ''%s''', ['Language',IntToHex(Language, 4)])+#13#10;
    result:=result+Format('%-16s : ''%s''', ['Charset',  IntToHex(Charset,4)])+#13#10;

    if VerQueryValue(InfoBuf,PChar('StringFileInfo\' +
                     IntToHex(Language, 4)+IntToHex(Charset, 4) + '\'+'FileVersion'),
                     Pointer(Value),Len) then
          result:=result+Format('%-16s : ''%s''', ['TeeChart Version', Value]);

    FreeMem(InfoBuf, InfoSize);
  end
  else result:='';
end;

function CPUType: string;
begin
  CPUType := '';

  with TRegistry.Create do
  try
    RootKey:=HKEY_LOCAL_MACHINE;
    if OpenKeyReadOnly('\Hardware\Description\System\CentralProcessor\0') then
       CPUType:=ReadString('Identifier');
  finally
    Free;
  end;
end;

function WindowsVersion:String;
var WinVer : TOSVersionInfo;
begin
  result:='';
  WinVer.dwOSVersionInfoSize:=SizeOf(WinVer);
  if (GetVersionEx(WinVer)=Boolean(0)) then Exit;

  with WinVer do
  begin
    result:=Format('Windows v%d.%d (%d)', [dwMajorVersion, dwMinorVersion, dwPlatformId]);

    case dwPlatformId of
    VER_PLATFORM_WIN32_WINDOWS:
         case dwMajorVersion of
           3: result:=Format('Win v%d.%d', [dwMajorVersion, dwMinorVersion]);
           4: case dwMinorVersion of
                0:  result:='Windows 95';
               10:  result:='Windows 98';
               90:  result:='Windows ME';
              end;
         end;

    VER_PLATFORM_WIN32_NT:
         begin
           case dwMajorVersion of
             3,4: result:=Format('Windows NT v%d.%d', [dwMajorVersion, dwMinorVersion]);
               5: case dwMinorVersion of
                    0:  result := 'Windows 2000';
                    1:  result := 'Windows XP'
                  end;
           end;
         end;
    end;
  end;

  result:=result+' '+StrPas({$IFDEF D12}PWideChar{$ENDIF}(@WinVer.szCSDVersion));
end;
{$ENDIF}

procedure TTeeNewForm.BSupportClick(Sender: TObject);
begin
  TeeGotoURL({$IFDEF CLX}nil{$ELSE}0{$ENDIF},
     'http://www.teechart.net/support/search.php?keywords='+MemoSupport.Text);

//  SendEmail(MemoSupport.Text,LabelTopic.Caption)
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

function TTeeNewForm.CurrentTeePanel:TCustomTeePanel;
var t : Integer;
begin
  with TheForm do
  for t:=0 to ControlCount-1 do
      if Controls[t] is TCustomTeePanel then
      begin
        result:=Controls[t] as TCustomTeePanel;
        exit;
      end;

  result:=nil;
end;

procedure TTeeNewForm.Exportall1Click(Sender: TObject);
var tmp,
    tmpName : String;
    t       : Integer;
    tmpForm : TForm;
    LBFormat : TListBox;
    tmpFormat,
    tmpSelec : TTeeExportFormat;
    tmpPanel : TCustomTeePanel;
begin
  tmpSelec:=nil;

  tmpForm:=TForm.Create(Self);

  with tmpForm do
  try
    Position:=poScreenCenter;
    LBFormat:=TListBox.Create(tmpForm);
    LBFormat.Align:=alClient;
    LBFormat.Parent:=tmpForm;

    for t:=0 to TeeExportFormats.Count-1 do
    begin
      tmpFormat:=TeeExportFormats[t].Create;
      LBFormat.Items.AddObject(ReplaceChar(tmpFormat.Description,'&'),tmpFormat);
    end;

    ShowModal;

    if LBFormat.ItemIndex<>-1 then
       tmpSelec:=TTeeExportFormat(LBFormat.Items.Objects[LBFormat.ItemIndex]);
  finally
    Free;
  end;

  if Assigned(tmpSelec) and SelectDirectory('Select folder','',tmp) then
  begin
    tmp:=tmp+'\TeeNew';
    CreateDir(tmp);

    With TheTree do
    for t:=0 to Items.Count-1 do
    begin
      Selected:=Items[t];
      Application.ProcessMessages;

      tmpPanel:=CurrentTeePanel;

      if Assigned(tmpPanel) then
      begin
        tmpName:=tmp+'\'+TheForm.Name;

        if ExtractFileExt(tmpName)='' then
           tmpName:=tmpName+'.'+tmpSelec.FileExtension;

        tmpSelec.Panel:=tmpPanel;
        tmpSelec.SaveToFile(tmpName);

        //Src.LoadFromFile(tmpName);
        //SmoothStrecth(Src,Dst);
        //Dst.SaveToFile(tmp+'\'+TheForm.Name+'.bmp');
      end;
    end;
  end;
end;

{$IFDEF STEEMAVERSION}
procedure TTeeNewForm.AppException(Sender:TObject; E:Exception);
begin
  if TExceptionDialog.ValidException(E) then
     TExceptionDialog.Show(Self,E,'vcl_teenew');
end;
{$ENDIF}

procedure TTeeNewForm.ChangeCanvas(Style:TNewCanvasStyle);
begin
  CanvasGDI1.Checked:= Style = ncGDI;
  CanvasOpenGL1.Checked:= Style = ncOpenGL;
  CanvasAntiAlias1.Checked:= Style = ncAntiAlias;
  CanvasGDI2.Checked:= Style = ncGDIPlus;

  CBoxGDIPlus.Checked:=CanvasGDI2.Checked;
  Application.ProcessMessages;

  TeeNewCanvas:=Style;

  FreeAndNil(TheForm);
  ShowForm(TheTree);
end;

procedure TTeeNewForm.CanvasGDI1Click(Sender: TObject);
begin
  ChangeCanvas(ncGDI);
end;

procedure TTeeNewForm.CanvasOpenGL1Click(Sender: TObject);
begin
  ChangeCanvas(ncOpenGL);
end;

procedure TTeeNewForm.AddFormCode(const st:TStrings);
var sCode : TStrings;
    tmpFileName : String;
    t           : Integer;
    tmpForm     : TFileStream;
    tmpOutput   : TMemoryStream;
begin
  CheckRegistry;

  if (CodePath<>'') and (CodeFile<>'') then
  begin
    // Source code *.pas file

    sCode:=TStringList.Create;
    try
      sCode.LoadFromFile(CodePath+FolderSeparator+CodeFile+'.pas');

      {$IFNDEF CLX}
      //HighLight(sCode,clNavy);
      {$ENDIF}

      st.Add('<br><br><b>'+CodeFile+'.pas</b><br><br>');
      st.Add('<font name="Courier">');
      st.Add('<pre>');
      st.AddStrings(sCode);
      st.Add('</pre>');
      st.Add('</font>');
    finally
      sCode.Free;
    end;

    // DFM / XFM form file

    st.Add('<br><b>'+CodeFile+'.dfm</b><br><br>');

    tmpFileName:=CodePath+FolderSeparator+CodeFile;

    {$IFDEF CLX}
    tmpFileName:=tmpFileName+'.xfm';
    {$ELSE}
    tmpFileName:=tmpFileName+'.dfm';
    {$ENDIF}

    tmpForm:=TFileStream.Create(tmpFileName,fmOpenRead);
    try
      tmpOutput:=TMemoryStream.Create;
      try
        tmpForm.Position:=0;
        ObjectResourceToText(tmpForm,tmpOutput);

        tmpOutput.Position:=0;

        sCode:=TStringList.Create;
        try
          sCode.LoadFromStream(tmpOutput);

          st.Add('<font name="Courier">');
          st.Add('<pre>');

          for t:=0 to sCode.Count-1 do
              st.Add(sCode[t]);

          st.Add('</pre>');
          st.Add('</font>');
        finally
          sCode.Free;
        end;
      finally
        tmpOutput.Free;
      end;
    finally
      tmpForm.Free;
    end;
  end;
end;

procedure TTeeNewForm.ExporttoHTML1Click(Sender: TObject);
var tmpSelec : TTeeExportFormat;
    tmpI,
    tmp : String;
    st,
    stI : TStrings;

  procedure Process(ATree:TTreeView);
  var
    tmpName : String;
    t,
    tt      : Integer;
    HasMemo : TMemo;
    HasChart : Boolean;
  begin
    With ATree do
    for t:=0 to Items.Count-1 do
    begin
      Selected:=Items[t];

      StatusBar1.SimpleText:=IntToStr(t)+'/'+IntToStr(Items.Count)+' '+Selected.Text;

      Application.ProcessMessages;

      if HasForm(Selected) then
      begin
        HasMemo:=nil;
        HasChart:=False;

        with TheForm do
        for tt:=0 to ControlCount-1 do
        begin
          if (not HasChart) and (Controls[tt] is TCustomTeePanel) then
          begin
            tmpName:=tmpI+'\'+TheForm.Name;
            if ExtractFileExt(tmpName)='' then
               tmpName:=tmpName+'.'+tmpSelec.FileExtension;

            tmpSelec.Panel:=Controls[tt] as TCustomTeePanel;

            if tmpSelec.Panel.Color=clBtnFace then
            begin
              if (not (tmpSelec.Panel is TCustomTeePanelExtended)) or
                 (not TCustomTeePanelExtended(tmpSelec.Panel).Gradient.Visible) then
              begin
                //tmpSelec.Panel.Color:=clWhite;
                tmpSelec.Panel.BevelInner:=bvNone;
                tmpSelec.Panel.BevelOuter:=bvNone;
              end;
            end;

            tmpSelec.SaveToFile(tmpName);

            HasChart:=True;
          end
          else
          if Controls[tt] is TMemo then
             HasMemo:=TMemo(Controls[tt]);

          if HasChart and Assigned(HasMemo) then
             break;
        end;

        if Assigned(HasMemo) then
        begin
          st.Clear;
          st.Add('<html><body style="font-family: Verdana">');

          with HasMemo.Lines do
          for tt:=0 to Count-1 do
              st.Add(Strings[tt]+'<br>');

          if HasChart then
             st.Add('<br><img src="images/'+TheForm.Name+'.'+tmpSelec.FileExtension+'">');

          AddFormCode(st);

          st.Add('</body></html>');

          st.SaveToFile(tmp+'\'+TheForm.Name+'.htm');

          stI.Add('<a href="'+TheForm.Name+'.htm" target="main">'+Selected.Text+'</a><br>');
        end;
      end;
    end;
  end;

  procedure ExportAllForms;
  var tmpName : String;
  begin
    tmp:=tmp+'\TeeNew';
    tmpI:=tmp+'\images';

    CreateDir(tmp);
    CreateDir(tmpI);

    st:=TStringList.Create;
    stI:=TStringList.Create;
    stI.Add('<html><head><title>'+Caption+'</title></head><body>');

    {PageControl1.ActivePage:=TabSheet1;
    Process(TreeView1);}

    PageControl1.ActivePage:=TabSheet2;
    Process(TreeView2);

    st.Free;

    stI.SaveToFile(tmp+'\contents.htm');
    stI.Free;

    st:=TStringList.Create;
    try
      st.Add('<html><head><title>'+Caption+'</title></head>');
      st.Add('<frameset cols="15%,85%">');
      st.Add(' <frame name="contents" target="main" src="contents.htm">');
      st.Add(' <frame name="main" src="welcome.htm">');
      st.Add('</frameset>');
      st.Add('<noframes><body>');
      st.Add('<p>This page uses frames, but your browser does not support them.</p>');
      st.Add('</body></noframes>');
      st.Add('</frameset>');
      st.Add('</html>');

      tmpName:=tmp+'\index.htm';

      st.SaveToFile(tmpName);

      st.Clear;
      st.Add('<html><body>Welcome to TeeChart '+TeeChartVersion+'</body><html>');
      st.SaveToFile(tmp+'\welcome.htm');
    finally
      st.Free;
    end;

    TeeGotoURL(Handle, 'file:///'+tmpName);
  end;

begin
  tmpSelec:={$IFNDEF TEELITE}TPNGExportFormat.Create{$ELSE}TBMPExportFormat.Create{$ENDIF};

  if Assigned(tmpSelec) and SelectDirectory('Select folder to export html','',tmp) then
  begin
    Screen.Cursor:=crHourGlass;
    try
      ExportAllForms;
    finally
      Screen.Cursor:=crDefault;
    end;
  end;
end;

procedure TTeeNewForm.FullScreenChart1Click(Sender: TObject);
var tmp : TCustomTeePanel;
begin
  tmp:=CurrentTeePanel;

  if Assigned(tmp) and (tmp is TCustomChart) then
  begin
    {$IFNDEF TEELITE}
    FullScreen:=TFullScreenTool.Create(Self);
    FullScreen.ParentChart:=TCustomChart(tmp);
    FullScreen.Active:=True;
    {$ENDIF}
  end;
end;

procedure TTeeNewForm.CanvasAntiAlias1Click(Sender: TObject);
begin
  ChangeCanvas(ncAntiAlias);
end;

procedure TTeeNewForm.VerifyallMemos1Click(Sender: TObject);

  function CurrentMemo:TMemo;
  var t : Integer;
  begin
    with TheForm do
    for t:=0 to ControlCount-1 do
        if Controls[t] is TMemo then
        begin
          result:=Controls[t] as TMemo;
          exit;
        end;

    result:=nil;
  end;

  function NodePathText(Node:TTreeNode):String;
  begin
    result:=Node.Text;
    while Assigned(Node.Parent) do
    begin
      Node:=Node.Parent;
      result:=Node.Text+'.'+result;
    end;
  end;

var t : Integer;
    st : TStringList;
    tmpMemo : TMemo;
begin
  st:=TStringList.Create;
  try
    With TheTree do
    for t:=0 to Items.Count-1 do
    begin
      Selected:=Items[t];
      Application.ProcessMessages;

      tmpMemo:=CurrentMemo;
      if Assigned(tmpMemo) and (tmpMemo.Text='') then
         st.Add(NodePathText(Selected));
    end;

    TeeEditStrings(Self,st,True);
  finally
    st.Free;
  end;
end;

procedure TTeeNewForm.CanvasGDI2Click(Sender: TObject);
begin
  ChangeCanvas(ncGDIPlus);
end;

procedure TTeeNewForm.Font1Click(Sender: TObject);
begin
  {$IFDEF D12}
  EditTeeFont(Self,Application.DefaultFont);
  {$ELSE}
  EditTeeFont(Self,Font);
  {$ENDIF}
end;

procedure TTeeNewForm.CBoxGDIPlusClick(Sender: TObject);
begin
  if CBoxGDIPlus.Checked then
    ChangeCanvas(ncGDIPlus)
  else
    ChangeCanvas(ncGDI);
end;

procedure TTeeNewForm.Draw3D1MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;

  {$IFNDEF CLX}
  if y<2 then
   begin
    if x<4 then
      Perform(wm_SysCommand, sc_UpLeftsize, 0)
    else if x>(Panel1.ClientWidth-4) then
      Perform(wm_SysCommand, sc_UpRightsize, 0)
    else
      Perform(wm_SysCommand, sc_UpSize, 0)
   end
  else
   Perform(wm_SysCommand, sc_DragMove, 0)
  {$ENDIF}
end;

procedure TTeeNewForm.SpeedButton1Click(Sender: TObject);
begin
  TeeShowAboutBoxDemo;
end;

Procedure TTeeNewForm.TeeShowAboutBoxDemo(Const ACaption:String=''; Const AVersion:String='';
                          Const AExtra:String='');
var tmp : TTeeAboutForm;
begin
  tmp:=TTeeAboutForm.Create(nil);

  with tmp do
  try
    if ACaption<>'' then
       Caption:=ACaption;

    if AVersion<>'' then
       LabelVersion.Caption:=AVersion;

    if AExtra<>'' then
       LabelExtra.Caption:=AExtra;

    {$IFDEF TEEBETA}
    LabelEval.Caption:=LabelEval.Caption+' (BETA)'; // Do not localize
    {$ENDIF}

    if TeeIsTrial then
       LabelEval.Caption:=LabelEval.Caption+' TRIAL'; // Do not localize

    TeeTranslateControl(tmp);
    Labelwww.Width:=313;

    ShowModal;
    
  finally
    Free;
  end;
end;

procedure TTeeNewForm.SpeedButton2Click(Sender: TObject);
begin
  Close;
end;

procedure TTeeNewForm.Draw3D2MouseDown(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ReleaseCapture;

  {$IFNDEF CLX}
  if y<2 then
   begin
    if x<4 then
      Perform(wm_SysCommand, sc_UpLeftsize, 0)
    else if x>(Panel1.ClientWidth-4) then
      Perform(wm_SysCommand, sc_UpRightsize, 0)
    else
      Perform(wm_SysCommand, sc_UpSize, 0)
   end
  else
   Perform(wm_SysCommand, sc_DragMove, 0)
  {$ENDIF}
end;

procedure TTeeNewForm.PageExampleDrawTab(Control: TCustomTabControl;
  TabIndex: Integer; const Rect: TRect; Active: Boolean);
var
  AText: string;
  APoint: TPoint;
begin
  with (Control as TPageControl).Canvas do
  begin
    Brush.Color := StatusBar1.Brush.Color;

    FillRect(Rect);

    AText := TPageControl(Control).Pages[TabIndex].Caption;

    with Control.Canvas do
    begin
      APoint.x := (Rect.Right - Rect.Left) div 2 - TextWidth(AText) div 2;
      APoint.y := (Rect.Bottom - Rect.Top) div 2 - TextHeight(AText) div 2;

      //Font.Color:=clWindow;

      TextRect(Rect, Rect.Left + APoint.x, Rect.Top + APoint.y, AText);
    end;
  end;
end;

procedure TTeeNewForm.Button1Click(Sender: TObject);
begin

end;

{$IFNDEF CLX}
//no border BUT resizable
procedure TTeeNewForm.CreateParams(var Params: TCreateParams) ;
begin
  inherited;

  if CustomBorder then
  begin
    Params.ExStyle := Params.ExStyle or WS_EX_STATICEDGE;
    Params.Style := Params.Style or WS_SIZEBOX;
  end;
end;
{$ENDIF}

procedure TTeeNewForm.spMinimizeClick(Sender: TObject);
begin
  Application.Minimize;
end;

procedure TTeeNewForm.FormResize(Sender: TObject);
{$IFNDEF CLX}
var
  rgn: HRGN;
{$ENDIF}
begin
  {$IFNDEF CLX}

  if CustomBorder then
  begin
    rgn := CreateRoundRectRgn(0,// x-coordinate of the region's upper-left corner
      0,            // y-coordinate of the region's upper-left corner
      ClientWidth+4,  // x-coordinate of the region's lower-right corner
      ClientHeight+4, // y-coordinate of the region's lower-right corner
      30,           // height of ellipse for rounded corners
      30);          // width of ellipse for rounded corners

    SetWindowRgn(Handle, rgn, True);
  end;
  {$ENDIF}
end;

function getHeightOfTaskBar : integer;
var hTaskBar:HWND;
    rect : TRect;
begin
     hTaskbar := FindWindow('Shell_TrayWnd', Nil );
     if hTaskBar<>0 then
        GetWindowRect(hTaskBar, rect);

     Result:=rect.bottom - rect.top;
end;

procedure TTeeNewForm.spMaximizeClick(Sender: TObject);
begin
    if WindowState=wsNormal then
       begin
        WindowState:=wsMaximized;
        SetBounds(0,0,screen.Width,screen.Height-getHeightOfTaskBar);
        sbNormal.Visible := true;
        spMaximize.Visible := false;
       end
       else
       begin
         WindowState:=wsNormal;
        sbNormal.Visible := false;
        spMaximize.Visible := true;
       end;
end;

procedure TTeeNewForm.sbNormalClick(Sender: TObject);
begin
  WindowState := wsNormal;
  sbNormal.Visible := false;
  spMaximize.Visible := true;
end;

procedure TTeeNewForm.sbCloseClick(Sender: TObject);
begin
  Close;
end;

function IsWindows64Bit: Boolean;
type
  TIsWow64Process = function( // Type of IsWow64Process API fn
    Handle: THandle;
    var Res: BOOL
  ): BOOL; stdcall;
var
  IsWow64Result: BOOL;              // result from IsWow64Process
  IsWow64Process: TIsWow64Process;  // IsWow64Process fn reference
begin
  // Try to load required function from kernel32
  IsWow64Process := GetProcAddress(
    GetModuleHandle('kernel32'), 'IsWow64Process'
  );
  if Assigned(IsWow64Process) then
  begin
    // Function is implemented: call it
    if not IsWow64Process(GetCurrentProcess, IsWow64Result) then
      raise Exception.Create('Bad process handle');
    // Return result of function
    Result := IsWow64Result;
  end
  else
    // Function not implemented: can't be running on Wow64
    Result := False;
end;

end.
