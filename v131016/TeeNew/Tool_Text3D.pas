unit Tool_Text3D;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, Bar3D, TeeText3D;

type
  TText3DToolForm = class(TBaseForm)
    Series1: TBar3DSeries;
    Button1: TButton;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Text3D : TText3DTool;
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

procedure TText3DToolForm.FormCreate(Sender: TObject);
begin
  inherited;

  // Create tool (you can also do this at design-time using the editor dialog)
  Text3D:=TText3DTool.Create(Self);

  with Text3D do
  begin
    ParentChart:=Chart1;

    Position.X:=300;
    Position.Y:=100;

    Text:='Text3D Tool';

    Font.Size:=44;
    Font.Style:=[fsBold];
  end;

  // Add to chart
  Chart1.Tools.Add(Text3D);
end;

procedure TText3DToolForm.Button1Click(Sender: TObject);
begin
  EditChartTool(Self,Text3D);
end;

initialization
  RegisterClass(TText3DToolForm);
end.
