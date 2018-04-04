unit Main;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Graphics, FMX.Controls, FMX.Forms, FMX.Dialogs, FMX.StdCtrls,
  FMXTee.Engine, FMXTee.Procs, FMXTee.Chart, FMX.Layouts, System.Rtti, FMX.Grid,

  {$IFDEF MSWINDOWS}
  ShellApi,
  {$ENDIF}

  FMXTee.Chart.Grid, FMX.Objects, System.IOUtils, FMXTee.Series,
  FMXTee.Chart.GalleryPanel, FMXTee.Constants, FMX.ListBox,
  FMXTee.Store, FMXTee.Themes, FMX.Edit, FMXTee.Canvas.PDF, FMXTee.Editor.Themes,
  FMXTee.Editor.Export, FMXTee.Canvas.PostScript, FMXTee.Editor.Chart;

type
  TMainForm = class(TForm)
    LeftLayout: TLayout;
    RightLayout: TLayout;
    TopLayout: TLayout;
    Chart1: TChart;
    LayoutData: TLayout;
    Image1: TImage;
    Text1: TText;
    ChartGrid1: TChartGrid;
    LayoutExcel: TLayout;
    Image2: TImage;
    Text2: TText;
    FileLayout: TLayout;
    Image3: TImage;
    ImageDelete: TImage;
    Image5: TImage;
    LayoutShare: TLayout;
    Image6: TImage;
    Text3: TText;
    Splitter1: TSplitter;
    Splitter2: TSplitter;
    LayoutStyle: TLayout;
    ImageStyle: TImage;
    Text4: TText;
    ChartGalleryPanel1: TChartGalleryPanel;
    ListCharts: TListBox;
    ExcelPanel: TLayout;
    SharePanel: TLayout;
    GlobalLayoutData: TLayout;
    GlobalLayoutExcel: TLayout;
    GlobalLayoutShare: TLayout;
    SplitterData: TSplitter;
    Edit1: TEdit;
    ImageConfirm: TImage;
    ShareFormat: TComboBox;
    Image4: TImage;
    Image7: TImage;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    Image8: TImage;
    procedure Image5Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ChartGalleryPanel1ChangeChart(Sender: TObject);
    procedure LayoutDataClick(Sender: TObject);
    procedure RightLayoutResize(Sender: TObject);
    procedure LayoutStyleClick(Sender: TObject);
    procedure LayoutShareClick(Sender: TObject);
    procedure LayoutExcelClick(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure ListChartsClick(Sender: TObject);
    procedure ImageDeleteClick(Sender: TObject);
    procedure Chart1ClickTitle(Sender: TCustomChart; ATitle: TChartTitle;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Edit1ChangeTracking(Sender: TObject);
    procedure ImageConfirmClick(Sender: TObject);
    procedure ChartGrid1SetEditText(Sender: TObject; const Col, Row: Integer;
      const Value: TValue);
    procedure ChartGrid1ChangeColor(Sender: TObject);
    procedure Image4Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
  private
    { Private declarations }

    procedure AddChartToList(const AName:String);
    function CurrentChartFile:String;
    function CurrentChartName:String;
    function GalleryOf(const ASeries:TChartSeries):TGalleryChart;
    procedure LoadCharts;
    procedure NewChart;
    function NewChartName:String;
    procedure PrepareList(Index:Integer);
    procedure SaveChart;
    function SureToDelete:Boolean;
  public
    { Public declarations }
  end;

var
  MainForm: TMainForm;

implementation

{$R *.fmx}

function ChartsFolder:String;
begin
  result:=TPath.GetDocumentsPath+'\TeeChart';
end;

function ExportFolder:String;
begin
  result:=ChartsFolder+'\Images';
end;

procedure OpenFolder(const AFolder:String);
begin
  {$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', PChar(AFolder), nil, nil, 0);
  {$ENDIF}
end;

procedure PreviewImage(const AFile:String);
begin
  {$IFDEF MSWINDOWS}
  ShellExecute(0, 'open', PChar(AFile), nil, nil, 0);
  {$ENDIF}
end;

procedure TMainForm.Chart1ClickTitle(Sender: TCustomChart; ATitle: TChartTitle;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  Edit1.TagObject:=ATitle;
  Edit1.Text:=ATitle.Caption;
  Edit1.Visible:=True;
  ImageConfirm.Visible:=True;
end;

procedure TMainForm.ChartGalleryPanel1ChangeChart(Sender: TObject);
var tmp:TChartSeriesClass;
begin
  if ListCharts.ItemIndex<>-1 then
  begin
    ChartGalleryPanel1.GetSeriesClass(tmp);

    if not (Chart1[0] is tmp) then
    begin
      ChangeAllSeriesType(Chart1,tmp);
      SaveChart;
    end;
  end;
end;

procedure TMainForm.ChartGrid1ChangeColor(Sender: TObject);
begin
  SaveChart;
end;

procedure TMainForm.ChartGrid1SetEditText(Sender: TObject; const Col,
  Row: Integer; const Value: TValue);
begin
  SaveChart;
end;

procedure TMainForm.PrepareList(Index:Integer);
var tmpItem : TText;
begin
  tmpItem:=ListCharts.ItemByIndex(Index).FindStyleResource('text') as TText;

  if Assigned(tmpItem) then
  begin
    tmpItem.Font.Family:='Roboto Th';
    tmpItem.Font.Size:=22;
  end;
end;

function TMainForm.GalleryOf(const ASeries:TChartSeries):TGalleryChart;
var t : Integer;
begin
  result:=nil;

  for t := 0 to ChartGalleryPanel1.Charts.Count-1 do
  if ChartGalleryPanel1.Chart[t].Series[0] is ASeries.ClassType then
  begin
    result:=ChartGalleryPanel1.Chart[t];
    break;
  end;
end;

procedure TMainForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  GlobalLayoutExcel.Height:=LayoutExcel.Height;
  GlobalLayoutShare.Height:=LayoutShare.Height;

  SaveDialog1.InitialDir:=ExportFolder;
  OpenDialog1.InitialDir:=ChartsFolder+'\Data';

  ChartGalleryPanel1.NumCols:=3;
  ChartGalleryPanel1.CreateGalleryPage(TeeMsg_GalleryStandard);
  ChartGalleryPanel1.View3D:=False;

  with ChartGalleryPanel1 do
  for t := 0 to Charts.Count-1 do
  begin
    Charts[t].Title.Visible:=False;
    Charts[t].Axes.Hide;
  end;

  ListCharts.ItemHeight:=32;

  LoadCharts;

  if ListCharts.Count=0 then
     NewChart
  else
  begin
    ListCharts.ItemIndex:=0;
    ListChartsClick(Self);
  end;

  Chart1.AllowZoom:=False;
  Chart1.AllowPanning:=pmNone;

  ChartGrid1.RecalcDimensions;

  if not FileExists(CurrentChartFile) then
     SaveChart;
end;

function TMainForm.CurrentChartName:String;
begin
  result:=ListCharts.Items[ListCharts.ItemIndex];
end;

procedure TMainForm.Edit1ChangeTracking(Sender: TObject);
var tmp : String;
begin
  tmp:=(Edit1.TagObject as TChartTitle).Caption;

  if tmp<>Edit1.Text then
  begin
    (Edit1.TagObject as TChartTitle).Caption:=Edit1.Text;
    SaveChart;
  end;
end;

function TMainForm.CurrentChartFile:String;
begin
  result:=ChartsFolder+'\'+CurrentChartName+'.tee';
end;

procedure TMainForm.SaveChart;
begin
  ForceDirectories(ChartsFolder);
  SaveChartToFile(Chart1,CurrentChartFile);
end;

function TMainForm.NewChartName:String;
var t : Integer;
begin
  t:=1;

  repeat
    result:='Chart'+IntToStr(t);
    Inc(t);
  until not FileExists(ChartsFolder+'\'+result+'.tee');
end;

procedure TMainForm.AddChartToList(const AName:String);
begin
  ListCharts.Items.Add(AName);
  PrepareList(ListCharts.Count-1);
end;

procedure TMainForm.NewChart;
begin
  AddChartToList(NewChartName);
  ListCharts.ItemIndex:=ListCharts.Count-1;

  Chart1.ClearChart;
  ApplyChartTheme(TFlatTheme,Chart1);

  Chart1.Title.Caption:=CurrentChartName;

  Chart1.AddSeries(TBarSeries).FillSampleValues;
  ChartGrid1.RecalcDimensions;

  SaveChart;

  ChartGalleryPanel1.SelectChart(GalleryOf(Chart1[0]));
end;

procedure TMainForm.Image3Click(Sender: TObject);
begin
  NewChart;
end;

procedure TMainForm.Image4Click(Sender: TObject);

  function AskFile(const AExtension:String):String;
  begin
    ForceDirectories(ExportFolder);

    SaveDialog1.FileName:=CurrentChartName+'.'+AExtension;
    SaveDialog1.DefaultExt:=AExtension;
    SaveDialog1.Filter:='*.'+AExtension;

    if SaveDialog1.Execute then
       result:=SaveDialog1.FileName
    else
       result:='';
  end;

  procedure SaveBitmapTo(const AExtension:String);
  var b: TBitmap;
     tmpFile : String;
  begin
    tmpFile:=AskFile(AExtension);

    if tmpFile<>'' then
    begin
       b:=Chart1.TeeCreateBitmap(Chart1.Color,Chart1.BoundsRect);
       try
         b.SaveToFile(tmpFile);
         PreviewImage(tmpFile);
       finally
         b.Free;
       end;
     end;
  end;

var tmpFile : String;
begin
  case ShareFormat.ItemIndex of
    0: SaveBitmapTo('png');
    1: SaveBitmapTo('jpg');
    2: SaveBitmapTo('tiff');
    3: begin
         tmpFile:=AskFile('pdf');

         if tmpFile<>'' then
         begin
           TeeSaveToPDFFile(Chart1,tmpFile);
           PreviewImage(tmpFile);
         end;
       end;
    4: begin
         tmpFile:=AskFile('ps');

         if tmpFile<>'' then
         begin
           TeeSaveToPSFile(Chart1,tmpFile);
           PreviewImage(tmpFile);
         end;
       end;
  end;

end;

procedure TMainForm.ImageConfirmClick(Sender: TObject);
begin
  Edit1.Visible:=False;
  Edit1.TagObject:=nil;
  ImageConfirm.Visible:=False;
end;

function TeeYesNo(const S:String):Boolean;
begin
  result:=MessageDlg(S,TMsgDlgType.mtConfirmation,[TMsgDlgBtn.mbYes,TMsgDlgBtn.mbNo],0,TMsgDlgBtn.mbNo)=mrYes;
end;

function TMainForm.SureToDelete:Boolean;
begin
  result:=TeeYesNo('Are you sure to delete '+CurrentChartName+'?');
end;

procedure TMainForm.ImageDeleteClick(Sender: TObject);
var tmp : Integer;
begin
  if SureToDelete then
  begin
    TFile.Delete(CurrentChartFile);

    tmp:=ListCharts.ItemIndex;
    ListCharts.Items.Delete(tmp);

    if tmp=ListCharts.Count then
       ListCharts.ItemIndex:=tmp-1
    else
       ListCharts.ItemIndex:=tmp;

    ListChartsClick(Self);
  end;
end;

procedure TMainForm.Image5Click(Sender: TObject);
begin
  OpenFolder(ChartsFolder);
end;

procedure TMainForm.Image7Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    // Open Excel file
    // Guess cell ranges
    // Find best range
    // Ask user to confirm data
    // Ask to replace current chart data
    // Parse cells into Series
    // Close Excel file
  end;
end;

procedure TMainForm.Image8Click(Sender: TObject);
begin
  TChartEditForm.Edit(Self,Chart1);
end;

procedure TMainForm.LayoutDataClick(Sender: TObject);
begin
  ChartGrid1.Visible:=not ChartGrid1.Visible;

  if ChartGrid1.Visible then
     GlobalLayoutData.Height:=150
  else
     GlobalLayoutData.Height:=LayoutData.Height;
end;

procedure TMainForm.LayoutExcelClick(Sender: TObject);
begin
  ExcelPanel.Visible:=not ExcelPanel.Visible;

  if ExcelPanel.Visible then
     GlobalLayoutExcel.Height:=150
  else
     GlobalLayoutExcel.Height:=LayoutExcel.Height;
end;

procedure TMainForm.LayoutShareClick(Sender: TObject);
begin
  SharePanel.Visible:=not SharePanel.Visible;

  if SharePanel.Visible then
     GlobalLayoutShare.Height:=150
  else
     GlobalLayoutShare.Height:=LayoutShare.Height;
end;

procedure TMainForm.LayoutStyleClick(Sender: TObject);
begin
  ChartGalleryPanel1.Visible:=not ChartGalleryPanel1.Visible;
end;

procedure TMainForm.ListChartsClick(Sender: TObject);
var tmp : TCustomChart;
begin
  tmp:=Chart1;
  LoadChartFromFile(tmp,CurrentChartFile);
  tmp.Align:=TAlignLayout.alClient;
  Realign;

  ImageDelete.Enabled:=ListCharts.Count>1;

  ChartGalleryPanel1.SelectChart(GalleryOf(Chart1[0]));
end;

{
function RemoveFileExtension(const AName:String):String;
var tmp : String;
begin
  result:=AName;

  tmp:=ExtractFileExt(result);

  if tmp<>'' then
     Delete(Result,Pos(tmp,result),Length(result));
end;
}

procedure TMainForm.LoadCharts;
var s: TStringDynArray;
    t: Integer;
begin
  s:=TDirectory.GetFiles(ChartsFolder,'*.tee');

  for t := 0 to Length(s)-1 do
      AddChartToList(RemoveFileExtension(ExtractFileName(s[t])));

  ImageDelete.Enabled:=ListCharts.Count>1;
end;

procedure TMainForm.RightLayoutResize(Sender: TObject);
begin
  ChartGalleryPanel1.NumCols:=Round(RightLayout.Width) div 64;
end;

end.
