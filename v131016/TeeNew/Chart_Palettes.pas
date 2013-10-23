unit Chart_Palettes;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms,  QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms,  Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, Series, TeCanvas, TeeProcs, Chart;

type
  TCustomPalettes = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    ComboBox1: TComboBox;
    CBPalette: TComboFlat;
    Series1: TBarSeries;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CBPaletteChange(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    RedPalette,
    BluePalette,
    GreenPalette : Array of TColor;
  public
    { Public declarations }
  end;

implementation

{$R *.dfm}

procedure TCustomPalettes.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;
  Series1.FillSampleValues(15);
  Series1.ColorEachPoint:=True;  // <-- IMPORTANT, USE COLOR PALETTE
  
  ComboBox1.ItemIndex:=0;

  // Add pre-defined ColorPalettes to combobox:
  CBPalette.Clear;
  for t:=0 to ColorPalettes.Count-1 do
      CBPalette.Items.Add(ColorPalettes[t]);

  // Create three custom color palettes (arrays of TColor)
  SetLength(RedPalette,15);
  for t:=0 to 14 do RedPalette[t]:=RGB(128+Round(t*(128.0/15.0)),0,0);

  SetLength(BluePalette,15);
  for t:=0 to 14 do BluePalette[t]:=RGB(0,0,128+Round(t*(128.0/15.0)));

  SetLength(GreenPalette,15);
  for t:=0 to 14 do GreenPalette[t]:=RGB(0,128+Round(t*(128.0/15.0)),0);
end;

procedure TCustomPalettes.ComboBox1Change(Sender: TObject);
begin
  // Set a custom color palette
  case ComboBox1.ItemIndex of
    0: SetDefaultColorPalette;
    {$IFDEF D5}
    1: SetDefaultColorPalette(RedPalette);
    2: SetDefaultColorPalette(BluePalette);
    3: SetDefaultColorPalette(GreenPalette);
    {$ENDIF}
  end;

  // Reset internal Chart color palette and palette index to zero / nil
  Chart1.ColorPalette:=nil;
  Chart1.ColorPaletteIndex:=0;

  // Repaint chart
  Chart1.Invalidate;
end;

procedure TCustomPalettes.CBPaletteChange(Sender: TObject);
begin
  // Set a pre-defined color palette
  ColorPalettes.ApplyPalette(Chart1,CBPalette.ItemIndex);
end;

procedure TCustomPalettes.FormDestroy(Sender: TObject);
begin
  // Reset back the default global TeeChart color palette
  // to not alter the rest of demos.
  SetDefaultColorPalette;

  inherited;
end;

initialization
  RegisterClass(TCustomPalettes);
end.
