unit Tool_RotateInertia_Cursor;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeTools, TeeSurfa;

type
  TToolRotateInertia_Cursor = class(TBaseForm)
    bEdit: TButton;
    Series1: TIsoSurfaceSeries;
    Label3: TLabel;
    ESpeed: TEdit;
    UDSpeed: TUpDown;
    Label4: TLabel;
    SBInertia: TScrollBar;
    LabelInertia: TLabel;
    Label6: TLabel;
    CBCursor: TComboFlat;
    procedure FormCreate(Sender: TObject);
    procedure bEditClick(Sender: TObject);
    procedure CBCursorChange(Sender: TObject);
    procedure SBInertiaChange(Sender: TObject);
    procedure ESpeedChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    Tool : TRotateTool;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  EditChar, TeePenDlg, TeeMouseCursor;

procedure TToolRotateInertia_Cursor.FormCreate(Sender: TObject);
begin
  inherited;

  TeeFillCursors(CBCursor,Cursor);

  // Create tool
  Tool := TRotateTool.Create(self);

  // Add to Chart
  Chart1.Tools.Add(Tool);

  // Tool Settings
  with Tool do
  begin
    Speed:=50;
    Inertia:=0;
  end;
end;

procedure TToolRotateInertia_Cursor.bEditClick(Sender: TObject);
begin
  EditChartTool(Self,Tool);
end;

procedure TToolRotateInertia_Cursor.CBCursorChange(Sender: TObject);
begin
  with Tool do
       Cursor:=TeeSetCursor(Cursor,CBCursor.CurrentItem);
end;

procedure TToolRotateInertia_Cursor.SBInertiaChange(Sender: TObject);
begin
  Tool.Inertia:=SBInertia.Position;
  LabelInertia.Caption:=IntToStr(Tool.Inertia);
end;

procedure TToolRotateInertia_Cursor.ESpeedChange(Sender: TObject);
begin
  if Assigned(Tool) then
     Tool.Speed:=UDSpeed.Position;
end;

initialization
  RegisterClass(TToolRotateInertia_Cursor);
end.
