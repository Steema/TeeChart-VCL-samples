unit SeriesType_Arrow;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeTools, ArrowCha, TeeGDIPlus;

type
  TArrowSeriesForm = class(TBaseForm)
    CheckBox3: TCheckBox;
    Series1: TArrowSeries;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    CheckBox2: TCheckBox;
    procedure CheckBox3Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
  private
    { Private declarations }
   procedure AddRandomArrows;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TArrowSeriesForm.CheckBox3Click(Sender: TObject);
begin
  Series1.ColorEachPoint:=CheckBox3.Checked;
end;

procedure TArrowSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  With Series1 do
  Begin
    ArrowWidth:=32;
    ArrowHeight:=24;
    XValues.DateTime:=False;
    YValues.DateTime:=False;
  end;
  AddRandomArrows;
end;

procedure TArrowSeriesForm.AddRandomArrows;
var x0,y0,x1,y1:Double;
    t:Integer;
begin
  With Series1 do
  Begin
    Clear;
    for t:=1 to 40 do
    begin
      x0:=Random( 1000 );
      y0:=Random( 1000 );

      x1:=Random( 300 ) - 150.0;
      if x1<50 then x1:=50;
      x1:=x1+x0;

      y1:=Random( 300 ) - 150.0;
      if y1<50 then y1:=50;
      y1:=y1+y0;

      AddArrow( x0,y0,x1,y1, '', clTeeColor );
    end;
  end;
end;

procedure TArrowSeriesForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TArrowSeriesForm.Timer1Timer(Sender: TObject);
var t:Integer;
begin
  Timer1.Enabled:=False;
  With Series1 do
  Begin
    for t:=0 to Count-1 do
    Begin
      StartXValues[t]:=StartXValues[t]+Random(100)-50.0;
      StartYValues[t]:=StartYValues[t]+Random(100)-50.0;
      EndXValues[t]  :=EndXValues[t]+Random(100)-50.0;
      EndYValues[t]  :=EndYValues[t]+Random(100)-50.0;
    End;
    Repaint;
  End;
  Timer1.Enabled:=True;
end;

procedure TArrowSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Chart1.View3D:=CheckBox2.Checked
end;

initialization
  RegisterClass(TArrowSeriesForm);
end.
