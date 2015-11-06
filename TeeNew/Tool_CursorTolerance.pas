unit Tool_CursorTolerance;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeCanvas;
  

type
  TCursorToleranceToolForm = class(TBaseForm)
    Series1: TPointSeries;
    ChartTool1: TCursorTool;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    cbFollowMouse: TCheckBox;
    cbSnap: TCheckBox;
    procedure Edit1Change(Sender: TObject);
    procedure cbFollowMouseClick(Sender: TObject);
    procedure cbSnapClick(Sender: TObject);
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

procedure TCursorToleranceToolForm.Edit1Change(Sender: TObject);
begin
  ChartTool1.ClickTolerance:=StrToInt(Edit1.Text);
end;

procedure TCursorToleranceToolForm.cbFollowMouseClick(Sender: TObject);
begin
  ChartTool1.FollowMouse:=cbFollowMouse.Checked;
end;

procedure TCursorToleranceToolForm.cbSnapClick(Sender: TObject);
begin
  ChartTool1.Snap:=cbSnap.Checked;
end;

initialization
  RegisterClass(TCursorToleranceToolForm);
end.
