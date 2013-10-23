unit Legend_AddText;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  {$ENDIF}
  Base, TeCanvas, TeeProcs, TeEngine, Chart, Series;

type
  TLegendAddText = class(TBaseForm)
    Series1: TBarSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
    procedure Chart1GetLegendPos(Sender: TCustomChart; Index: Integer;
      var X, Y, XColor: Integer);
    procedure Chart1GetLegendRect(Sender: TCustomChart; var Rect: TRect);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TLegendAddText.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
  Series1.Labels[0]:='one';
  Series1.Labels[1]:='two';
  Series1.Labels[2]:='three';
  Series1.Labels[3]:='four';
  Series1.Labels[4]:='five';
  Series1.Labels[5]:='six';
  Chart1.legend.TextStyle:=ltsPlain;
end;

procedure TLegendAddText.Chart1AfterDraw(Sender: TObject);
begin
  if CheckBox1.Checked then
  With Chart1.Legend.ShapeBounds do
  begin
    With Chart1.Canvas do
    begin
      DoHorizLine(Left,Right,Bottom-30);
      TextAlign:=ta_Left;
      Font.Size:=8;
      Font.Color:=clNavy;
      TextOut(Left+8,Bottom-28,'Additional text');
      TextOut(Left+8,Bottom-16,'displayed here.');
    end;
  end;
end;

procedure TLegendAddText.Chart1GetLegendPos(Sender: TCustomChart;
  Index: Integer; var X, Y, XColor: Integer);
begin
  if CheckBox1.Checked then
  begin
    X:=X-40;
    XColor:=XColor-40;
  end;
end;

procedure TLegendAddText.Chart1GetLegendRect(Sender: TCustomChart;
  var Rect: TRect);
begin
  if CheckBox1.Checked then
  begin
    Rect.Left:=Rect.Left-40;
    Rect.Bottom:=Rect.Bottom+30;
  end;
end;

procedure TLegendAddText.CheckBox1Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

initialization
  RegisterClass(TLegendAddText);
end.
