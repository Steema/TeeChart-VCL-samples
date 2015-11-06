unit Tool_PageNumDemo;
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
  Base, TeeEdiGene, Series, TeEngine, TeeProcs, Chart, TeePageNumTool,
  TeeTools, TeeNavigator;

type
  TPageNumToolDemo = class(TBaseForm)
    Series1: TPointSeries;
    Series2: TLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    Label2: TLabel;
    ComboBox1: TComboBox;
    ChartPageNavigator1: TChartPageNavigator;
    Label3: TLabel;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    PageTool : TPageNumTool;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar, TeeBrushDlg;

procedure TPageNumToolDemo.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(50);

  // Create page num tool:
  PageTool:=TPageNumTool.Create(Self);
  PageTool.ParentChart:=Chart1;
  PageTool.Shape.Font.Color:=clRed;
  PageTool.Shape.Shadow.Size:=1;
  PageTool.Shape.Shadow.Color:=clDkGray;

  Edit1.Text:=PageTool.Format;
end;

procedure TPageNumToolDemo.Edit1Change(Sender: TObject);
begin
  PageTool.Format:=Edit1.Text;
end;

procedure TPageNumToolDemo.ComboBox1Change(Sender: TObject);
begin
  PageTool.Position:=TAnnotationPosition(ComboBox1.ItemIndex);
end;

procedure TPageNumToolDemo.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,PageTool);
end;

procedure TPageNumToolDemo.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=0;
end;

initialization
  RegisterClass(TPageNumToolDemo);
end.
