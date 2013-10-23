unit Tool_AnnotationClick;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, 
  {$ENDIF}
  Base, TeEngine, TeeTools, TeeProcs, Chart;

type
  TAnnotationClick = class(TBaseForm)
    ChartTool1: TAnnotationTool;
    ChartTool2: TAnnotationTool;
    ChartTool3: TAnnotationTool;
    Label1: TLabel;
    procedure ChartTool1Click(Sender: TAnnotationTool;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TAnnotationClick.ChartTool1Click(Sender: TAnnotationTool;
  Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
begin
  ShowMessage(Sender.Text);
end;

procedure TAnnotationClick.FormCreate(Sender: TObject);
begin
  inherited;
  ChartTool1.Cursor:=crHandPoint;
  ChartTool2.Cursor:=crCross;
  ChartTool3.Cursor:=crHandPoint;

  Label1.Caption:='';
end;

procedure TAnnotationClick.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
begin
  if ChartTool1.Clicked(x,y) then Label1.Caption:=ChartTool1.Text else
  if ChartTool2.Clicked(x,y) then Label1.Caption:=ChartTool2.Text else
  if ChartTool3.Clicked(x,y) then Label1.Caption:=ChartTool3.Text else
                                  Label1.Caption:='';
end;

initialization
  RegisterClass(TAnnotationClick);
end.
