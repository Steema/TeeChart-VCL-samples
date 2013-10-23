unit Tools_Image;
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
  {$IFNDEF LINUX}
  {$IFNDEF CLR}
  Jpeg,
  {$ENDIF}
  {$ENDIF}
  Base, TeEngine, Series, TeeTools, TeeProcs, Chart, TeeSurfa;

type
  TImageToolForm = class(TBaseForm)
    ChartTool1: TChartImageTool;
    Series1: TContourSeries;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Series2: TPointSeries;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    OldZoom : Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TImageToolForm.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;
  OldZoom:=-1;

  Series1.FillSampleValues(20);

  With Series2 do
  begin
    Clear;
    for t:=1 to 50 do 
        AddXY(1+{$IFNDEF CLR}System.{$ENDIF}Random(20),
              1+{$IFNDEF CLR}System.{$ENDIF}Random(20));
  end;
end;

procedure TImageToolForm.ScrollBar1Change(Sender: TObject);
begin
  if ScrollBar1.Position>OldZoom then
     Chart1.ZoomPercent(105)
  else
     Chart1.ZoomPercent(95);
  OldZoom:=ScrollBar1.Position;
end;

procedure TImageToolForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

procedure TImageToolForm.CheckBox1Click(Sender: TObject);
begin
  ChartTool1.Active:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TImageToolForm);
end.
