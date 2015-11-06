unit ChartEditor_Options;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeEdit, TeeComma;

type
  TChartEditorOptions = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    ChartEditor1: TChartEditor;
    GroupBox1: TGroupBox;
    GroupBox2: TGroupBox;
    Button1: TButton;
    GroupBox3: TGroupBox;
    GroupBox4: TGroupBox;
    Label1: TLabel;
    EEditorSizeHeight: TEdit;
    UpDown2: TUpDown;
    UpDown1: TUpDown;
    EEditorSizeWidth: TEdit;
    Label3: TLabel;
    Label2: TLabel;
    EEditorGalleryHeight: TEdit;
    UpDown3: TUpDown;
    UpDown4: TUpDown;
    EEditorGalleryWidth: TEdit;
    Label4: TLabel;
    Label5: TLabel;
    EEditorCustGalleryWidth: TEdit;
    UpDown5: TUpDown;
    Label6: TLabel;
    EEditorCustGalleryHeight: TEdit;
    UpDown6: TUpDown;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure EditorSizeChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses TeeGally;

procedure TChartEditorOptions.FormCreate(Sender: TObject);
begin
  inherited;
  ChartEditor1.Width:=StrToIntDef(EEditorSizeWidth.Text,0);
  ChartEditor1.Height:=StrToIntDef(EEditorSizeHeight.Text,0);
  ChartEditor1.GalleryWidth:=StrToIntDef(EEditorGalleryWidth.Text,0);
  ChartEditor1.GalleryHeight:=StrToIntDef(EEditorGalleryHeight.Text,0);
end;

procedure TChartEditorOptions.Button1Click(Sender: TObject);
begin
  ChartEditor1.Execute;
end;

procedure TChartEditorOptions.Button2Click(Sender: TObject);
begin
  CreateNewSeriesGallery( Self.Owner,
                          Chart1,
                          StrToIntDef(EEditorCustGalleryWidth.Text,0),
                          StrToIntDef(EEditorCustGalleryHeight.Text,0) )
end;

procedure TChartEditorOptions.EditorSizeChange(Sender: TObject);
begin
  inherited;
  ChartEditor1.Width:=StrToIntDef(EEditorSizeWidth.Text,0);
  ChartEditor1.Height:=StrToIntDef(EEditorSizeHeight.Text,0);
  ChartEditor1.GalleryWidth:=StrToIntDef(EEditorGalleryWidth.Text,0);
  ChartEditor1.GalleryHeight:=StrToIntDef(EEditorGalleryHeight.Text,0);
end;

initialization
  RegisterClass(TChartEditorOptions);
end.
