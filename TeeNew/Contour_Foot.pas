{ This example was kindly provided by Lee Grissom }
unit Contour_Foot;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeGDIPlus;

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

  TContourFoot = class(TBaseForm)
    Series1: TContourSeries;
    RadioGroup1: TRadioGroup;
    procedure RadioGroup1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    FootScanArray: TBigPadArray;
    procedure AddDataToSeries(ASeries: TCustom3DGridSeries; Const FileName: String);
    procedure InitContourSeries(ASeries :TContourSeries);
    procedure InitSeries(ASeries :TCustom3DGridSeries);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.XFM}
{$ENDIF}

{$R FootData.Res}

procedure TContourFoot.AddDataToSeries(ASeries: TCustom3DGridSeries; const FileName: String);
var
//  f: File of TBigPadArray;
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

(*
  // Reading from a file instead of resource:

  AssignFile(f,fileName);
  try
    Reset(f);
    Read(f, FootScanArray);
  finally
    CloseFile(f);
  end;
*)

  ASeries.Clear;

  for len := 0 to BIGPADLENGTH do
    for wid := 0 to BIGPADWIDTH do
    begin
      val:=FootScanArray[len, wid];

       ASeries.AddXYZ( wid+1, val, len+1 );
    end;
end;

procedure TContourFoot.InitContourSeries(ASeries :TContourSeries);
var i: Integer;
begin
  ASeries.NumLevels := High(ColorPalette)+1;
  ASeries.CreateAutoLevels;
  ASeries.AutomaticLevels:=False;
  ASeries.Pen.Visible := True;
  ASeries.Pen.Width := 5;
  for i := 0 to ASeries.Levels.Count -1  do
  begin
    ASeries.Levels[i].Color := ColorPalette[i];
    ASeries.Levels[i].UpToValue := i + 0.5;
  end;
end;

procedure TContourFoot.InitSeries(ASeries: TCustom3DGridSeries);
var i: Integer;
begin
  ASeries.UsePalette := True;
  ASeries.UseColorRange := False;

  ASeries.ClearPalette;
  for i := Low(ColorPalette) to High(ColorPalette) do
    ASeries.AddPalette(i+0.5,ColorPalette[i]);

  ASeries.Repaint;
end;

procedure TContourFoot.RadioGroup1Click(Sender: TObject);
var tmp: TChartSeries;
begin
  tmp := Chart1.Series[0];
  case RadioGroup1.ItemIndex of
    0:  begin
          ChangeSeriesType(tmp,TContourSeries);
          InitContourSeries(Chart1.Series[0] as TContourSeries);
        end;
    1:  begin
          ChangeSeriesType(tmp,TColorGridSeries);
          TColorGridSeries(Chart1.Series[0]).IrregularGrid:=True;
          Chart1.Series[0].Pen.Visible := False;
        end;
  end;
end;

procedure TContourFoot.FormCreate(Sender: TObject);
begin
  inherited;
  AddDataToSeries(Series1,'FootData.bin');

//  Series1.NumLevels:=Series1.PaletteSteps;

  InitSeries(Series1);
  RadioGroup1.ItemIndex := 0;
  RadioGroup1Click(Self);
end;

initialization
  RegisterClass(TContourFoot);
end.
