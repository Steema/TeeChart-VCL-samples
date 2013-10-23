{******************************************}
{   Design-Time Options Editor Dialog      }
{ Copyright (c) 2003-2013 by David Berneda }
{        All Rights Reserved               }
{******************************************}
unit TeeDesignOptions;
{$I TeeDefs.inc}

interface

uses
  SysUtils, Classes,

  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}

  TeCanvas,

  {$IFNDEF TEELITE}
  TeeTranslate,
  TeeTranslateEditor,
  {$ENDIF}
  TeeProcs, TeeGalleryPanel, TeeEditCha, TeeFilters;

type
  TOptionsForm = class(TForm)
    PageControl1: TPageControl;
    TabLanguage: TTabSheet;
    TabGallery: TTabSheet;
    TabEditor: TTabSheet;
    TabNewChart: TTabSheet;
    Label1: TLabel;
    Label2: TLabel;
    Button1: TButton;
    CBSmooth: TCheckBox;
    CBSize: TCheckBox;
    CBPosition: TCheckBox;
    CBTree: TCheckBox;
    Button4: TButton;
    Panel1: TPanel;
    Panel2: TPanel;
    Button2: TButton;
    Button3: TButton;
    RGGalleryMode: TRadioGroup;
    Panel3: TPanel;
    LBTheme: TListBox;
    Panel4: TPanel;
    Panel5: TPanel;
    ImageFiltered1: TImageFiltered;
    CBGallerySize: TCheckBox;
    BEditorFont: TButton;
    CBDefaultFont: TCheckBox;
    Panel6: TPanel;
    CBPalette: TComboFlat;
    Panel7: TPanel;
    LabelTheme: TLabel;
    Splitter1: TSplitter;
    Label3: TLabel;
    CBGalleryRender: TComboFlat;
    Label4: TLabel;
    CBNewRender: TComboFlat;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure LBThemeClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure CBPaletteChange(Sender: TObject);
    procedure BEditorFontClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBDefaultFontClick(Sender: TObject);
    procedure FormResize(Sender: TObject);
  private
    { Private declarations }

    FEditorFont  : TFont;
    IChangedFont : Boolean;

    {$IFNDEF TEELITE}
    OldLang : Integer;
    procedure ChangeLangLabel;
    {$ENDIF}

    procedure ResizeImage;
  public
    { Public declarations }
    ScaledChart : Boolean;

    procedure Save;
  end;

const
  TeeNewChartDefaultTheme=9;
  TeeNewChartDefaultPalette=13;

// Index of Theme to use as default for new created Charts at design-time
var
  TeeNewChartTheme   : Integer=TeeNewChartDefaultTheme;
  TeeNewChartPalette : Integer=TeeNewChartDefaultPalette;

implementation

uses {$IFNDEF TEELITE}
     {$IFNDEF TEENOTHEMES}
     TeeThemeEditor, TeeThemes,
     {$ENDIF}
     {$ENDIF}
     {$IFDEF LINUX}
     IniFiles,
     {$ELSE}
     Registry,
     {$ENDIF}
     TeeConst, Chart, Series, TeeGally, TeeBrushDlg;

{$IFNDEF CLX}
{$IFNDEF LCL}
{$R *.DFM}
{$ELSE}
{$R *.lfm}
{$ENDIF}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TOptionsForm.Button1Click(Sender: TObject);
begin
  {$IFNDEF TEELITE}
  if TeeAskLanguage then ChangeLangLabel;
  {$ENDIF}
end;

const
  TeeMsg_GDIPlus='TGDIPlusCanvas';
  DefaultGalleryRender=1;

