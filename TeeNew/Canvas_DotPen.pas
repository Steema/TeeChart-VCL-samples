unit Canvas_DotPen;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TCanvasDotPen = class(TBaseForm)
    Series1: TFastLineSeries;
    Series2: TFastLineSeries;
    Series3: TFastLineSeries;
    Series4: TFastLineSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TCanvasDotPen.Edit1Change(Sender: TObject);
begin
  Series1.Pen.Width:=UpDown1.Position;
  Series2.Pen.Width:=UpDown1.Position;
  Series3.Pen.Width:=UpDown1.Position;
  Series4.Pen.Width:=UpDown1.Position;
end;

procedure TCanvasDotPen.CheckBox1Click(Sender: TObject);
var tmp : TPenStyle;
begin
  if CheckBox1.Checked then tmp:=psDot
                       else tmp:=psSolid;
  Series1.Pen.Style:=tmp;
  Series2.Pen.Style:=tmp;
  Series3.Pen.Style:=tmp;
  Series4.Pen.Style:=tmp;
end;

procedure TCanvasDotPen.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  Series2.FillSampleValues(30);
  Series3.FillSampleValues(40);
  Series4.FillSampleValues(10);

  { set big dotted pen }
  Series1.Pen.Width:=3; Series1.Pen.Style:=psDot;
  Series2.Pen.Width:=3; Series2.Pen.Style:=psDot;
  Series3.Pen.Width:=3; Series3.Pen.Style:=psDot;
  Series4.Pen.Width:=3; Series4.Pen.Style:=psDot;
end;

initialization
  RegisterClass(TCanvasDotPen);
end.
