unit Marks_Positions;
{$I TeeDefs.inc}

interface

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
  {$ENDIF}
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TMarksPositions = class(TBaseForm)
    Series1: TPieSeries;
    ChartTool1: TDragMarksTool;
    Button1: TSpeedButton;
    Button2: TSpeedButton;
    OpenDialog1: TOpenDialog;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

Uses TeeEditPro, TeeStore;

procedure TMarksPositions.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(5);
end;

procedure TMarksPositions.Button1Click(Sender: TObject);
begin
  SaveChartDialog(Chart1);
end;

procedure TMarksPositions.Button2Click(Sender: TObject);
{$IFDEF CLR}
var tmp : TCustomChart;
{$ENDIF}
begin
  inherited;
  With OpenDialog1 do
   if Execute then 
   begin
     {$IFDEF CLR}
     tmp:=TCustomChart(Chart1);
     LoadChartFromFile(tmp,FileName);
     Chart1:=TChart(tmp);
     {$ELSE}
     LoadChartFromFile(TCustomChart(Chart1),FileName);
     {$ENDIF}
   end;
end;

initialization
  RegisterClass(TMarksPositions);
end.
