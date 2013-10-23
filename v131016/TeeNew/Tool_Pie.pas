unit Tool_Pie;
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
  Base, TeEngine, TeePieTool, Series, TeeProcs, Chart, TeCanvas, TeePenDlg,
  EditChar;

type
  TPieToolDemo = class(TBaseForm)
    Series1: TPieSeries;
    ChartTool1: TPieTool;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    ButtonPen1: TButtonPen;
    Button1: TButton;
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPieToolDemo.Chart1MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);

var tmp : Integer;
begin
  tmp:=ChartTool1.Slice;

  if tmp=-1 then
  begin
    Label2.Caption:='';
    Shape1.Visible:=False;
  end
  else
  begin
    Label2.Caption:=Series1.Labels[tmp];
    Shape1.Visible:=True;
    Shape1.Brush.Color:=Series1.ValueColor[tmp];
  end;
end;

procedure TPieToolDemo.FormCreate(Sender: TObject);
begin
  inherited;

  // Pie tool has been added at design-time.
  // If you wish to create it at runtime:
  //
  // uses TeePieTool;
  // var Tool : TPieTool;
  // Tool:=TPieTool.Create(Self);
  // Tool.ParentChart:=Chart1;
  // Tool.Series:=Series1;

  // setup pen
  ButtonPen1.LinkPen(ChartTool1.Pen);
end;

procedure TPieToolDemo.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,ChartTool1);
end;

initialization
  RegisterClass(TPieToolDemo);
end.