procedure TOptionsForm.FormCreate(Sender: TObject);
var tmpRender : String;
begin
  ScaledChart:=True;

  PageControl1.HotTrack:=True;
  
  {$IFNDEF TEELITE}
  OldLang:=TeeLanguageRegistry;
  ChangeLangLabel;
  {$ENDIF}

  CBSmooth.Checked:=TChartGalleryPanel.DefaultSmooth;
  RGGalleryMode.ItemIndex:=TChartGalleryPanel.DefaultMode;
  CBPosition.Checked:=TeeReadBoolOption(TeeMsg_RememberPosition,True);
  CBSize.Checked:=TeeReadBoolOption(TeeMsg_RememberSize,True);
  CBTree.Checked:=TeeReadBoolOption(TeeMsg_TreeMode,True);
  CBGallerySize.Checked:=TeeReadBoolOption(TeeMsg_RememberGallerySize,True);
  CBGalleryRender.ItemIndex:=TeeReadIntegerOption(TeeMsg_GalleryRender,DefaultGalleryRender);

  tmpRender:=TeeReadStringOption('DefaultCanvas',TeeMsg_GDIPlus);

  if tmpRender=TeeMsg_GDIPlus then
     CBNewRender.ItemIndex:=1
  else
     CBNewRender.ItemIndex:=0;

  {$IFNDEF TEELITE}
  {$IFNDEF TEENOTHEMES}
  AddChartThemes(LBTheme.Items);
  LBTheme.ItemIndex:=TeeReadIntegerOption(TeeMsg_DefaultTheme,TeeNewChartDefaultTheme);
  TeeNewChartTheme:=LBTheme.ItemIndex;
  {$ENDIF}
  {$ENDIF}

  {$IFDEF LINUX}
  Button4.Visible:=False;
  {$ENDIF}

  {$IFDEF TEELITE}
  TabLanguage.TabVisible:=False;
  TabNewChart.TabVisible:=False;
  PageControl1.ActivePage:=TabGallery;
  {$ELSE}
  PageControl1.ActivePage:=TabLanguage;
  {$ENDIF}

  CBPalette.Clear;
  TColorPalettes.AddTo(CBPalette.Items,True);

  TeeNewChartPalette:=TeeReadIntegerOption(TeeMsg_DefaultPalette,TeeNewChartDefaultPalette);
  CBPalette.ItemIndex:=TeeNewChartPalette+1;

  FEditorFont:=TFont.Create;

  CBDefaultFont.Checked:=not TChartEditForm.ReadDefaultFont(FEditorFont);
  CBDefaultFont.Enabled:=not CBDefaultFont.Checked;

  BEditorFont.Visible:=True;

  TeeTranslateControl(Self);
end;

{$IFNDEF TEELITE}
procedure TOptionsForm.ChangeLangLabel;
begin
  with TAskLanguage.Create(nil) do
  try
    Self.Label2.Caption:=LBLangs.Items[LBLangs.ItemIndex];
  finally
    Free;
  end;
end;
{$ENDIF}

procedure TOptionsForm.Button3Click(Sender: TObject);
begin
  {$IFNDEF TEELITE}
  if OldLang<>TeeLanguageRegistry then
     TeeLanguageSaveRegistry(OldLang);
  {$ENDIF}

  ModalResult:=mrCancel;
end;

procedure TOptionsForm.Save;

  procedure SaveDefaultFont;
  begin
    if IChangedFont then
       TeeSaveStringOption(TeeMsg_DefaultEditorFont,
         FEditorFont.Name+TeeFieldsSeparator+
         TeeStr(FEditorFont.Size)+TeeFieldsSeparator+
         TeeStr(FEditorFont.Color)
        );
  end;

begin
  if CBSmooth.Checked<>TChartGalleryPanel.DefaultSmooth then
     TChartGalleryPanel.SaveSmooth(CBSmooth.Checked);

  if RGGalleryMode.ItemIndex<>TChartGalleryPanel.DefaultMode then
     TChartGalleryPanel.SaveMode(RGGalleryMode.ItemIndex);

  if CBPosition.Checked<>TeeReadBoolOption(TeeMsg_RememberPosition,True) then
     TeeSaveBoolOption(TeeMsg_RememberPosition,CBPosition.Checked);

  if CBSize.Checked<>TeeReadBoolOption(TeeMsg_RememberSize,True) then
     TeeSaveBoolOption(TeeMsg_RememberSize,CBSize.Checked);

  if CBTree.Checked<>TeeReadBoolOption(TeeMsg_TreeMode,True) then
     TeeSaveBoolOption(TeeMsg_TreeMode,CBTree.Checked);

  if CBGallerySize.Checked<>TeeReadBoolOption(TeeMsg_RememberGallerySize,True) then
     TeeSaveBoolOption(TeeMsg_RememberGallerySize,CBGallerySize.Checked);

  if CBGalleryRender.ItemIndex<>TeeReadIntegerOption(TeeMsg_GalleryRender,DefaultGalleryRender) then
     TeeSaveIntegerOption(TeeMsg_GalleryRender,CBGalleryRender.ItemIndex);

  if CBNewRender.ItemIndex=0 then
     TeeSaveStringOption('DefaultCanvas','')
  else
     TeeSaveStringOption('DefaultCanvas',TeeMsg_GDIPlus);

  {$IFNDEF TEELITE}
  {$IFNDEF TEENOTHEMES}
  if LBTheme.ItemIndex<>TeeReadIntegerOption(TeeMsg_DefaultTheme,TeeNewChartDefaultTheme) then
  begin
    TeeNewChartTheme:=LBTheme.ItemIndex;
    TeeSaveIntegerOption(TeeMsg_DefaultTheme,TeeNewChartTheme);
  end;
  {$ENDIF}
  {$ENDIF}

  if CBPalette.ItemIndex-1 <> TeeReadIntegerOption(TeeMsg_DefaultPalette,TeeNewChartDefaultPalette) then
  begin
    TeeNewChartPalette:=CBPalette.ItemIndex-1;
    TeeSaveIntegerOption(TeeMsg_DefaultPalette,TeeNewChartPalette);
  end;

  SaveDefaultFont;
