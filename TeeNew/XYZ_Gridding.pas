unit XYZ_Gridding;
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
  Base, TeEngine, TeeSurfa, TeePoin3, TeeProcs, Chart, TeCanvas, TeeTools,
  TeeGDIPlus;

type
  TXYZGridding = class(TBaseForm)
    Label1: TLabel;
    Series1: TPoint3DSeries;
    Series2: TSurfaceSeries;
    RadioButton1: TRadioButton;
    RadioButton2: TRadioButton;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure RadioButton1Click(Sender: TObject);
    procedure RadioButton2Click(Sender: TObject);
  private
    { Private declarations }
    Procedure Fill;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Procedure Gridding(Source:TCustom3DSeries; Dest:TCustom3DGridSeries; GridSize:Integer);
Const MaxDistance=1E+300;

  Function ClosestValue(Source:TCustom3DSeries; const X,Z:TChartValue):TChartValue;
  var Closer,
      t       : Integer;
      tmpX,
      tmpZ,
      dist,
      MaxDist : Double;
  begin
    MaxDist:=MaxDistance;
    Closer:=-1;
    result:=0;

    with Source do
    for t:=0 to Count-1 do
    begin
      tmpX:=XValues.Value[t]-X;
      tmpZ:=ZValues.Value[t]-Z;
      dist:=Sqrt(Sqr(tmpX)+Sqr(tmpZ));
      if dist<MaxDist then
      begin
        MaxDist:=dist;
        Closer:=t;
      end;
    end;

    if Closer<>-1 then
       result:=Source.YValues.Value[Closer];
  end;

var x,
    z : Integer;
    tmpX,
    tmpZ : TChartValue;
    tmpMinX,
    tmpMinZ,
    tmpXFactor,
    tmpZFactor : TChartValue;
begin
  tmpMinX:=Source.XValues.MinValue;
  tmpMinZ:=Source.ZValues.MinValue;

  tmpXFactor:=Source.XValues.Range/GridSize;
  tmpZFactor:=Source.ZValues.Range/GridSize;

  with Dest do
  begin
    Clear;
    NumXValues:=GridSize;
    NumZValues:=GridSize;

    // loop all grid cells
    for x:=1 to NumXValues do
    begin
      tmpX:=tmpMinX+((x-1)*tmpXFactor);

      for z:=1 to NumZValues do
      begin
        tmpZ:=tmpMinZ+((z-1)*tmpZFactor);

        Value[x,z]:=ClosestValue(Source,tmpX,tmpZ); // calculate
      end;
    end;
  end;
end;

// Add many random XYZ points to Series1
Procedure TXYZGridding.Fill;
var tmpX,
    tmpZ : Double;
    m,
    x,
    z : Integer;
begin
  with Series1 do
  begin
    Clear;

    m:=100;

    for x:=-m to m do
    begin
      tmpX:=sqr(x/30);
      for z:=-m to m do
      begin
        tmpZ:=Sqr(z/30);
        tmpZ:=Sqrt(tmpX + tmpZ);
        AddXYZ(x, 4*cos(3*tmpZ)*exp(-0.5*tmpZ), z);
      end;
    end;
  end;
end;

procedure TXYZGridding.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;
  Fill;

  Gridding(Series1,Series2,15);
end;

procedure TXYZGridding.RadioButton1Click(Sender: TObject);
begin
  RadioButton2.Checked:=False;
  RadioButton1.Checked:=True;

  Series1.Visible:=RadioButton1.Checked;
  Series2.Visible:=RadioButton2.Checked;
end;

procedure TXYZGridding.RadioButton2Click(Sender: TObject);
begin
  RadioButton1.Checked:=False;
  RadioButton2.Checked:=True;

  Series1.Visible:=RadioButton1.Checked;
  Series2.Visible:=RadioButton2.Checked;
end;

initialization
  RegisterClass(TXYZGridding);
end.
