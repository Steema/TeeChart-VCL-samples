unit ColorGrid_Transparent;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, TeeSurfa;

type
  TColorGridTransparent = class(TBaseForm)
    Series1: TColorGridSeries;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure SetTransparentColors;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TColorGridTransparent.FormCreate(Sender: TObject);
begin
  inherited;
  UpDown1.Max:=30;

  With Series1 do
  begin
    FillSampleValues(100);
    CenteredPoints:=True;

    UseColorRange:=False;
    UsePalette:=True;
    PaletteSteps:=UpDown1.Max;
    CreateRangePalette;
  end;
end;

procedure TColorGridTransparent.CheckBox1Click(Sender: TObject);
begin
  Edit1.Enabled:=CheckBox1.Checked;
  UpDown1.Enabled:=CheckBox1.Checked;

  Series1.Bitmap.Transparent:=CheckBox1.Checked;

  Series1.CreateRangePalette;

  if CheckBox1.Checked then SetTransparentColors;

  Series1.Repaint;
end;

Procedure TColorGridTransparent.SetTransparentColors;
var t : Integer;
begin
  { Set colorgrid bitmap to transparent }
  Series1.Bitmap.Transparent:=False;
  Series1.Bitmap.Transparent:=True;

  { re-create the palette }
  Series1.CreateRangePalette;

  { set levels to transparent color (white in this example)  }
  for t:=0 to UpDown1.Position-1 do Series1.Palette[t].Color:=clWhite;
end;

procedure TColorGridTransparent.Edit1Change(Sender: TObject);
begin
  SetTransparentColors;
  Series1.Repaint;
end;

procedure TColorGridTransparent.Button1Click(Sender: TObject);
var t,x,z:Integer;
begin
  // make 10 cells transparent...
  for t:=1 to 10 do
  begin
    x:=1+Random(Series1.NumXValues);
    z:=1+Random(Series1.NumZValues);
    Series1.SetNull(Series1.GridIndex[x,z]);
  end;
end;

initialization
  RegisterClass(TColorGridTransparent);
end.
