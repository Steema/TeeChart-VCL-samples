unit Tool_SurfaceNearest;
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
  Base, TeeProcs, TeEngine, Chart, TeeSurfaceTool, TeeSurfa, TeeTools;

type
  TSurfaceNearestForm = class(TBaseForm)
    Button1: TButton;
    Series1: TSurfaceSeries;
    Label1: TLabel;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure AddSurfacePoints;
    procedure ToolSelect(Sender: TObject);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeCanvas, EditChar;

procedure TSurfaceNearestForm.FormCreate(Sender: TObject);
var tmp : TSurfaceNearestTool;
begin
  inherited;

  Chart1.Axes.FastCalc:=True;
  Chart1.View3DOptions.ZoomText:=ztNo;

  AddSurfacePoints;

  // Create tool  (this can also be done at design-time without any code)
  tmp:=TSurfaceNearestTool.Create(Self);
  tmp.Series:=Series1;
  tmp.OnSelectCell:=ToolSelect;

  Chart1.Tools.Add(tmp);
end;

Procedure TSurfaceNearestForm.AddSurfacePoints;
const NumX=50;
      NumZ=30;
var x,z : Integer;
begin

  Series1.NumXValues:=NumX;
  Series1.NumZValues:=NumZ;

  for x:=1 to NumX do
      for z:=1 to NumZ do
          Series1.AddXYZ( x,
                          cos(0.14*x)*cos(0.25*z)+
                          0.01*(x-(NumX div 2))*(z-(NumZ div 2)) +
                          13*exp(-0.06*(sqr(x-(NumX div 2))+sqr(z-(NumZ div 2))))+
                          6*exp(-0.03*(sqr(x-(NumX div 3))+sqr(z-3*(NumZ div 5))))-1,
                          z );
end;

// This event is called when the user moves the mouse
// over a surface's cell.
// Let's use it in this demo to show the "hit" cell row and column.

procedure TSurfaceNearestForm.ToolSelect(Sender: TObject);
var tmp : Integer;
    tmpRow,
    tmpCol : Double;
begin
  tmp:=(Sender as TSurfaceNearestTool).SelectedCell;

  if tmp=-1 then Label1.Caption:=''
  else
  begin
    (Sender as TSurfaceNearestTool).GetRowCol(tmpRow,tmpCol);
    Label1.Caption:='Row: '+FloatToStr(tmpRow)+' Column: '+FloatToStr(tmpCol);
  end;
end;

procedure TSurfaceNearestForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,Chart1.Tools[0]);
end;

procedure TSurfaceNearestForm.FormShow(Sender: TObject);
var P:TPoint;
begin
  inherited;

  // Move the mouse cursor to chart center
  P.X:=Chart1.ChartXCenter;
  P.Y:=Chart1.ChartYCenter;
  Mouse.CursorPos:=ClientToScreen(P);
end;

initialization
  RegisterClass(TSurfaceNearestForm);
end.