end;

procedure TOptionsForm.Button2Click(Sender: TObject);
begin
  Save;
  ModalResult:=mrOk;
end;

procedure TOptionsForm.Button4Click(Sender: TObject);
begin
  {$IFNDEF LINUX}
  with TRegistry.Create do
  try
    if OpenKey(TeeMsg_EditorKey,True) then
    begin
      DeleteValue('Left'); // Do not localize
      DeleteValue('Top'); // Do not localize
      DeleteValue('Width'); // Do not localize
      DeleteValue('Height'); // Do not localize
    end;
  finally
    Free;
  end;
  {$ENDIF}
end;

procedure TOptionsForm.LBThemeClick(Sender: TObject);
{$IFNDEF TEELITE}
{$IFNDEF TEENOTHEMES}
var tmp       : TChart;
    tmpTheme  : TChartThemeClass;
    tmpBitmap : TBitmap;
{$ENDIF}
{$ENDIF}
begin
  {$IFNDEF TEELITE}
  {$IFNDEF TEENOTHEMES}
  tmp:=TChart.Create(nil);
  try
    tmp.AddSeries(TBarSeries).FillSampleValues(7);
    tmp[0].ColorEachPoint:=True;

    if LBTheme.ItemIndex<ChartThemes.Count then
    begin
      tmpTheme:=TChartThemeClass(ChartThemes[LBTheme.ItemIndex]);
      ApplyChartTheme(tmpTheme,tmp,CBPalette.ItemIndex-1);
    end
    else
       TThemesList.Apply(tmp,TThemesList.ThemesPath+'\'+LBTheme.Items[LBTheme.ItemIndex]+'.'+TeeMsg_TeeExtension);

    if ScaledChart then
    begin
      ResizeImage;
      tmpBitmap:=tmp.TeeCreateBitmap;
    end
    else
      tmpBitmap:=tmp.TeeCreateBitmap(tmp.Color,ImageFiltered1.ClientRect);

    ImageFiltered1.Filters[0].Enabled:=ScaledChart;

    try
      ImageFiltered1.Picture.Graphic:=tmpBitmap;
    finally
      tmpBitmap.Free;
    end;
  finally
    tmp.Free;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TOptionsForm.PageControl1Change(Sender: TObject);
begin
  if PageControl1.ActivePage=TabNewChart then
     LBThemeClick(Self);
end;

procedure TOptionsForm.CBPaletteChange(Sender: TObject);
begin
  LBThemeClick(Self);
end;

procedure TOptionsForm.BEditorFontClick(Sender: TObject);
begin
  if EditTeeFont(Self,FEditorFont) then
  begin
    IChangedFont:=True;

    CBDefaultFont.Checked:=False;
    CBDefaultFont.Enabled:=True;
  end;
end;

procedure TOptionsForm.FormDestroy(Sender: TObject);
begin
  FEditorFont.Free;
end;

procedure TOptionsForm.CBDefaultFontClick(Sender: TObject);
begin
  if CBDefaultFont.Checked then
  begin
    CBDefaultFont.Enabled:=False;
    TeeSaveStringOption(TeeMsg_DefaultEditorFont,'');
  end;
end;

procedure TOptionsForm.ResizeImage;
begin
  with ImageFiltered1.Filters[0] as TResizeFilter do
  begin
    Width:=ImageFiltered1.Width;
    Height:=ImageFiltered1.Height;
  end;
end;

procedure TOptionsForm.FormResize(Sender: TObject);
begin
  ResizeImage;
  ImageFiltered1.Filters.Changed:=True;
end;

end.
