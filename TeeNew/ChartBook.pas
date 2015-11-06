unit ChartBook;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeChartBook, TeeThemes;

type
  TChartBookForm = class(TForm)
    Memo1: TMemo;
    Panel1: TPanel;
    Label1: TLabel;
    ComboFlat1: TComboFlat;
    CheckBox1: TCheckBox;
    Button1: TButton;
    Button2: TButton;
    Splitter1: TSplitter;
    procedure FormCreate(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Book : TChartBook;
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartBookForm.FormCreate(Sender: TObject);
begin
  Book:=TChartBook.Create(Self);

  with Book do
  begin
    Parent:=Self;
    Align:=alClient;
    ShowToolbar:=True;

    HotTrack:=True;

    AddChart.AddSeries(TLineSeries).FillSampleValues;
    AddChart.AddSeries(TBarSeries).FillSampleValues;
    AddChart.AddSeries(TAreaSeries).FillSampleValues;
    AddChart.AddSeries(TPieSeries).FillSampleValues;

    {$IFDEF CLX}
    Label1.Visible:=False;
    ComboFlat1.Visible:=False;
    {$ELSE}
    TabPosition:=tpLeft;
    {$ENDIF}

    ActiveToolbar.BevelInner:=bvNone;
    ActiveToolbar.BevelOuter:=bvNone;
    ActiveToolbar.Gradient.Visible:=True;
    ActiveToolbar.Gradient.EndColor:=clDkGray;
  end;
end;

procedure TChartBookForm.ComboFlat1Change(Sender: TObject);
begin
  {$IFNDEF CLX}
  Book.TabPosition:=TTabPosition(ComboFlat1.ItemIndex);
  {$ENDIF}
end;

procedure TChartBookForm.CheckBox1Click(Sender: TObject);
begin
  Book.ShowToolbar:=CheckBox1.Checked;
end;

procedure TChartBookForm.Button2Click(Sender: TObject);
begin
  Book.ActivePage.Free;
end;

procedure TChartBookForm.Button1Click(Sender: TObject);
var tmp : TChartSeries;
begin
  tmp:=Book.AddChart.AddSeries(TLineSeries);
  tmp.FillSampleValues;

  tmp.Color:=RGB(Random(255),Random(255),Random(255));

  // Show last added tab
  with Book do
       ActivePage:=Pages[PageCount-1];
end;

initialization
  RegisterClass(TChartBookForm);
end.
