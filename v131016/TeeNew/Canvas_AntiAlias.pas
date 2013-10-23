unit Canvas_AntiAlias;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls,
  QComCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TCanvasAntiAlias = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TPieSeries;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    procedure CheckBox1Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
  private
    { Private declarations }
    InsideAntiAliasing:Boolean;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCanvasAntiAlias.CheckBox1Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

procedure TCanvasAntiAlias.Chart1AfterDraw(Sender: TObject);
var b: TBitmap;
begin
  if CheckBox1.Checked and (not InsideAntiAliasing) then
  begin
    InsideAntiAliasing:=True;  // set flag to avoid re-entrancy
    try
      b:=TeeAntiAlias(Chart1);  // create anti-aliased bitmap
      try
        Chart1.Canvas.Draw(0,0,b);  // draw bitmap onto Chart1
      finally
        b.Free;  // delete temporary bitmap
      end;
    finally
      InsideAntiAliasing:=False;  // reset flag
    end;
  end;
end;

procedure TCanvasAntiAlias.Edit1Change(Sender: TObject);
begin
  if Showing then
  begin
    Chart1.View3DOptions.FontZoom:=UpDown1.Position;
    Chart1.Invalidate;
  end;
end;

initialization
  RegisterClass(TCanvasAntiAlias);
end.
