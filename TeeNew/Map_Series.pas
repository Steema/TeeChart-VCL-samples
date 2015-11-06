unit Map_Series;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QActnList,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ActnList,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeMapSeries, TeeProcs, Chart, TeeChartActions;

type
  TMapSeriesForm = class(TBaseForm)
    Series1: TMapSeries;
    Button1: TButton;
    ActionList1: TActionList;
    ChartActionEdit1: TChartActionEdit;
    CheckBox1: TCheckBox;
    ChartActionAxes1: TChartActionAxes;
    SeriesActionMarks1: TSeriesActionMarks;
    CheckBox2: TCheckBox;
    CheckBox3: TCheckBox;
    Shape1: TShape;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    Procedure AddSampleShapes;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Procedure TMapSeriesForm.AddSampleShapes;

  Procedure AddShape(Const X,Y:Array of Integer; AColor:TColor; Const AText:String);
  var t : Integer;
  begin
    With Series1.Shapes.Add do  { <-- add a new empty shape... }
    begin
      { add the XY coordinates }
      for t:=Low(X) to High(X) do AddXY(X[t],Y[t]);
      { the shape color... }
      Color:=clTeeColor;
      { the shape text... }
      Text:=AText;
      { the shape Value (Z)... }
      Z:=Random(1000)/1000.0;
    end;
  end;

Const AX:Array[0..13] of Integer=(1,3,4,4,5,5,6,6,4,3,2,1,2,2);
      AY:Array[0..13] of Integer=(7,5,5,7,8,9,10,11,11,12,12,11,10,8);
      BX:Array[0..8]  of Integer=(5,7,8,8,7,6,5,4,4);
      BY:Array[0..8]  of Integer=(4,4,5,6,7,7,8,7,5);
      CX:Array[0..15] of Integer=(9,10,11,11,12,9,8,7,6,6,5,5,6,7,8,8);
      CY:Array[0..15] of Integer=(5,6,6,7,8,11,11,12,11,10,9,8,7,7,6,5);
      DX:Array[0..7]  of Integer=(12,14,15,14,13,12,11,11);
      DY:Array[0..7]  of Integer=(5,5,6,7,7,8,7,6);
      EX:Array[0..10] of Integer=(4,6,7,7,6,6,5,4,3,3,2);
      EY:Array[0..10] of Integer=(11,11,12,13,14,15,16,16,15,14,13);
      FX:Array[0..11] of Integer=(7,8,9,11,10,8,7,6,5,5,6,6);
      FY:Array[0..11] of Integer=(13,14,14,16,17,17,18,18,17,16,15,14);
      GX:Array[0..11] of Integer=(10,12,12,14,13,11,9,8,7,7,8,9);
      GY:Array[0..11] of Integer=(10,12,13,15,16,16,14,14,13,12,11,11);
      HX:Array[0..9]  of Integer=(17,19,18,18,17,15,14,13,15,16);
      HY:Array[0..9]  of Integer=(11,13,14,16,17,15,15,14,12,12);
      IX:Array[0..14] of Integer=(15,16,17,16,15,14,14,13,12,11,10,11,12,13,14);
      IY:Array[0..14] of Integer=(6,6,7,8,8,9,10,11,12,11,10,9,8,7,7);
      JX:Array[0..11] of Integer=(15,16,16,17,17,16,15,13,12,12,14,14);
      JY:Array[0..11] of Integer=(8,8,9,10,11,12,12,14,13,12,10,9);
      KX:Array[0..9]  of Integer=(17,19,20,20,19,17,16,16,17,16);
      KY:Array[0..9]  of Integer=(5,5,6,8,8,10,9,8,7,6);
      LX:Array[0..6]  of Integer=(19,20,21,21,19,17,17);
      LY:Array[0..6]  of Integer=(8,8,9,11,13,11,10);
begin
  AddShape(AX,AY,clLime,   'A');
  AddShape(BX,BY,clRed,    'B');
  AddShape(CX,CY,clFuchsia,'C');
  AddShape(DX,DY,clAqua,   'D');
  AddShape(EX,EY,clSilver, 'E');
  AddShape(FX,FY,clAqua,   'F');
  AddShape(GX,GY,clGreen,  'G');
  AddShape(HX,HY,clTeal,   'H');
  AddShape(IX,IY,clWhite,  'I');
  AddShape(JX,JY,clRed,    'J');
  AddShape(KX,KY,clBlue,   'K');
  AddShape(LX,LY,clYellow, 'L');
end;

procedure TMapSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  { Add some shapes... }
  Series1.Clear;
  AddSampleShapes;

  { Set the color palette "strong" }
  Series1.PaletteStyle:=psRainbow;

  { Marks... }
  Series1.Marks.Bevel:=bvRaised;
  Series1.Marks.Color:=clSilver;
end;

procedure TMapSeriesForm.CheckBox3Click(Sender: TObject);
begin
  { change the color palette style... }
  if CheckBox3.Checked then
  begin
    Series1.UsePalette:=True;
    Series1.UseColorRange:=False;
  end
  else Series1.UseColorRange:=True;
end;

procedure TMapSeriesForm.Series1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  inherited;
  ShowMessage('Shape: '+Series1.Labels[ValueIndex]+' Value: '+
               FloatToStr(Series1.ZValues[ValueIndex]));

  { stop zooming }
  Chart1.CancelMouse:=True;
end;

procedure TMapSeriesForm.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  inherited;
  { which map polygon is under the mouse ?  }
  tmp:=Series1.Clicked(x,y);
  { none ? }
  if tmp=-1 then Shape1.Visible:=False { hide color shape }
  else
  begin
    { show color shape }
    Shape1.Brush.Color:=Series1.ValueColor[tmp];
    Shape1.Visible:=True;
  end;
end;

initialization
  RegisterClass(TMapSeriesForm);
end.
