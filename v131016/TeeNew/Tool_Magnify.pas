unit Tool_Magnify;
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
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools,TeeMagnifyTool;


type
  TMagnifyToolForm = class(TBaseForm)
    Series1: TLineSeries;
    Series2: TPointSeries;
    Series3: TLineSeries;
    cbFollowMouse: TCheckBox;
    cbSmooth: TCheckBox;
    cbCircled: TCheckBox;
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    Label2: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure cbFollowMouseClick(Sender: TObject);
    procedure cbSmoothClick(Sender: TObject);
    procedure cbCircledClick(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
  private
    { Private declarations }
    Magnify : TMagnifyTool;
  public
    { Public declarations }
  end;


implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TMagnifyToolForm.FormCreate(Sender: TObject);
begin
  inherited;
  Magnify:=TMagnifyTool.Create(Self);
  Magnify.ParentChart:=Chart1;
  Magnify.Bounds:=Rect(400,50,550,200);
end;

procedure TMagnifyToolForm.cbFollowMouseClick(Sender: TObject);
begin
  Magnify.FollowMouse:=cbFollowMouse.Checked;
end;

procedure TMagnifyToolForm.cbSmoothClick(Sender: TObject);
begin
  Magnify.Smooth:=cbSmooth.Checked;
end;

procedure TMagnifyToolForm.cbCircledClick(Sender: TObject);
begin
  Magnify.Circled:=cbCircled.Checked;
end;

procedure TMagnifyToolForm.ScrollBar1Change(Sender: TObject);
begin
  Magnify.Percent:=ScrollBar1.Position;
end;

procedure TMagnifyToolForm.ScrollBar2Change(Sender: TObject);
begin
  Magnify.Shape.Transparency:=ScrollBar2.Position;
end;

initialization
  RegisterClass(TMagnifyToolForm);
end.
