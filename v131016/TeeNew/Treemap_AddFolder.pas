unit Treemap_AddFolder;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSurfa, TeeTernary,
  TeeOrgSeries, TeeTreeMapSeries;

type
  TTreemapAddFolderForm = class(TBaseForm)
    Button1: TButton;
    ChartTool1: TMarksTipTool;
    Series1: TTreeMapSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
  private
    { Private declarations }
    procedure FindFiles(const Path, Mask: string; IncludeSubDir: Boolean;
                      const Parent: Integer);
    procedure AddFolder(Path: String; IncludeSubDir: Boolean=True);
  public
    { Public declarations }
  end;

var
  TreemapAddFolderForm: TTreemapAddFolderForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  {$IFNDEF D6}FileCtrl,{$ENDIF}
  TeePenDlg;

procedure TTreemapAddFolderForm.Button1Click(Sender: TObject);
var tmpDir : String;
begin
  tmpDir:='';
  if TeeSelectFolder('Folder to plot as a TreeMap','',tmpDir) then
  begin
    Chart1.Title.Text[0]:=tmpDir;
    AddFolder(tmpDir, CheckBox1.Checked);
  end
end;

procedure TTreemapAddFolderForm.FormCreate(Sender: TObject);
begin
  inherited;

  ComboBox1.ItemIndex:=0;

  Chart1.Legend.Visible:=False;
  Chart1.Title.Text[0]:='Choose a folder to plot';

  Series1.Palette.UseColorRange:=False;
  Series1.Palette.UsePalette:=True;
  Series1.Palette.PaletteStyle:=psPale;
end;

procedure TTreemapAddFolderForm.ComboBox1Change(Sender: TObject);
begin
  Series1.MapStyle:=TTreeMapTiling(ComboBox1.ItemIndex);
end;

procedure TTreemapAddFolderForm.Series1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
var t : Integer;
begin
  for t:=0 to Series1.Count-1 do
    Series1[t].Format.Gradient.Visible:=t=ValueIndex;
end;

procedure TTreemapAddFolderForm.AddFolder(Path: String; IncludeSubDir: Boolean);
begin
  if LastDelimiter('\', Path) <> Length(Path) then
    Path:=Path+'\';

  if DirectoryExists(Path) then
  begin
    Series1.Clear;
    Series1.Add(0, Path, -1);
    FindFiles(Path, '*.*', IncludeSubDir, 0);
  end
  else
    ShowMessage(Path + ' does not exist');
end;

procedure TTreemapAddFolderForm.FindFiles(const Path, Mask: string;
                              IncludeSubDir: boolean; const Parent: Integer);
var
  FindResult: Integer;
  SearchRec : TSearchRec;
  tmpPath   : String;
  tmpIndex  : Integer;
begin
  FindResult := FindFirst(Path + Mask, faAnyFile - faDirectory, SearchRec);
  while FindResult = 0 do
  begin
    { do whatever you'd like to do with the files found }
    Series1.Add(SearchRec.Size, SearchRec.Name, Parent);
    Series1.YValues[Parent]:=Series1.YValues[Parent] + SearchRec.Size;

    FindResult := FindNext(SearchRec);
  end;
  { free memory }
  FindClose(SearchRec);

  if not IncludeSubDir then
    Exit;

  FindResult := FindFirst(Path + '*.*', faDirectory, SearchRec);
  while FindResult = 0 do
  begin
    if (SearchRec.Name <> '.') and (SearchRec.Name <> '..') then
    begin
      tmpPath:=Path + SearchRec.Name + '\';

      {tmpPath is a directory?}
      if DirectoryExists(tmpPath) then
      begin
        tmpIndex:=Series1.Add(SearchRec.Size, SearchRec.Name, Parent);
        FindFiles (tmpPath, Mask, True, tmpIndex);
      end;
    end;

    FindResult := FindNext(SearchRec);
  end;

  { free memory }
  FindClose(SearchRec);
end;

initialization
  RegisterClass(TTreemapAddFolderForm);
end.
