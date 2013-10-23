unit FastLine_Nulls;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TFastLineNulls = class(TBaseForm)
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Series1: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TFastLineNulls.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);

  // set some null points:
  Series1.SetNull(14);
  Series1.SetNull(20);
  Series1.SetNull(31);
  Series1.SetNull(39);

  // Draw in "stairs" mode:
  Series1.Stairs:=True;
end;

procedure TFastLineNulls.CheckBox1Click(Sender: TObject);
begin
  Series1.Stairs:=CheckBox1.Checked;

  // enable / disable 
  CheckBox3.Enabled:=Series1.Stairs;
end;

procedure TFastLineNulls.CheckBox3Click(Sender: TObject);
begin
  Series1.InvertedStairs:=CheckBox3.Checked;
end;

procedure TFastLineNulls.CheckBox2Click(Sender: TObject);
begin
  If CheckBox2.Checked then
    Series1.TreatNulls:=tnIgnore
  else
    Series1.TreatNulls:=tnDontPaint;
end;

initialization
  RegisterClass(TFastLineNulls);
end.
