{*********************************************}
{  TeeChart Wizard                            }
{  Copyright (c) 1995-2020 by Steema Software }
{  All Rights Reserved                        }
{*********************************************}
unit TeeExpForm;
{$I TeeDefs.inc}

interface

{$IFNDEF D6}
{$UNDEF TEEENTERPRISE}  { Less than Delphi 6: No ADO ! }
{$ENDIF}

{$IFDEF KYLIXOPEN}
{$DEFINE NOUSE_BDE} // No Database in Kylix Open Edition
{$ENDIF}

{$IFDEF NOUSE_BDE}
{$UNDEF TEEENTERPRISE}  { No ADO in Delphi or BCB Standard versions! }
{$ENDIF}

{$IFDEF D6}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN UNIT_PLATFORM OFF}
{$ENDIF}

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  FileCtrl,
  {$IFNDEF NOUSE_BDE}
  {$IFNDEF TEELITE}
  DBCtrls,
  {$ENDIF}
  DBTables,
  {$IFDEF CLX}
  QDBCtrls,
  {$ENDIF}
  {$ENDIF}
  {$ENDIF}
  TeEngine, Chart,
  {$IFNDEF NOUSE_BDE}
  DBChart, DB,
  {$IFDEF TEEENTERPRISE}
  ADODB, ADOInt,  { 5.01 }
  {$ENDIF}
  {$ENDIF}
  TeeGalleryPanel, TeeProcs, TeeConst, TeeSelectList, TeCanvas, TeeEditCha;

