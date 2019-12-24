unit UPolarContour;

{$R FootData.Res}

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, VclTee.TeeGDIPlus, Vcl.StdCtrls,
  VCLTee.TeEngine, VCLTee.Series, VCLTee.TeePolar, VCLTee.TeePolarContour,
  VCLTee.TeeProcs, VCLTee.Chart, Vcl.ExtCtrls, VCLTee.TeeComma, TeeSurfa;


const
  // Hard coded values for this specific format
  BIGPADWIDTH = 63;
  BIGPADLENGTH = 95;

  ColorPalette: array[ 0..15 ] of TColor =
  (
    $000000, $ff0000, $ff8000, $ffc000,
    $ffff00, $c0ff00, $80ff00, $00ff00,
    $00ff80, $00ffff, $00dfff, $00c0ff,
    $00a0ff, $0080ff, $0060ff, $0000ff
  );

type
  TBigPadArray = array[0..95, 0..63] of Byte;

  TForm14 = class(TForm)
    TeeCommander1: TTeeCommander;
    Chart1: TChart;
    Series1: TPolarContourSeries;
    Button1: TButton;
    CheckBox1: TCheckBox;
    procedure Button1Click(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    FootScanArray: TBigPadArray;
    procedure InitContourSeries(ASeries : TContourSeries);
    procedure AddDataToSeries(ASeries: TCustom3DGridSeries);
  public
    { Public declarations }
  end;

var
  Form14: TForm14;

implementation

{$R *.dfm}

procedure TForm14.AddDataToSeries(ASeries: TCustom3DGridSeries);
var
  len, wid: Integer;
  val: Byte;
  r: TResourceStream;
begin
  r:=TResourceStream.Create(HInstance, 'FOOTDATA', RT_RCDATA);
  try
    r.ReadBuffer(FootScanArray,r.Size);
  finally
    r.Free;
  end;

  ASeries.Clear;

  for len := 0 to BIGPADLENGTH do
    for wid := 0 to BIGPADWIDTH do
    begin
      val:=FootScanArray[len, wid];

       ASeries.AddXYZ( wid+1, val, len+1 );
    end;

    ASeries.Repaint;
end;

procedure TForm14.Button1Click(Sender: TObject);
Var i : Integer;
begin
  InitContourSeries(Series1.Contour);
  Series1.Pen.Visible := CheckBox1.Checked;

  Series1.Contour.Clear;
  AddDataToSeries(Series1.Contour);

  //required
  for i:=0 to Series1.Contour.Count-1 do
    Series1.AddNull(Series1.Contour.YValues.Value[i]);

  Series1.Contour.Active := False;
end;

procedure TForm14.CheckBox1Click(Sender: TObject);
begin
  Series1.Pen.Visible := CheckBox1.Checked;
end;

procedure TForm14.InitContourSeries(ASeries: TContourSeries);
var i: Integer;
begin
  ASeries.UsePalette := True;
  ASeries.UseColorRange := False;

  ASeries.ClearPalette;
  for i := Low(ColorPalette) to High(ColorPalette) do
    ASeries.AddPalette(i+0.5,ColorPalette[i]);

  ASeries.Repaint;
end;

end.
