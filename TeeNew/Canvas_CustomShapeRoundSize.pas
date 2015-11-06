unit Canvas_CustomShapeRoundSize;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, BubbleCh;

type
  TCanvasCustomShapeRoundSize = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TBubbleSeries;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
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

procedure TCanvasCustomShapeRoundSize.FormCreate(Sender: TObject);
begin
  inherited;

  with Series1.Marks do
  begin
    Transparent:=False;
    Pen.Visible:=True;
    ShapeStyle:=fosRoundRectangle;
    RoundSize:=UpDown1.Position;
  end;
end;

procedure TCanvasCustomShapeRoundSize.Edit1Change(Sender: TObject);
begin
  Series1.Marks.RoundSize:=UpDown1.Position;
end;

initialization
  RegisterClass(TCanvasCustomShapeRoundSize);
end.