type
  TTeeDlgWizard = class(TForm)
    PageControl: TPageControl;
    TabStyle: TTabSheet;
    TableName: TTabSheet;
    Label3: TLabel;
    Buttons: TTabSheet;
    Label2: TLabel;
    TabSheet1: TTabSheet;
    Label4: TLabel;
    TabSheet2: TTabSheet;
    Panel1: TPanel;
    Panel2: TPanel;
    Label6: TLabel;
    cbLabelsFields: TComboFlat;
    PageControl1: TPageControl;
    TabPreviewChart: TTabSheet;
    Panel7: TPanel;
    CB3DOption: TCheckBox;
    CBShowLegendOption: TCheckBox;
    CBShowMarksOption: TCheckBox;
    Panel8: TPanel;
    Panel4: TPanel;
    Image2: TImage;
    LabelURL: TLabel;
    Panel5: TPanel;
    PrevButton: TButton;
    NextButton: TButton;
    CancelBtn: TButton;
    tmpGallery: TChartGalleryPanel;
    RGDatabase: TRadioGroup;
    CBAlias: TComboFlat;
    Label5: TLabel;
    CBTables: TComboFlat;
    Image1: TImage;
    HelpButton: TButton;
    LabelDBStyle: TLabel;
    SpeedButton1: TSpeedButton;
    CBColorEach: TCheckBox;
    LabelAlias: TLabel;
    CBDBStyle: TComboFlat;
    TabFile: TTabSheet;
    BBrowse: TSpeedButton;
    RBFile: TRadioButton;
    EFile: TEdit;
    RBWeb: TRadioButton;
    EWeb: TEdit;
    Label1: TLabel;
    OpenDialog1: TOpenDialog;
    Panel3: TPanel;
    RG3D: TRadioGroup;
    CBSmooth: TCheckBox;
    BTheme: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CancelClick(Sender: TObject);
    procedure PrevClick(Sender: TObject);
    procedure NextClick(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure CB3DOptionClick(Sender: TObject);
    procedure CBShowLegendOptionClick(Sender: TObject);
    procedure CBShowMarksOptionClick(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure HelpButtonClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure LabelURLClick(Sender: TObject);
    procedure RG3DClick(Sender: TObject);
    procedure tmpGallerySelectedChart(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure CBTablesChange(Sender: TObject);
    procedure CBAliasChange(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CBDBStyleChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure CBColorEachClick(Sender: TObject);
    procedure BBrowseClick(Sender: TObject);
    procedure RBFileClick(Sender: TObject);
    procedure EFileChange(Sender: TObject);
    procedure FormResize(Sender: TObject);
    procedure CBSmoothClick(Sender: TObject);
    procedure BThemeClick(Sender: TObject);
  private
    { Private declarations }

    LastFolder,
    BackupDir    : String;
    IFields      : TSelectListForm;
    ThemeClass   : TChartThemeClass;
    NewChartPalette : Integer;

    {$IFNDEF NOUSE_BDE}
    procedure ChangedList(Sender:TObject);
    {$ENDIF}

    procedure ChangeGalleryPalette;
    procedure CheckPreviewOptions;
    procedure CreatePreviewChart;
    Procedure RefreshAlias;
    procedure RefreshButtons;
    procedure TryChangeFolder(const S:String);
  public
    { Public declarations }

    {$IFNDEF NOUSE_BDE}
    PreviewChart : TDBChart;
    {$IFNDEF CLX}
    Table1       : TTable;
    {$ENDIF}
    {$ELSE}
    PreviewChart : TChart;
    {$ENDIF}

    {$IFNDEF NOUSE_BDE}

    {$IFDEF TEEENTERPRISE}
    ADOConn      : TADOConnection;
    ADOQuery     : TADOQuery;
    {$ENDIF}

    {$ENDIF}

    procedure CopyPreviewChart(var Chart:TCustomChart);
    Procedure CreateSeries( AOwner:TComponent;
                            AChart:TCustomChart;
                            {$IFNDEF NOUSE_BDE}
                            ATable:TDataSet;
                            {$ENDIF}
                            ShowData:Boolean );
    procedure LoadChart(var Chart:TCustomChart);
    Function StyleBDE:Boolean;
  end;

const
  TeeMsg_WizardTable1   = 'Table1'; {  <-- dont translate }

Function TeeSelectFolder(const Caption,Root:String; var Folder:String):Boolean;

implementation

uses {$IFNDEF NOUSE_BDE}
     {$IFDEF TEEENTERPRISE}
     ADOConEd,
     {$ENDIF}
     {$ENDIF}
     {$IFNDEF LINUX}
     Registry,
     {$ENDIF}
     TeeAbout, TeeStore, TeeURL, Series, TeePenDlg, Math;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{ page numbers }
const
  pgStyle       = 0;  { Database vs. Non-Database }
  pgTable       = 1;  { Table name }
  pgFields      = 2;  { Fields }
  pgGallery     = 3;  { Chart Type }
  pgPreviewChart= 4;  { Preview }
  pgFile        = 5;  { *.tee file selection }

procedure TTeeDlgWizard.CreatePreviewChart;
begin
  PreviewChart.Free;

  { Create the Preview Chart }
  {$IFNDEF NOUSE_BDE}
  PreviewChart:=TDBChart.Create(Self);
  {$ELSE}
  PreviewChart:=TChart.Create(Self);
  {$ENDIF}

  with PreviewChart do
  begin
    Align:=alClient;
    AllowPanning:=pmNone;
    BackWall.Brush.Color:=clWhite;
    Foot.Frame.Hide;
    Title.Frame.Hide;

    Title.Text.Add({$IFNDEF NOUSE_BDE}'TDBChart'{$ELSE}'TChart'{$ENDIF}); // Do not localize

    Chart3DPercent:=35;
    Zoom.Allow:=False;
    BevelOuter:=bvNone;
    Parent:=TabPreviewChart;

    ColorPaletteIndex:=NewChartPalette;
  end;

  if Assigned(ThemeClass) then
  with ThemeClass.Create(PreviewChart) do
  try
    Apply;
  finally
    Free;
  end;
end;

Const 
  TeeMsg_WizardKey='SOFTWARE\Steema Software\TeeChart Pro\Wizard'; // Do not localize

{ TTeeDlgWizard }
procedure TTeeDlgWizard.FormCreate(Sender: TObject);

  Function TeeDefaultFilterExtension(const Extension:String):String;
  begin
    result:='(*.'+Extension+')|*.'+Extension; // Do not localize
  end;

  function GetNativeFilter:String;
  begin
    result:=TeeMsg_NativeFilter+' '+TeeDefaultFilterExtension(TeeMsg_TeeExtension);
  end;

begin
  GetDir(0,BackupDir);
  CBAlias.Text:=BackupDir;
  PageControl.ActivePage:=TabStyle;
  RefreshButtons;

  Constraints.MinHeight:=Height;
  Constraints.MinWidth:=Width;

  OpenDialog1.Filter:=GetNativeFilter;

  NewChartPalette:=TeeReadIntegerOption(TeeMsg_DefaultPalette,-1);

  CreatePreviewChart;

  { get aboutbox images }
  With TTeeAboutForm.Create(Self) do
  try
    Self.Image1.Picture.Assign(Image2.Picture);
    Self.Image2.Picture.Assign(Image1.Picture);
    Self.Image1.Transparent:=True;
  finally
    Free;
  end;

  {$IFDEF NOUSE_BDE}
  RGDatabase.Items.Delete(0);
  {$ELSE}

  {$IFNDEF CLX}
  Table1:=TTable.Create(Self);
  {$ENDIF}
  {$ENDIF}

  SpeedButton1.Visible:=True;

  {$IFDEF TEEENTERPRISE}

  LabelDBStyle.Visible:=True;
  CBDBStyle.Visible:=True;
  ADOConn:=TADOConnection.Create(Self);
  ADOConn.LoginPrompt:=False;
  ADOQuery:=TADOQuery.Create(Self);
  ADOQuery.Connection:=ADOConn;

  {$ELSE}
  LabelDBStyle.Visible:=False;
  CBDBStyle.Visible:=False;
  {$ENDIF}

  CBDBStyle.ItemIndex:=0;

  TeeTranslateControl(Self);

  {$IFNDEF LINUX}
  // Load last file path and url from registry
  with TRegistry.Create do
  try
    if OpenKeyReadOnly(TeeMsg_WizardKey) then
    begin
      if ValueExists('LastFile') then  // Do not localize
         EFile.Text:=ReadString('LastFile'); // Do not localize

      if ValueExists('LastURL') then // Do not localize
         EWeb.Text:=ReadString('LastURL'); // Do not localize

      if ValueExists('LastFolder') then // Do not localize
      begin
        LastFolder:=ReadString('LastFolder'); // Do not localize
        TryChangeFolder(LastFolder);
      end;
    end;
  finally
    Free;
  end;
  {$ENDIF}

  CBSmooth.Checked:=tmpGallery.Smooth;

  BTheme.Visible:=Assigned(TeeThemeSelectorHook);
end;

procedure TTeeDlgWizard.CancelClick(Sender: TObject);
begin
  Close;
end;

procedure TTeeDlgWizard.PrevClick(Sender: TObject);
begin
  With PageControl do
  case ActivePage.PageIndex of
    pgStyle  : Exit;
    pgFile,
    pgTable  : ActivePage := Pages[pgStyle];
    pgFields : ActivePage := Pages[pgTable];

    pgGallery: {$IFNDEF NOUSE_BDE}
               if RGDatabase.ItemIndex=0 then ActivePage := Pages[pgFields]
                                         else
               {$ENDIF}
                                              ActivePage := Pages[pgStyle];

  pgPreviewChart:
               if RGDatabase.ItemIndex<>2 then ActivePage := Pages[pgGallery]
                                          else ActivePage := Pages[pgFile];
  end;

  RefreshButtons;
end;

procedure TTeeDlgWizard.ChangeGalleryPalette;
var t : Integer;
begin
  With tmpGallery do
  for t:=0 to Charts.Count-1 do
     Charts[t].ColorPaletteIndex:=NewChartPalette;
end;

procedure TTeeDlgWizard.NextClick(Sender: TObject);

  Procedure ActiveGallery;
  begin
    { basic chart types... }
    With tmpGallery do
    if Charts.Count=0 then
    begin
      FunctionsVisible:=False;

      CreateChartList([ TLineSeries,
                        TBarSeries,
                        THorizBarSeries,
                        TAreaSeries,
                        THorizAreaSeries,
                        TPointSeries,
                        TPieSeries,
                        TFastLineSeries ]);

      ChangeGalleryPalette;
    end;

    PageControl.ActivePage:=PageControl.Pages[pgGallery];

    if PreviewChart.View3D then RG3D.ItemIndex:=1
                           else RG3D.ItemIndex:=0;
  end;

{$IFNDEF NOUSE_BDE}
var t       : Integer;
    tmpData : TDataSet;
{$ENDIF}
{$IFDEF CLR}
var tmpChart : TCustomChart;
{$ENDIF}
begin
  case PageControl.ActivePage.PageIndex of
    pgStyle:  {$IFNDEF NOUSE_BDE}
              if RGDatabase.ItemIndex=0 then { init table selection }
              begin
                PageControl.ActivePage := PageControl.Pages[pgTable];
                RefreshAlias;
                CBAliasChange(Self);
              end
              else
              if RGDatabase.ItemIndex=1 then
              {$ELSE}
              if RGDatabase.ItemIndex=0 then
              {$ENDIF}
                 ActiveGallery
              else
                 PageControl.ActivePage := PageControl.Pages[pgFile];


    pgTable:  begin
                {$IFNDEF NOUSE_BDE}

                PageControl.ActivePage := PageControl.Pages[pgFields];

                {$IFDEF CLX}
                tmpData:=nil;
                {$ELSE}
                if StyleBDE then tmpData:=Table1 else
                   {$IFDEF TEEENTERPRISE}
                   tmpData:=ADOQuery
                   {$ELSE}
                   tmpData:=nil
                   {$ENDIF}
                   ;
                {$ENDIF}

                tmpData.Close;

                if StyleBDE then
                begin
                  {$IFNDEF CLX}
                  Table1.DatabaseName:=CBAlias.Text;
                  Table1.TableName:=CBTables.Text;
                  {$ENDIF}
                end
                {$IFDEF TEEENTERPRISE}
                else
                begin
                  ADOQuery.SQL.Clear;
                  ADOQuery.SQL.Add('select * from ['+CBTables.Text+'];'); // Do not localize
                  ADOConn.Open;
                end
                {$ENDIF}
                ;

                tmpData.FieldDefs.Update;
                if not Assigned(IFields) then
                begin
                  IFields:=TSelectListForm.Create(Self);
                  IFields.OnChange:=ChangedList;
                  TeeTranslateControl(IFields);
                  AddFormTo(IFields,Panel1);
                end;

                IFields.FromList.Clear;
                IFields.ToList.Clear;
                CBLabelsFields.Clear;
                for t:=0 to tmpData.FieldDefs.Count-1 do
                With tmpData.FieldDefs[t] do
                Case TeeFieldType(DataType) of
                  tftNumber,
                  tftDateTime: begin
                               IFields.FromList.Items.Add(Name);
                               CBLabelsFields.Items.Add(Name);
                             end;
                  tftText: CBLabelsFields.Items.Add(Name);
                end;
                IFields.EnableButtons;
                for t:=0 to PreviewChart.SeriesCount-1 do
                    PreviewChart.Series[t].DataSource:=nil;

                tmpData.Open;

                {$ENDIF}
              end;
    pgFields :  ActiveGallery;
    pgGallery:  tmpGallerySelectedChart(Self);
    pgPreviewChart: begin
                      ModalResult := mrOK;
                      Exit;
                    end;
    pgFile : begin
               CreatePreviewChart;
               {$IFDEF CLR}
               tmpChart:=TCustomChart(PreviewChart);
               LoadChart(tmpChart);
               {$ELSE}
               LoadChart(TCustomChart(PreviewChart));
               {$ENDIF}
               PageControl.ActivePage := PageControl.Pages[pgPreviewChart];
               CheckPreviewOptions;
             end;
  end;

  RefreshButtons;
end;

procedure TTeeDlgWizard.LoadChart(var Chart:TCustomChart);
begin
  Screen.Cursor:=crHourGlass;
  try
    if RBFile.Checked then LoadChartFromFile(Chart,EFile.Text)
                      else LoadChartFromURL(Chart,EWeb.Text);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

{$IFNDEF NOUSE_BDE}
procedure TTeeDlgWizard.ChangedList(Sender:TObject);
begin
  NextButton.Enabled:=TSelectListForm(Sender).ToList.Items.Count>0;
end;
{$ENDIF}

procedure TTeeDlgWizard.RefreshButtons;
begin
  PrevButton.Enabled := PageControl.ActivePage.PageIndex > 0;

  With NextButton do
  begin
    Case PageControl.ActivePage.PageIndex of
      pgTable:  Enabled:=CBTables.Text<>'';
      pgFields: Enabled:=IFields.ToList.Items.Count>0;
    else
      Enabled:=True;
    end;

    if PageControl.ActivePage.PageIndex=pgPreviewChart then
       Caption:=TeeMsg_ExpFinish
    else
       Caption:=TeeMsg_ExpNext;
  end;
end;

type TSeriesAccess=class(TChartSeries);

Procedure TTeeDlgWizard.CreateSeries( AOwner:TComponent;
                                      AChart:TCustomChart;
                                      {$IFNDEF NOUSE_BDE}
                                      ATable:TDataSet;
                                      {$ENDIF}
                                      ShowData:Boolean );
var  t         : Integer;
     tmpSeries : TChartSeries;
     {$IFNDEF NOUSE_BDE}
     theField  : TField;
     {$ENDIF}
     tmpSeriesClass   : TChartSeriesClass;
     tmpFunctionClass : TTeeFunctionClass;
     NumSeries : Integer;
     SubIndex  : Integer;
begin
  {$IFNDEF NOUSE_BDE}
  if Assigned(ATable) then
     NumSeries:=Math.Max(1,IFields.ToList.Items.Count)
  else
  {$ENDIF}
     NumSeries:=2;

  tmpGallery.GetSeriesClass(tmpSeriesClass,tmpFunctionClass,SubIndex);

  if tmpSeriesClass=TPieSeries then NumSeries:=1;

  AChart.FreeAllSeries;

  for t:=0 to NumSeries-1 do
  begin
    tmpSeries:=tmpSeriesClass.Create(AOwner);

    With tmpSeries do
    begin
      { this should be done BEFORE setting ParentChart ! }

      {$IFNDEF CLR}
      if SubIndex<>-1 then { sub-gallery style... }
         TSeriesAccess(tmpSeries).SetSubGallery(tmpSeries,SubIndex);
      {$ENDIF}

      { now set the Chart... }
      ParentChart:=AChart;

      {$IFNDEF NOUSE_BDE}

      if Assigned(ATable) then
      begin
        if AChart is TDBChart then
           TDBChart(AChart).AutoRefresh:=False;

        DataSource:=ATable;
        MandatoryValueList.ValueSource:=IFields.ToList.Items[t];
        TheField:=ATable.FieldByName(MandatoryValueList.ValueSource);

        if (t=0) and (cbLabelsFields.ItemIndex>=0) then
           XLabelsSource:=cbLabelsFields.CurrentItem;

        MandatoryValueList.DateTime:=TeeFieldType(TheField.DataType)=tftDateTime;
        GetHorizAxis.Title.Caption:='';
        GetVertAxis.Title.Caption:='';
        NotMandatoryValueList.DateTime:=False;

        if YMandatory then
        begin
          if NumSeries=1 then GetVertAxis.Title.Caption:=YValues.ValueSource;
          if XLabelsSource<>'' then GetHorizAxis.Title.Caption:=XLabelsSource;
        end
        else
        begin
          if NumSeries=1 then GetHorizAxis.Title.Caption:=XValues.ValueSource;
          if XLabelsSource<>'' then GetVertAxis.Title.Caption:=XLabelsSource;
        end;

        Title:=MandatoryValueList.ValueSource;
      end
      else
      {$ENDIF}
         FillSampleValues(NumSampleValues);

      Name:=TeeMsg_DefaultSeriesName+IntToStr(AChart.SeriesCount);

      ColorEachPoint:=CBColorEach.Checked;

      Marks.Style:=smsValue;
      Marks.Visible:=CBShowMarksOption.Checked;

      {$IFNDEF NOUSE_BDE}
      if AChart is TDBChart then
         TDBChart(AChart).AutoRefresh:=True;
      {$ENDIF}
    end;
  end;

  AChart.View3D:=tmpGallery.SelectedChart.View3D;

  AChart.Title.Text.Clear;

  {$IFNDEF NOUSE_BDE}

  if Assigned(ATable) then
  begin
    {$IFDEF CLX}
    AChart.Title.Text.Add(CBTables.Text);
    {$ELSE}
    if ATable is TTable then
       AChart.Title.Text.Add(TTable(ATable).TableName)
    else
       AChart.Title.Text.Add(CBTables.Text);
    {$ENDIF}

    if ShowData and (AChart is TDBChart) then TDBChart(AChart).RefreshData;
  end
  else
  {$ENDIF}
       AChart.Title.Text.Add('TChart');  { <-- dont translate }
end;

procedure TTeeDlgWizard.Image1Click(Sender: TObject);
begin
  TeeShowAboutBox;
end;

procedure TTeeDlgWizard.CB3DOptionClick(Sender: TObject);
begin
  PreviewChart.View3D:=CB3DOption.Checked;
  if CB3DOption.Checked then RG3D.ItemIndex:=1
                        else RG3D.ItemIndex:=0;
end;

procedure TTeeDlgWizard.CBShowLegendOptionClick(Sender: TObject);
begin
  PreviewChart.Legend.Visible:=CBShowLegendOption.Checked;
end;

procedure TTeeDlgWizard.CBShowMarksOptionClick(Sender: TObject);
var t : Integer;
begin
  for t:=0 to PreviewChart.SeriesCount-1 do
     PreviewChart.Series[t].Marks.Visible:=CBShowMarksOption.Checked;
end;

procedure TTeeDlgWizard.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=(ModalResult<>mrCancel) or
            (PageControl.ActivePage.PageIndex=pgStyle) or
            TeeYesNo(TeeMsg_WizardSureToClose);
end;

procedure TTeeDlgWizard.HelpButtonClick(Sender: TObject);
begin
  {$IFNDEF CLX}
  Application.HelpJump('TeeChart_Wizard');  { <-- dont translate }
  {$ENDIF}
end;

procedure TTeeDlgWizard.TryChangeFolder(const S:String);
begin
  {$I-}
  ChDir(S);
  {$IFNDEF CLR}
  if IOResult<>0 then ;
  {$ENDIF}
  {$I+}
end;

procedure TTeeDlgWizard.FormClose(Sender: TObject;
  var Action: TCloseAction);
begin
  {$IFNDEF LINUX}
  // Load last file path and url from registry
  with TRegistry.Create do
  try
    if OpenKey(TeeMsg_WizardKey,True) then
    begin
      WriteString('LastFile',EFile.Text); // Do not localize
      WriteString('LastURL',EWeb.Text); // Do not localize

      if LastFolder<>'' then
         WriteString('LastFolder',LastFolder); // Do not localize
    end;
  finally
    Free;
  end;
  {$ENDIF}

  TryChangeFolder(BackupDir);
end;

procedure TTeeDlgWizard.LabelURLClick(Sender: TObject);
begin
  TeeGotoURL(Handle,LabelURL.Caption);
end;

procedure TTeeDlgWizard.RG3DClick(Sender: TObject);
begin
  tmpGallery.View3D:=RG3D.ItemIndex=1;
end;

procedure TTeeDlgWizard.tmpGallerySelectedChart(Sender: TObject);
{$IFNDEF NOUSE_BDE}
var tmp : TDataSet;
{$ENDIF}
begin
  PageControl.ActivePage := PageControl.Pages[pgPreviewChart];

  {$IFNDEF NOUSE_BDE}

  if RGDatabase.ItemIndex=0 then
  begin
    {$IFDEF CLX}
    tmp:=nil;
    {$ELSE}
    if StyleBDE then tmp:=Table1
                else {$IFDEF TEEENTERPRISE}tmp:=ADOQuery{$ELSE}tmp:=nil{$ENDIF}
    {$ENDIF}
  end
  else
     tmp:=nil;

  {$ENDIF}

  CreatePreviewChart;
  CreateSeries(Self,PreviewChart{$IFNDEF NOUSE_BDE},tmp{$ENDIF},True);

  CheckPreviewOptions;
  PageControl1.ActivePage:=TabPreviewChart;
  RefreshButtons;
end;

procedure TTeeDlgWizard.CheckPreviewOptions;
begin
  CB3DOption.Checked:=PreviewChart.View3D;
  CBShowLegendOption.Checked:=PreviewChart.Legend.Visible;
  CBShowMarksOption.Visible:=PreviewChart.SeriesCount>0;
  CBColorEach.Visible:=PreviewChart.SeriesCount>0;

  if PreviewChart.SeriesCount>0 then
  begin
    CBShowMarksOption.Checked:=PreviewChart.Series[0].Marks.Visible;
    CBColorEach.Checked:=PreviewChart.Series[0].ColorEachPoint;
  end;
end;

type
  TGalleryAccess=class(TChartGalleryPanel)
  {$IFDEF CLR}
  private
    procedure DoKeyDown(var Key: Word; Shift: TShiftState);
  end
  {$ENDIF}
  ;

{$IFDEF CLR}
procedure TGalleryAccess.DoKeyDown(var Key: Word; Shift: TShiftState);
begin
  KeyDown(Key,Shift);
end;
{$ENDIF}

procedure TTeeDlgWizard.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if PageControl.ActivePage=TabSheet1 then
     {$IFDEF CLR}
     TGalleryAccess(tmpGallery).DoKeyDown(Key,Shift);
     {$ELSE}
     TGalleryAccess(tmpGallery).KeyDown(Key,Shift);
     {$ENDIF}
end;

procedure TTeeDlgWizard.CBTablesChange(Sender: TObject);
begin
  NextButton.Enabled:=True;
end;

procedure TTeeDlgWizard.CBAliasChange(Sender: TObject);
begin
  {$IFNDEF NOUSE_BDE}

  Screen.Cursor:=crHourGlass;
  try
    try
      if StyleBDE then
         {$IFNDEF CLX}
         Session.GetTableNames(CBAlias.Text,'',True,False,CBTables.Items)
         {$ENDIF}
      else
      begin
      {$IFDEF TEEENTERPRISE}
        if CBAlias.Items.IndexOf(CBAlias.Text)<>-1 then
           ADOConn.ConnectionString:=CT_FILENAME+DataLinkDir+'\'+CBAlias.Text // Do not localize
        else
           ADOConn.ConnectionString:=CBAlias.Text;

        ADOConn.GetTableNames(CBTables.Items);
      {$ENDIF}
      end;
    except
      CBAlias.Text:='';
      CBTables.Clear;
    end;
  finally
    Screen.Cursor:=crDefault;
  end;

  {$ENDIF}
end;

Function TeeSelectFolder(const Caption,Root:String; var Folder:String):Boolean;
Var tmpDir : {$IFDEF K3}WideString
             {$ELSE}
             {$IFDEF D7}
               {$IFDEF CLX}WideString
               {$ELSE}String
               {$ENDIF}
             {$ELSE}String
             {$ENDIF}
             {$ENDIF};
begin
  tmpDir:=Folder;

  result:=SelectDirectory(Caption,Root,tmpDir);

  if result then
     Folder:=tmpDir;
end;

procedure TTeeDlgWizard.SpeedButton1Click(Sender: TObject);
{$IFNDEF NOUSE_BDE}
Var tmpDir : String;
{$ENDIF}
begin
  {$IFNDEF NOUSE_BDE}
  if StyleBDE then
  begin
    tmpDir:=CBAlias.Text;

    if not DirectoryExists(tmpDir) then
       tmpDir:='';

    if TeeSelectFolder(TeeMsg_SelectFolder,'',tmpDir) then
    begin
      CBAlias.Text:=tmpDir;
      CBAliasChange(Self);
    end;
  end
  {$IFDEF TEEENTERPRISE}
  else
  begin
    if EditConnectionString(ADOConn) then
    begin
      CBAlias.Text:=ADOConn.ConnectionString;
      CBAliasChange(Self);
    end;
  end;
  {$ENDIF}
  {$ENDIF}
end;

procedure TTeeDlgWizard.CBDBStyleChange(Sender: TObject);
begin
  if StyleBDE then
    LabelAlias.Caption:=TeeMsg_BDEAlias
  else
  begin
    {$IFDEF TEEENTERPRISE}
    LabelAlias.Caption:=TeeMsg_ADOConnection;
    {$ENDIF}
  end;
  CBAlias.Style:=csDropDown;
  RefreshAlias;
end;

Procedure TTeeDlgWizard.RefreshAlias;
begin
  NextButton.Enabled:=False;
  CBAlias.Clear;
  CBTables.Clear;

  {$IFNDEF NOUSE_BDE}

  if StyleBDE then
  begin
    {$IFNDEF CLX}
    Session.GetAliasNames(CBAlias.Items);
    {$ENDIF}
    CBAlias.Text:=BackupDir;
  end
  {$IFDEF TEEENTERPRISE}
  else GetDataLinkFiles(CBAlias.Items,DataLinkDir);
  {$ENDIF}

  {$ENDIF}
end;

Function TTeeDlgWizard.StyleBDE:Boolean;
begin
  {$IFDEF TEEENTERPRISE}
  result:=CBDBStyle.ItemIndex=0;
  {$ELSE}
  result:=True;
  {$ENDIF}
end;

procedure TTeeDlgWizard.FormDestroy(Sender: TObject);
begin
  {$IFNDEF NOUSE_BDE}

  {$IFDEF TEEENTERPRISE}
  ADOQuery.Free;
  ADOConn.Free;
  {$ENDIF}

  {$ENDIF}
end;

procedure TTeeDlgWizard.CBColorEachClick(Sender: TObject);
var t : Integer;
begin
  for t:=0 to PreviewChart.SeriesCount-1 do
     PreviewChart.Series[t].ColorEachPoint:=CBColorEach.Checked;
end;

procedure TTeeDlgWizard.BBrowseClick(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    EFile.Text:=OpenDialog1.FileName;
    LastFolder:=ExtractFilePath(EFile.Text);
  end;
end;

procedure TTeeDlgWizard.RBFileClick(Sender: TObject);
begin
  EFile.Enabled:=RBFile.Checked;
  RBWeb.Checked:=not RBFile.Checked;
  EWeb.Enabled:=not EFile.Enabled;
  BBrowse.Enabled:=EFile.Enabled;
  EFileChange(Sender);
end;

procedure TTeeDlgWizard.EFileChange(Sender: TObject);
begin
  NextButton.Enabled:=True;
end;

procedure TTeeDlgWizard.CopyPreviewChart(var Chart:TCustomChart);
var Stream : TMemoryStream;
begin
  Stream:=TMemoryStream.Create;
  try
    SaveChartToStream(PreviewChart,Stream);
    Stream.Position:=0;
    LoadChartFromStream(Chart,Stream);
  finally
    Stream.Free;
  end;
end;

procedure TTeeDlgWizard.FormResize(Sender: TObject);
begin
  with tmpGallery do
  SetBounds(Left,Top,TabSheet1.Width-20,TabSheet1.Height-70);

  with RGDatabase do
    SetBounds((TabStyle.Width-Width) div 2,Top,Width,Height);
end;

procedure TTeeDlgWizard.CBSmoothClick(Sender: TObject);
begin
  tmpGallery.Smooth:=CBSmooth.Checked;
end;

procedure TTeeDlgWizard.BThemeClick(Sender: TObject);
begin
  if Assigned(TeeThemeSelectorHook) then
  begin
    if PreviewChart.SeriesCount=0 then
       CreateSeries(Self,PreviewChart,{$IFNDEF NOUSE_BDE}nil,{$ENDIF}True);

    ThemeClass:=TeeThemeSelectorHook(PreviewChart);
    tmpGallery.UseTheme(ThemeClass);

    NewChartPalette:=PreviewChart.ColorPaletteIndex;
    ChangeGalleryPalette;
  end;
end;

end.
