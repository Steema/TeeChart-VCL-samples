unit TeeImportData;
{$I TeeDefs.inc}

interface

{$IFDEF LINUX}
{$UNDEF TEEENTERPRISE}
{$ENDIF}

uses
  Windows, Messages, SysUtils,
  {$IFDEF D6}
  Variants,
  {$ENDIF}
  Classes, Graphics, Controls, Forms,
  {$IFDEF TEEENTERPRISE}
  ADODB,
  {$ENDIF}
  Dialogs, StdCtrls, ExtCtrls, Buttons, TeCanvas, ActiveX, ComObj, OleCtnrs,
  ComCtrls, Grids, TeeGDIPlus, TeeProcs, TeEngine, Chart, Math, TeePenDlg,
  TeeChartGrid, Menus;

type
  TImport_Form = class(TForm)
    Panel1: TPanel;
    BOpen: TButton;
    CBFile: TComboFlat;
    Label1: TLabel;
    SpeedButton1: TSpeedButton;
    OpenDialog1: TOpenDialog;
    PageControl1: TPageControl;
    Panel2: TPanel;
    Label2: TLabel;
    EStart: TEdit;
    EEnd: TEdit;
    Label3: TLabel;
    SBChart: TSpeedButton;
    Chart1: TChart;
    ByRows: TCheckBox;
    Splitter1: TSplitter;
    Panel3: TPanel;
    BOK: TButton;
    Button2: TButton;
    SBEditGrid: TSpeedButton;
    CBFormat: TComboFlat;
    ProgressBar1: TProgressBar;
    PanelText: TPanel;
    Label4: TLabel;
    CBDelimiter: TComboFlat;
    EDelim: TEdit;
    BCancelLoad: TButton;
    PanelADO: TPanel;
    Label5: TLabel;
    CBTables: TComboFlat;
    Label6: TLabel;
    EPass: TEdit;
    PopupGrid: TPopupMenu;
    Cut1: TMenuItem;
    Copy1: TMenuItem;
    Paste1: TMenuItem;
    Delete1: TMenuItem;
    N1: TMenuItem;
    InsertRow1: TMenuItem;
    InsertRowbelow1: TMenuItem;
    Above1: TMenuItem;
    Below1: TMenuItem;
    Before1: TMenuItem;
    After1: TMenuItem;
    N2: TMenuItem;
    DeleteRow1: TMenuItem;
    DeleteColumn1: TMenuItem;
    procedure FormCreate(Sender: TObject);
    procedure CBFileChange(Sender: TObject);
    procedure BOpenClick(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure EStartChange(Sender: TObject);
    procedure EEndChange(Sender: TObject);
    procedure SBChartClick(Sender: TObject);
    procedure ByRowsClick(Sender: TObject);
    procedure PageControl1Change(Sender: TObject);
    procedure SBEditGridClick(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure CBFormatChange(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure CBDelimiterChange(Sender: TObject);
    procedure EDelimChange(Sender: TObject);
    procedure BCancelLoadClick(Sender: TObject);
    procedure CBTablesChange(Sender: TObject);
    procedure Above1Click(Sender: TObject);
    procedure Below1Click(Sender: TObject);
    procedure Before1Click(Sender: TObject);
    procedure After1Click(Sender: TObject);
    procedure Delete1Click(Sender: TObject);
    procedure Cut1Click(Sender: TObject);
    procedure Copy1Click(Sender: TObject);
    procedure Paste1Click(Sender: TObject);
    procedure PopupGridPopup(Sender: TObject);
    procedure DeleteRow1Click(Sender: TObject);
    procedure DeleteColumn1Click(Sender: TObject);
  private
    { Private declarations }
    Excel : Variant;
    FTextFile : TStringList;
    FTempChart : TCustomChart;
    FChartGrid : TChartGrid;

    {$IFDEF TEEENTERPRISE}
    FADOC      : TADOConnection;
    {$ENDIF}
      
    CancelLoading : Boolean;

    FLoadedFileName,
    Delimiter : String;
    OldSelection : TGridRect;
    ISelecting : Boolean;

    procedure AddOpenFilter;
    procedure EnableOpen;
    procedure FillTabs(const AFileName:String);
    procedure GridChangedSelection;
    procedure GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure GridMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
    procedure GridMouseUp(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure ParseContents(const ATitle:String);
    procedure RefreshChart;
    procedure RemoveTabs;
    procedure SelectGrid(const Left,Top,Right,Bottom:Integer; const Shift:TShiftState=[]);
  public
    { Public declarations }
    function Grid:TStringGrid;

    procedure FillChart(const AChart:TCustomChart; RemoveSeries:Boolean=True);
    class procedure FillGrid(const ATitle:String; const AGrid:TStringGrid; const AChart:TCustomChart; ByRows:Boolean=True;
        RemoveSeries:Boolean=True);
  end;

implementation

{$R *.dfm}

uses
  {$IFNDEF D6}
  FileCtrl,
  {$ENDIF}
  Clipbrd,
  Db, Series, TeeHTML, TeeStore;

const
  ExcelApp='Excel.Application';

function IsExcel_Installed:Boolean;
var tmp : String;
    ID: TCLSID;
begin
  tmp:=ExcelApp;
  result:=CLSIDFromProgID(PWideChar(WideString(tmp)),ID)=S_OK;
end;

procedure TImport_Form.EnableOpen;
var tmp : Boolean;
begin
  if CBFormat.ItemIndex=0 then
     tmp:=IsExcel_Installed
  else
     tmp:=True;

  BOpen.Enabled:=tmp and (CBFile.Text<>'') and FileExists(CBFile.Text);
end;

procedure TImport_Form.FormCreate(Sender: TObject);
begin
  CBFormatChange(Self);
end;

procedure TImport_Form.CBFileChange(Sender: TObject);
begin
  EnableOpen;
end;

// Convert from relative folder path name to absolute, including \\machinename
// if necessary on Windows, and on a network
function AbsolutePath(APath:String):String;
var Old : String;
    tmp : String;
begin
  //ExpandUNCFileName(APath);  <--- buggy !!!
  //ExpandFileName(APath); <--- buggy !!!

  result:=APath;

  if {$IFDEF D15}SysUtils.{$ENDIF}DirectoryExists(APath) then
  begin
    Old:=GetCurrentDir;
    try
      if Copy(APath,1,1)='"' then
         Delete(APath,1,1);

      if Copy(APath,Length(APath),1)='"' then
         Delete(APath,Length(APath),1);

      ChDir(APath);
      tmp:=GetCurrentDir;
      result:=tmp;
    finally
      ChDir(Old);
    end;
  end;
end;

const
  xlWorksheet = -4167;

procedure TImport_Form.BOpenClick(Sender: TObject);

  procedure OpenExcel(const AName:String);
  begin
    if VarIsEmpty(Excel) then
    try
      Excel:=GetActiveOleObject(ExcelApp);
    except
      try
        Excel:=CreateOleObject(ExcelApp);
      except
        ShowMessage('Cannot start Microsoft Excel. Is it correctly installed?');
        Close;
      end;
    end;

    Excel.Workbooks.Open(AName);
  end;

  procedure OpenAccess(const AName:String);
  var ext,s : String;
  begin
    {$IFDEF TEEENTERPRISE}
    FADOC.Free;
    FADOC:=TADOConnection.Create(Self);
    FADOC.LoginPrompt:=False;

    ext:=UpperCase(ExtractFileExt(AName));

    if ext='.MDB' then
       s:='Provider=Microsoft.Jet.OLEDB.4.0;Data Source='+AName+';Persist Security Info=False;'
    else
       s:='Provider=Microsoft.ACE.OLEDB.12.0;Data Source='+AName+';Persist Security Info=False;';

    if EPass.Text<>'' then
        s:=s+'Jet OLEDB:Database Password='+EPass.Text;

    FADOC.ConnectionString:=s;

    // New:
    // 'Provider=Microsoft.ACE.OLEDB.12.0;Data Source='+AName+';Persist Security Info=False';

    // Jet OLEDB:Database Password=MyDbPassword;

    // Old:
    // Provider=Microsoft.Jet.OLEDB.4.0;Data Source=C:\mydatabase.mdb;User Id=admin; Password=;

    FADOC.Open;
    FADOC.GetTableNames(CBTables.Items);

    if CBTables.Items.Count>0 then
       CBTables.ItemIndex:=0;
    {$ENDIF}
  end;

  procedure OpenText(const AName:String);
  begin
    FTextFile.Free;

    FTextFile:=TStringList.Create;
    FTextFile.LoadFromFile(AName);
  end;

  procedure OpenTee(const AName:String);
  var t : Integer;
  begin
    FreeAndNil(FTempChart);

    FTempChart:=TChart.Create(nil);
    LoadChartFromFile(FTempChart,AName);

    for t:=0 to FTempChart.SeriesCount-1 do
        FTempChart[t].ValueFormat:='0';

    if not Assigned(FChartGrid) then
       FChartGrid:=TChartGrid.Create(nil);

    FChartGrid.Chart:=FTempChart;
    FChartGrid.RecalcDimensions;
  end;

var s : String;
begin
  Screen.Cursor:=crHourGlass;
  try
    s:=AbsolutePath(ExtractFilePath(CBFile.Text))+'\'+ExtractFileName(CBFile.Text);

    case CBFormat.ItemIndex of
      0: OpenExcel(s);
      1: OpenAccess(s);
      2: OpenText(s);
      3: OpenTee(s);
    end;

    FLoadedFileName:=s;

    ParseContents(s);
  finally
    Screen.Cursor:=crDefault;
  end;
end;

procedure TImport_Form.ParseContents(const ATitle:String);
begin
  RemoveTabs;
  FillTabs(ATitle);

  EnableControls(PageControl1.PageCount>0,[EStart,EEnd,ByRows,SBEditGrid]);

  BOk.Enabled:=False;

  if PageControl1.PageCount>0 then
     RefreshChart;
end;

function CoordSt(X:Integer):String;
begin
  result:='';

  repeat
    result:=result+Chr((X mod 96)+64);
    Dec(X,96);
  until X<=0;
end;

// If "S" is enclosed between quotes, trim it and remove them.
// If not, bypass and return S as it is.
function RemoveQuotes(const S:String):String;
var l : Integer;
begin
  result:=Trim(S);

  l:=Length(result);

  if (Copy(result,1,1)='"') and (Copy(result,l,1)='"') then
     result:=Copy(result,2,l-2)
  else
     result:=S;
end;

function TImport_Form.Grid:TStringGrid;
begin
  if PageControl1.ActivePage<>nil then
     result:=PageControl1.ActivePage.Controls[0] as TStringGrid
  else
     result:=nil;
end;

type
  TGridAccess=class(TCustomGrid);

procedure TImport_Form.FillTabs(const AFileName:String);

  function CreateTabGrid(const ACaption:String; Rows,Cols:Integer):TStringGrid;
  var P : TTabSheet;
      x,y : Integer;
  begin
    P:=TTabSheet.Create(Self);
    P.PageControl:=PageControl1;

    P.Caption:=ACaption;

    result:=TStringGrid.Create(Self);
    result.Parent:=P;
    result.Align:=alClient;

    result.PopupMenu:=PopupGrid;

    result.Options:=result.Options+[goColSizing,goRangeSelect];
    result.DefaultRowHeight:=18;

    result.RowCount:=Rows+2+result.FixedRows;
    result.ColCount:=Cols+2+result.FixedCols;

    result.OnKeyUp:=GridKeyUp;
    result.OnMouseMove:=GridMove;
    result.OnMouseUp:=GridMouseUp;

    for y:=1 to Rows+2 do
        result.Cells[0,y]:=IntToStr(y);

    for x:=1 to Cols+2 do
        result.Cells[x,0]:=CoordSt(x);
  end;

  function TextColumns:Integer;
  begin
    result:=0;

    if FTextFile.Count>0 then
       result:=TeeNumFields(FTextFile[0]);
  end;

  function GuessDelimiter(MaxRow:Integer):String;
  var n : Integer;
      s : String;
  begin
    if (Delimiter='') and (MaxRow>0) then
    begin
      n:=0;
      repeat
        s:=Trim(FTextFile[n]);

        if s='' then
           Inc(n)
        else
        begin
          if Pos(TeeTabDelimiter,s)>0 then
             result:=TeeTabDelimiter
          else
          if Pos(',',s)>0 then
             result:=','
          else
          if Pos(';',s)>0 then
             result:=';'
          else
          if Pos(':',s)>0 then
             result:=':'
          else
          if Pos('|',s)>0 then
             result:='|'
          else
             result:=Delimiter;

          break;
        end;

      until n>=MaxRow;
    end
    else
       result:=Delimiter;
  end;

  procedure PrepareProgressBar(AproxTotalCells:Integer);
  begin
    ProgressBar1.Visible:=AproxTotalCells>10000;

    if ProgressBar1.Visible then
    begin
      ProgressBar1.Position:=0;
      BCancelLoad.Visible:=True;
    end;

    CancelLoading:=False;
  end;

  procedure UpdateProgress(const APosition:Integer);
  begin
    if ProgressBar1.Visible then
    begin
      ProgressBar1.Position:=APosition;
      Application.ProcessMessages;  // To allow clicking the "Cancel" button
    end;
  end;

  procedure ImportExcel;
  var t : Integer;
      Sheet : Variant;
      MaxRow,
      MaxCol : Integer;
      tmpGrid : TStringGrid;
      x,y : Integer;
  begin
    for t:=1 to Excel.WorkSheets.Count do
    begin
      Sheet:=Excel.WorkSheets[t];

      MaxRow:=Sheet.UsedRange.EntireRow.Count;
      MaxCol:=Sheet.UsedRange.EntireColumn.Count;

      tmpGrid:=CreateTabGrid(Sheet.Name,MaxRow,MaxCol);

      PrepareProgressBar(maxCol*maxRow);

      for x:=1 to maxCol+2 do
      begin
        for y:=1 to maxRow+2 do
        begin
          tmpGrid.Cells[x,y]:=Sheet.Cells.Item[y,x].Value;

          if CancelLoading then
             break;
        end;

        UpdateProgress((x*100) div (maxCol+2));

        if CancelLoading then
           break;
      end;

      ProgressBar1.Visible:=False;
      BCancelLoad.Visible:=False;
    end;

    Excel.Workbooks.Close;
  end;

  procedure ImportAccess;
  {$IFDEF TEEENTERPRISE}
  var x,y,
      MaxRow,
      MaxCol : Integer;
      tmpGrid : TStringGrid;
      FADOT : TADOTable;
  {$ENDIF}
  begin
    {$IFDEF TEEENTERPRISE}

    if CBTables.Text='' then
       Exit;
       
    FADOT:=TADOTable.Create(Self);
    try
      with FADOT do
      begin
        ConnectionString:=FADOC.ConnectionString;
        TableName:=CBTables.Text;
        ReadOnly:=True;
        Open;
      end;

      MaxRow:=FADOT.RecordCount;
      MaxCol:=FADOT.Fields.Count;

      PrepareProgressBar(maxCol*maxRow);

      tmpGrid:=CreateTabGrid(RemoveFileExtension(ExtractFileName(AFileName)),MaxRow,MaxCol);

      y:=1;
      for x:=0 to MaxCol-1 do
          tmpGrid.Cells[1+x,y]:=FADOT.Fields[x].FieldName;

      Inc(y);

      FADOT.First;
      while not FADOT.Eof do
      begin
        for x:=0 to MaxCol-1 do
            tmpGrid.Cells[1+x,y]:=FADOT.Fields[x].AsString;

        UpdateProgress((y*100) div (maxRow+2));

        if CancelLoading then
           break;

        FADOT.Next;
        Inc(y);
      end;

    finally
      FADOT.Free;

      ProgressBar1.Visible:=False;
      BCancelLoad.Visible:=False;
    end;

    {$ENDIF}
  end;

  procedure ImportText;
  var x,y,
      MaxRow,
      MaxCol : Integer;
      Old,
      s : String;
      tmpGrid : TStringGrid;
  begin
     MaxRow:=FTextFile.Count; // <-- Before calling GuessDelimiter

     Old:=TeeFieldsSeparator;
     TeeFieldsSeparator:=GuessDelimiter(MaxRow);  // <-- Before calling TextColumns
     try

       // Create StringGrid and parse text file contents into cells:

       MaxCol:=TextColumns;

       tmpGrid:=CreateTabGrid(RemoveFileExtension(ExtractFileName(AFileName)),MaxRow,MaxCol);

       PrepareProgressBar(MaxCol*MaxRow);

       for y:=0 to MaxRow-1 do
       begin
         s:=FTextFile[y];

         for x:=1 to MaxCol do
         begin
           tmpGrid.Cells[x,y+1]:=RemoveQuotes(TeeExtractField(s,x));

           if CancelLoading then
              break;
         end;

         UpdateProgress((y*100) div (MaxRow-1));

         if CancelLoading then
            break;
       end;

     finally
       TeeFieldsSeparator:=Old;
     end;
  end;

  procedure ImportTee;
  var x,y,
      MaxRow,
      MaxCol : Integer;
      tmpGrid : TStringGrid;
  begin
    // Create TStringGrid and copy all cells from ChartGrid:

    MaxRow:=FChartGrid.RowCount;
    MaxCol:=FChartGrid.ColCount;
    tmpGrid:=CreateTabGrid(RemoveFileExtension(ExtractFileName(AFileName)),MaxRow,MaxCol);

    for y:=1 to MaxRow-1 do
        for x:=1 to MaxCol-1 do
            tmpGrid.Cells[x,y]:=TGridAccess(FChartGrid).GetEditText(x,y);
  end;

begin
  case CBFormat.ItemIndex of
    0: ImportExcel;
    1: ImportAccess;
    2: ImportText;
    3: ImportTee;
  end;
end;

function SelectionEquals(const A,B:TGridRect):Boolean;
begin
  result:=(A.Left=B.Left) and (A.Top=B.Top) and (A.Right=B.Right) and (A.Bottom=B.Bottom);
end;

procedure TImport_Form.FormDestroy(Sender: TObject);
begin
  FTextFile.Free;
  FTempChart.Free;
  FChartGrid.Free;

  {$IFDEF TEEENTERPRISE}
  FADOC.Free;
  {$ENDIF}

  if not VarIsEmpty(Excel) then
  begin
    //ExcelApp.DisplayAlerts:=False;
    Excel.Quit;
  end;
end;

procedure TImport_Form.GridMove(Sender: TObject; Shift: TShiftState; X, Y: Integer);
begin
  GridChangedSelection;
end;

procedure TImport_Form.GridKeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
begin
  GridChangedSelection;
end;

procedure TImport_Form.GridChangedSelection;

  function Coord(X,Y:Integer):String;
  begin
    result:=CoordSt(X)+IntToStr(Y);
  end;

var w,h:Integer;
begin
  with Grid.Selection do
  begin
    w:=1+Right-Left;
    h:=1+Bottom-Top;

    ISelecting:=True;

    EStart.Text:=Coord(Left,Top);
    EEnd.Text:=Coord(Right,Bottom);

    ISelecting:=False;
  end;

  BOk.Enabled:=(w>0) or (h>0);
  ByRows.Visible:=(w>1) and (h>1);

  if SBChart.Down then
     if not SelectionEquals(OldSelection,Grid.Selection) then
     begin
       FillGrid(PageControl1.ActivePage.Caption,Grid,Chart1,ByRows.Checked);
       OldSelection:=Grid.Selection;
     end;
end;

function ParseCoord(S:String; out x,y:Integer):Boolean;
const
  AToZ=['A'..'Z'];

var t : Integer;
begin
  result:=False;

  x:=0;

  for t:=1 to Length(S) do
      if {$IFDEF D14}CharInSet(S[t],AToZ){$ELSE}S[t] in AToZ{$ENDIF} then
      begin
        x:=x*32+Ord(S[t]);
      end
      else
      begin
        if TryStrToInt(Copy(S,t,Length(S)),y) then
           result:=True;

        break;
      end;
end;

function GridRect(const Left,Top,Right,Bottom:Integer):TGridRect;
begin
  result.Left:=Left;
  result.Top:=Top;
  result.Right:=Right;
  result.Bottom:=Bottom;
end;

procedure TImport_Form.SelectGrid(const Left,Top,Right,Bottom:Integer; const Shift:TShiftState=[]);
var A : TGridRect;
begin
  if ssCtrl in Shift then
  begin
    A:=Grid.Selection;
    Grid.Selection:=GridRect(Min(A.Left,Left),Min(A.Top,Top),Max(A.Right,Right),Max(A.Bottom,Bottom));
  end
  else
     Grid.Selection:=GridRect(Left,Top,Right,Bottom);

  ByRows.Visible:=((Right-Left)>1) and ((Bottom-Top)>1);

  RefreshChart;
end;

procedure TImport_Form.EStartChange(Sender: TObject);
var x,y : Integer;
begin
  if not ISelecting then
     if ParseCoord(EStart.Text,X,Y) then
        SelectGrid(X,Y,Grid.Selection.Right,Grid.Selection.Bottom);
end;

procedure TImport_Form.EEndChange(Sender: TObject);
var x,y : Integer;
begin
  if not ISelecting then
     if ParseCoord(EEnd.Text,X,Y) then
        SelectGrid(Grid.Selection.Left,Grid.Selection.Top,X,Y);
end;

procedure TImport_Form.RefreshChart;
begin
  if Chart1.Visible and (Grid<>nil) then
     FillGrid(PageControl1.ActivePage.Caption,Grid,Chart1,ByRows.Checked);
end;

procedure TImport_Form.SBChartClick(Sender: TObject);
begin
  Chart1.Visible:=SBChart.Down;
  Splitter1.Visible:=Chart1.Visible;

  // Trick to reset splitter position:
  if Splitter1.Visible then
  begin
    Splitter1.Align:=alLeft;
    Splitter1.Align:=alRight;
  end;

  RefreshChart;
end;

class procedure TImport_Form.FillGrid(const ATitle:String; const AGrid:TStringGrid;
               const AChart:TCustomChart; ByRows:Boolean=True; RemoveSeries:Boolean=True);

type
  TGuessText=record
    Text : Boolean;
    ValueCount,
    Header : Integer;
  end;

var
   w,h : Integer;

  function BestSeries(const ACount:Integer):TChartSeriesClass;
  begin
    if ACount<10 then
       result:=TBarSeries
    else
    if ACount<100 then
       result:=TLineSeries
    else
       result:=TFastLineSeries;
  end;

  procedure TryAdd(S:String; const AText:String='');
  var tmp : Double;
  begin
    if (S<>'') and TryStrToFloat(S,tmp) then
       AChart.SeriesList.Last.Add(tmp,AText);
  end;

  function IsColText(x,y0,y1:Integer):TGuessText;
  var tmpCount,
      y : Integer;
      tmp : Double;
      S: String;
  begin
    result.Text:=False;
    result.Header:=-1;
    result.ValueCount:=0;

    tmpCount:=0;

    for y:=y0 to y1 do
    begin
      S:=AGrid.Cells[x,y];

      if S<>'' then
         if TryStrToFloat(S,tmp) then
            Inc(result.ValueCount)
         else
         begin
           Inc(tmpCount);

           if tmpCount>1 then
              result.Text:=True
           else
              result.Header:=y;
         end;
    end;
  end;

  function IsRowText(y,x0,x1:Integer):TGuessText;
  var tmpCount,
      x : Integer;
      tmp : Double;
      S: String;
  begin
    result.Text:=False;
    result.Header:=-1;
    result.ValueCount:=0;

    tmpCount:=0;

    for x:=x0 to x1 do
    begin
      S:=AGrid.Cells[x,y];

      if S<>'' then
         if TryStrToFloat(S,tmp) then
            Inc(result.ValueCount)
         else
         begin
           Inc(tmpCount);

           if tmpCount>1 then
              result.Text:=True
           else
              result.Header:=x;
         end;
    end;
  end;

  procedure SetSeriesTitle(const S:String);
  var tmp : TChartSeries;
  begin
    tmp:=AChart.SeriesList.Last;
    tmp.Title:=S;

    if tmp.YMandatory then
       tmp.GetHorizAxis.Title.Caption:=S
    else
       tmp.GetVertAxis.Title.Caption:=S;
  end;

  procedure SetSeriesNonAxisTitle(const S:String);
  var tmp : TChartSeries;
  begin
    tmp:=AChart.SeriesList.Last;

    if tmp.YMandatory then
       tmp.GetVertAxis.Title.Caption:=S
    else
       tmp.GetHorizAxis.Title.Caption:=S;
  end;

var
  AnyText : Integer;
  IsText  : Array of TGuessText;

  procedure GuessColumns;
  var x : Integer;
  begin
    SetLength(IsText,w);

    for x:=AGrid.Selection.Left to AGrid.Selection.Right do
    begin
      IsText[x-AGrid.Selection.Left]:=IsColText(x,AGrid.Selection.Top,AGrid.Selection.Bottom);

      if IsText[x-AGrid.Selection.Left].Text then
         AnyText:=x;
    end;
  end;

  procedure GuessRows;
  var y : Integer;
  begin
    SetLength(IsText,h);

    for y:=AGrid.Selection.Top to AGrid.Selection.Bottom do
    begin
      IsText[y-AGrid.Selection.Top]:=IsRowText(y,AGrid.Selection.Left,AGrid.Selection.Right);

      if IsText[y-AGrid.Selection.Top].Text then
         AnyText:=y;
    end;
  end;

  procedure AddSeries(ValueCount:Integer);
  begin
    AChart.AddSeries(BestSeries(ValueCount)).Marks.Style:=smsValue;
  end;

var x,y,
    tmpHeader,
    t : Integer;
    S : String;
    tmp : Double;
    tmpText : TGuessText;
begin
  if RemoveSeries then
     AChart.FreeAllSeries;

  AChart.Title.Caption:='';
  AChart.Axes.Left.Title.Caption:='';
  AChart.Axes.Bottom.Title.Caption:='';

  AnyText:=-1;

  w:=AGrid.Selection.Right-AGrid.Selection.Left+1;
  h:=AGrid.Selection.Bottom-AGrid.Selection.Top+1;

  AChart.Title.Caption:='';

  if (w=1) and (h=1) then
  begin
    S:=AGrid.Cells[AGrid.Selection.Left,AGrid.Selection.Top];

    if S<>'' then
       if TryStrToFloat(S,tmp) then
       begin
         AddSeries(1);
         TryAdd(S);
       end
       else
          AChart.Title.Caption:=S;
  end
  else
  if w=1 then
  begin
    tmpText:=IsColText(AGrid.Selection.Left,AGrid.Selection.Top,AGrid.Selection.Bottom);

    if not tmpText.Text then
    if tmpText.ValueCount>0 then
    begin
      AddSeries(tmpText.ValueCount);

      for t:=AGrid.Selection.Top to AGrid.Selection.Bottom do
          TryAdd(AGrid.Cells[AGrid.Selection.Left,t]);

      if tmpText.Header<>-1 then
         SetSeriesTitle(AGrid.Cells[AGrid.Selection.Left,tmpText.Header]);
    end;
  end
  else
  if h=1 then
  begin
    tmpText:=IsRowText(AGrid.Selection.Top,AGrid.Selection.Left,AGrid.Selection.Right);

    if not tmpText.Text then
    if tmpText.ValueCount>0 then
    begin
      AddSeries(tmpText.ValueCount);

      for t:=AGrid.Selection.Left to AGrid.Selection.Right do
          TryAdd(AGrid.Cells[t,AGrid.Selection.Top]);

      if tmpText.Header<>-1 then
         SetSeriesTitle(AGrid.Cells[tmpText.Header,AGrid.Selection.Top]);
    end;
  end
  else
  if (w>1) and (h>1) then
  begin
     if ByRows then
     begin
       GuessColumns;

       for x:=AGrid.Selection.Left to AGrid.Selection.Right do
       begin
         tmpText:=IsText[x-AGrid.Selection.Left];

         if not tmpText.Text then
         if tmpText.ValueCount>0 then
         begin
           AddSeries(tmpText.ValueCount);

           for y:=AGrid.Selection.Top to AGrid.Selection.Bottom do
             if AnyText<>-1 then
                TryAdd(AGrid.Cells[x,y],AGrid.Cells[AnyText,y])
             else
                TryAdd(AGrid.Cells[x,y]);

           tmpHeader:=tmpText.Header;

           if tmpHeader<>-1 then
              SetSeriesTitle(AGrid.Cells[x,tmpHeader]);

           if AnyText<>-1 then
           begin
             tmpHeader:=IsText[AnyText-AGrid.Selection.Left].Header;

             if (tmpHeader<>-1) and (IsText[x-AGrid.Selection.Left].Header<>-1) then
                SetSeriesNonAxisTitle(AGrid.Cells[AnyText,tmpHeader]);
           end;
         end;
       end;

     end
     else
     begin
       GuessRows;

       for y:=AGrid.Selection.Top to AGrid.Selection.Bottom do
       begin
         tmpText:=IsText[y-AGrid.Selection.Top];

         if not tmpText.Text then
         if tmpText.ValueCount>0 then
         begin
           AddSeries(tmpText.ValueCount);

           for x:=AGrid.Selection.Left to AGrid.Selection.Right do
             if AnyText<>-1 then
                TryAdd(AGrid.Cells[x,y],AGrid.Cells[x,AnyText])
             else
                TryAdd(AGrid.Cells[x,y]);

           tmpHeader:=tmpText.Header;

           if tmpHeader<>-1 then
              SetSeriesTitle(AGrid.Cells[tmpHeader,y]);

           if AnyText<>-1 then
           begin
             tmpHeader:=IsText[AnyText-AGrid.Selection.Top].Header;

             if (tmpHeader<>-1) and (IsText[y-AGrid.Selection.Top].Header<>-1) then
                SetSeriesNonAxisTitle(AGrid.Cells[tmpHeader,AnyText]);
           end;

         end;
       end;
     end;

     IsText:=nil;
  end;

  if AChart.Title.Caption='' then
     AChart.Title.Caption:=ATitle;

  if RemoveSeries and (AChart.SeriesCount>0) then
     AChart.Legend.Visible:=not (AChart[0] is TFastLineSeries);
end;

procedure TImport_Form.ByRowsClick(Sender: TObject);
begin
  RefreshChart;
end;

procedure TImport_Form.PageControl1Change(Sender: TObject);
begin
  RefreshChart;
end;

procedure TImport_Form.FillChart(const AChart: TCustomChart; RemoveSeries:Boolean=True);
begin
  FillGrid(PageControl1.ActivePage.Caption,Grid,AChart,ByRows.Checked,RemoveSeries);
end;

procedure TImport_Form.RemoveTabs;
begin
  while PageControl1.PageCount>0 do
        PageControl1.Pages[0].Free;
end;

procedure TImport_Form.SBEditGridClick(Sender: TObject);
begin
  if SBEditGrid.Down then
  begin
    Grid.Options:=Grid.Options+[goEditing];
    Grid.EditorMode:=True;
  end
  else
  begin
    Grid.Options:=Grid.Options-[goEditing];
    Grid.EditorMode:=False;
  end;
end;

procedure TImport_Form.GridMouseUp(Sender: TObject;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
var Row,
    Col : Integer;
begin
  Grid.MouseToCell(X,Y,Col,Row);

  if (Row=0) and (Col=0) then
     Grid.Selection:=GridRect(1,1,Grid.ColCount-1,Grid.RowCount-1)
  else
  if Row=0 then
  begin
    if Col<>-1 then
       SelectGrid(Col,1,Col,Grid.RowCount-1,Shift)
  end
  else
  if Col=0 then
  begin
    if Row<>-1 then
       SelectGrid(1,Row,Grid.ColCount-1,Row,Shift);
  end;
end;

procedure TImport_Form.SpeedButton1Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    if CBFile.Items.IndexOf(OpenDialog1.FileName)=-1 then
       CBFile.Items.Add(OpenDialog1.FileName);

    CBFile.Text:=OpenDialog1.FileName;

    EnableOpen;
  end;
end;

procedure TImport_Form.AddOpenFilter;
begin
  case CBFormat.ItemIndex of
    0: begin
         OpenDialog1.Filter:='Microsoft Excel files (*.xls;*.xlsx)|*.xls;*.xlsx';
         OpenDialog1.DefaultExt:='xlsx';
       end;
    1: begin
         OpenDialog1.Filter:='Microsoft Access files (*.mdb;*.accdb)|*.mdb;*.accdb';
         OpenDialog1.DefaultExt:='mdb';
       end;
    2: begin
         OpenDialog1.Filter:='Text files (*.txt;*.csv)|*.txt;*.csv';
         OpenDialog1.DefaultExt:='txt';
       end;
  else
       begin
         OpenDialog1.Filter:='TeeChart files (*.tee)|*.tee';
         OpenDialog1.DefaultExt:='tee';
       end;
  end;
end;

procedure TImport_Form.CBFormatChange(Sender: TObject);
var tmp : String;

  procedure AddFiles(const Ext:String);
  var t : Integer;
  begin
    with TeeGetFilesFromDir(tmp+'\*.'+Ext) do
    try
      for t:=0 to Count-1 do
          CBFile.Items.Add(tmp+'\'+Strings[t]);
    finally
      Free;
    end;
  end;

begin
  AddOpenFilter;

  // Pending: Reload from registry last used files.
  // And add files from "Data" folder, filtered by extension.

  if DirectoryExists('Data') then
     tmp:='Data'
  else
  if DirectoryExists('..\Data') then
     tmp:='..\Data';

  CBFile.Items.Clear;

  case CBFormat.ItemIndex of
    0: begin
         AddFiles('xls');
         //AddFiles('xlsx');  <-- *.xls also finds *.xlsx
       end;
    1: begin
         AddFiles('mdb');
         AddFiles('accdb');
       end;
    2: begin
         AddFiles('txt');
         AddFiles('csv');
       end;
    3: AddFiles('tee');
  end;

  CBFile.ItemIndex:=0;

  EnableOpen;

  PanelADO.Visible:=CBFormat.ItemIndex=1; // Database options
  PanelText.Visible:=CBFormat.ItemIndex=2; // Text options
end;

procedure TImport_Form.FormCloseQuery(Sender: TObject;
  var CanClose: Boolean);
begin
  CanClose:=(PageControl1.PageCount=0) or
            (ModalResult=mrOk) or TeeYesNo('Are you sure to cancel importing data?');
end;

procedure TImport_Form.CBDelimiterChange(Sender: TObject);
begin
  case CBDelimiter.ItemIndex of
    0: Delimiter:='';
    1: Delimiter:=TeeTabDelimiter;
    2: Delimiter:=',';
    3: Delimiter:=':';
    4: Delimiter:=';';
    5: Delimiter:='|';
  else
    Delimiter:=EDelim.Text;
  end;

  EDelim.Text:=Delimiter;
  EDelim.Enabled:=CBDelimiter.ItemIndex=6; // Custom

  ParseContents(FLoadedFileName);
end;

procedure TImport_Form.EDelimChange(Sender: TObject);
begin
  Delimiter:=EDelim.Text;

  if Delimiter='' then
     CBDelimiter.ItemIndex:=0
  else
  if Delimiter=TeeTabDelimiter then
     CBDelimiter.ItemIndex:=1
  else
  if Delimiter=',' then
     CBDelimiter.ItemIndex:=2
  else
  if Delimiter=':' then
     CBDelimiter.ItemIndex:=3
  else
  if Delimiter=';' then
     CBDelimiter.ItemIndex:=4
  else
  if Delimiter='|' then
     CBDelimiter.ItemIndex:=5;
end;

procedure TImport_Form.BCancelLoadClick(Sender: TObject);
begin
  CancelLoading:=True;
end;

procedure TImport_Form.CBTablesChange(Sender: TObject);
begin
  ParseContents(FLoadedFileName);
end;

procedure ClearCells(const Grid:TStringGrid; x0,y0,x1,y1:Integer);
var x,y : Integer;
begin
  for y:=y0 to y1 do
      for x:=x0 to x1 do
          Grid.Cells[x,y]:='';
end;

procedure AppendRow(const Grid:TStringGrid);
begin
  Grid.RowCount:=Grid.RowCount+1;
  Grid.Cells[0,Grid.RowCount-1]:=IntToStr(Grid.RowCount-1);
end;

procedure MoveRows(const Grid:TStringGrid; Y0,Y1,Offset:Integer);

  procedure MoveRow(Y:Integer);
  var x : Integer;
  begin
    for x:=1 to Grid.ColCount-1 do
        Grid.Cells[x,y+Offset]:=Grid.Cells[x,y];
  end;

var y : Integer;
begin
  if Offset<0 then
  for y:=Y0 to Y1 do
      MoveRow(y)
  else
  for y:=Y1 downto Y0 do
      MoveRow(y);
end;

procedure InsertRow(const Grid:TStringGrid; Offset:Integer);
begin
  AppendRow(Grid);

  MoveRows(Grid,Grid.Row,Grid.RowCount-1,1);

  if Offset>0 then
     Grid.Row:=Grid.Row+1;

  // Clear new row
  ClearCells(Grid,1,Grid.Row,Grid.ColCount-1,Grid.Row);
end;

procedure AppendColumn(const Grid:TStringGrid);
begin
  Grid.ColCount:=Grid.ColCount+1;
  Grid.Cells[Grid.ColCount-1,0]:=CoordSt(Grid.ColCount-1);
end;

procedure MoveColumns(const Grid:TStringGrid; X0,X1,Offset:Integer);

  procedure MoveCol(X:Integer);
  var y : Integer;
  begin
    for y:=1 to Grid.RowCount-1 do
        Grid.Cells[X+Offset,y]:=Grid.Cells[x,y];
  end;

var x : Integer;
begin
  if Offset<0 then
  for x:=X0 to X1 do
      MoveCol(x)
  else
  for x:=X1 downto X0 do
      MoveCol(x);
end;

procedure InsertColumn(const Grid:TStringGrid; Offset:Integer);
begin
  AppendColumn(Grid);

  MoveColumns(Grid,Grid.Col,Grid.ColCount-1,1);

  if Offset>0 then
     Grid.Col:=Grid.Col+1;

  ClearCells(Grid,Grid.Col,1,Grid.Col,Grid.RowCount-1);
end;

procedure CopyGrid(const Grid:TStringGrid);
var S : String;
    x,y : Integer;
begin
  S := '';

  with Grid.Selection do
  for y:=Top to Bottom do
  begin
      for x:=Left to Right do
      begin
        S:=S+Grid.Cells[x,y];

       if x<Right then
         S := S + Chr(9);
      end;

      if y<Bottom then
         S:=S+#13#10;
   end;

  TeeCopyClipboard(S);
end;

procedure PasteGrid(const Grid:TStringGrid);
var
  x,y : Integer;
  tmp : String;

  procedure SetCell;
  begin
    Grid.Cells[x,y]:=RemoveQuotes(tmp);
  end;

var S : String;
    t : Integer;
begin
  S:=Clipboard.AsText;

  x:=Grid.Col;
  y:=Grid.Row;

  tmp:='';

  for t:=1 to Length(S) do
  begin
    if S[t]=#9 then
    begin
      SetCell;
      tmp:='';

      Inc(x);

      if x>Grid.ColCount-1 then
         AppendColumn(Grid);
    end
    else
    if (S[t]=#13) or (S[t]=#10) then
    begin
      SetCell;
      tmp:='';

      x:=Grid.Col;
      Inc(y);

      if y>Grid.RowCount-1 then
         AppendRow(Grid);

      // Skip next #10 (CRLF) or #13 (LFCR)

      if t+1<Length(S) then
         if (S[t+1]=#13) or (S[t+1]=#10) then
            S[t+1]:=#0; // skip
    end
    else
    begin
      if S[t]<>#0 then
         tmp:=tmp+S[t];
    end;
  end;

  if tmp<>'' then
     SetCell;
end;

procedure TImport_Form.Above1Click(Sender: TObject);
begin
  InsertRow(Grid,-1);
end;

procedure TImport_Form.Below1Click(Sender: TObject);
begin
  InsertRow(Grid,1);
end;

procedure TImport_Form.Before1Click(Sender: TObject);
begin
  InsertColumn(Grid,-1);
end;

procedure TImport_Form.After1Click(Sender: TObject);
begin
  InsertColumn(Grid,1);
end;

procedure TImport_Form.Delete1Click(Sender: TObject);
begin
  with Grid.Selection do
       ClearCells(Grid,Left,Top,Right,Bottom);
end;

procedure TImport_Form.Cut1Click(Sender: TObject);
begin
  CopyGrid(Grid);
  Delete1Click(Sender);
end;

procedure TImport_Form.Copy1Click(Sender: TObject);
begin
  CopyGrid(Grid);
end;

procedure TImport_Form.Paste1Click(Sender: TObject);
begin
  PasteGrid(Grid);
end;

procedure TImport_Form.PopupGridPopup(Sender: TObject);
begin
  Paste1.Enabled:=(Grid.Col>0) and (Grid.Row>0) and (Clipboard.AsText<>'');

  DeleteRow1.Enabled:=(Grid.Row>0) and (Grid.RowCount>2);
  DeleteColumn1.Enabled:=(Grid.Col>0) and (Grid.ColCount>2);
end;

procedure TImport_Form.DeleteRow1Click(Sender: TObject);
var y : Integer;
begin
  MoveRows(Grid,Grid.Row+1,Grid.RowCount-1,-1);
  Grid.RowCount:=Grid.RowCount-1;

  for y:=Grid.Row to Grid.RowCount-1 do
      Grid.Cells[0,y]:=IntToStr(y);
end;

procedure TImport_Form.DeleteColumn1Click(Sender: TObject);
var x : Integer;
begin
  MoveColumns(Grid,Grid.Col+1,Grid.ColCount-1,-1);
  Grid.ColCount:=Grid.ColCount-1;

  for x:=Grid.Col to Grid.ColCount-1 do
      Grid.Cells[x,0]:=CoordSt(x);
end;

end.
