unit Tool_CursorProg;
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
  Base, TeEngine, TeeTools, Series, TeeProcs, Chart;

type
  TCursorToolProg = class(TBaseForm)
    ButtonLeft: TButton;
    ButtonRight: TButton;
    ButtonTop: TButton;
    ButtonBottom: TButton;
    Series1: TPointSeries;
    ChartTool1: TCursorTool;
    procedure ButtonLeftClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonRightClick(Sender: TObject);
    procedure ButtonTopClick(Sender: TObject);
    procedure ButtonBottomClick(Sender: TObject);
  private
    { Private declarations }
    Function SomeValue:Double;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCursorToolProg.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
end;

procedure TCursorToolProg.ButtonLeftClick(Sender: TObject);
begin
  ChartTool1.XValue:=ChartTool1.XValue-1;
end;

procedure TCursorToolProg.ButtonRightClick(Sender: TObject);
begin
  ChartTool1.XValue:=ChartTool1.XValue+1;
end;

procedure TCursorToolProg.ButtonTopClick(Sender: TObject);
begin
  ChartTool1.YValue:=ChartTool1.YValue+SomeValue;
end;

procedure TCursorToolProg.ButtonBottomClick(Sender: TObject);
begin
  ChartTool1.YValue:=ChartTool1.YValue-SomeValue;
end;

Function TCursorToolProg.SomeValue:Double;
begin
  With Series1.YValues do result:=(MaxValue-MinValue)/10;
end;

initialization
  RegisterClass(TCursorToolProg);
end.
