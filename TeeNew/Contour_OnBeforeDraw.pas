unit Contour_OnBeforeDraw;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeCanvas;

type
  TContourOnBefore = class(TBaseForm)
    Series1: TContourSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure Series1BeforeDrawLevel(Sender: TContourSeries;
      LevelIndex: Integer);
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

procedure TContourOnBefore.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

procedure TContourOnBefore.Series1BeforeDrawLevel(Sender: TContourSeries;
  LevelIndex: Integer);
begin
  // Change pen for selected contour level...
  if LevelIndex=UpDown1.Position then
     Chart1.Canvas.Pen.Width:=3
  else
     Chart1.Canvas.Pen.Width:=1;
end;

procedure TContourOnBefore.Edit1Change(Sender: TObject);
begin
  Series1.Repaint;
end;

initialization
  RegisterClass(TContourOnBefore);
end.
