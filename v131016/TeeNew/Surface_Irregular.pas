unit Surface_Irregular;
{$I TeeDefs.inc}

{ The SurfaceSeries can now accept XYZ floating point values.

  The "grid" of cells defined by X and Z dimensions is still
  used, but now the X and Z values do not need to be rounded
  integers.

  To distinguish between a normal integer "grid" and this new
  code, the following property must be set to TRUE:

    SurfaceSeries1.IrregularGrid:=True;

    This must be done before adding points to the series.

}
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
  Base, TeeProcs, TeEngine, Chart, TeeSurfa, TeeTools;

type
  TSurfaceFloat = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TSurfaceSeries;
    CheckBox2: TCheckBox;
    ChartTool1: TRotateTool;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TSurfaceFloat.FormCreate(Sender: TObject);
Var x,z : Integer;
    y   : Double;
    xval,
    zval : Array[0..9] of Double;
begin
  inherited;

  Series1.IrregularGrid:=True;   { <---------- VERY IMPORTANT !!! }

  Series1.GetVertAxis.SetMinMax(-2,2);  { axis scale for Y values }

  { Arrays of X and Z values with sample points... }
  { The values have floating point decimals and define
    an irregular grid }

  xval[0]:=0.1;
  xval[1]:=0.2;
  xval[2]:=0.3;
  xval[3]:=0.5;
  xval[4]:=0.8;
  xval[5]:=1.1;
  xval[6]:=1.5;
  xval[7]:=2.0;
  xval[8]:=2.2;
  xval[9]:=3.0;

  zval[0]:=0.5;
  zval[1]:=0.6;
  zval[2]:=0.7;
  zval[3]:=0.75;
  zval[4]:=0.8;
  zval[5]:=1.1;
  zval[6]:=1.5;
  zval[7]:=2.0;
  zval[8]:=2.2;
  zval[9]:=5.6;

  { Now add all "Y" points... }
  Series1.Clear;

  { An irregular grid of 10 x 10 cells }
  Series1.NumXValues:=10;
  Series1.NumZValues:=10;

  for x:=0 to 9 do  { = 10 rows }
    for z:=0 to 9 do  { = 10 columns }
    begin
      y:=Sin(z*Pi/10.0)*Cos(x*Pi/5.0);  { example Y value }
      Series1.AddXYZ(Xval[x],Y,Zval[z]);
    end;
end;

procedure TSurfaceFloat.CheckBox1Click(Sender: TObject);
begin
  Series1.IrregularGrid:=CheckBox1.Checked
end;

procedure TSurfaceFloat.CheckBox2Click(Sender: TObject);
begin
  if CheckBox2.Checked then
  begin
    Chart1.View3DOptions.Elevation:=270;
    Chart1.View3DOptions.Rotation:=360;
  end
  else
  begin
    Chart1.View3DOptions.Elevation:=345;
    Chart1.View3DOptions.Rotation:=345;
  end;
end;

initialization
  RegisterClass(TSurfaceFloat);
end.
