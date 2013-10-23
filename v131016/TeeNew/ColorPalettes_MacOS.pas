unit ColorPalettes_MacOS;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeSurfa;

type
  TColorPalettesMacOS = class(TBaseForm)
    Series1: TSurfaceSeries;
    Label7: TLabel;
    CBPalettes: TComboFlat;
    procedure CBPalettesChange(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure ApplyPalette(Series:TCustom3DPaletteSeries;
      Index:Integer);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TColorPalettesMacOS.ApplyPalette(Series:TCustom3DPaletteSeries;
                                                 Index:Integer);
begin
  case Index of
    0: Series1.AddPalette(TeeColorPalette);
    1: Series1.AddPalette(ExcelPalette);
    2: Series1.AddPalette(VictorianPalette);
    3: Series1.AddPalette(PastelsPalette);
    4: Series1.AddPalette(SolidPalette);
    5: Series1.AddPalette(ClassicPalette);
    6: Series1.AddPalette(WebPalette);
    7: Series1.AddPalette(ModernPalette);
    8: Series1.AddPalette(RainbowPalette);
    9: Series1.AddPalette(WindowsXPPalette);
   10: Series1.AddPalette(MacOSPalette);
   11: Series1.AddPalette(WindowsVistaPalette);
   12: Series1.AddPalette(GrayScalePalette);
   13: Series1.AddPalette(OperaPalette);
   14: Series1.AddPalette(WarmPalette);
   15: Series1.AddPalette(CoolPalette);
   16: Series1.AddPalette(OnBlackPalette);
  end;
end;

procedure TColorPalettesMacOS.CBPalettesChange(Sender: TObject);
begin
  ApplyPalette(Series1,CBPalettes.ItemIndex);
end;

procedure TColorPalettesMacOS.FormCreate(Sender: TObject);
begin
  inherited;

  ColorPalettes.AddTo(CBPalettes.Items);

  with Series1 do
  begin
    UseColorRange:=False;
    UsePalette:=true;
    PaletteStyle:=psCustom;
  end;

  CBPalettes.ItemIndex:=10;
  ApplyPalette(Series1,CBPalettes.ItemIndex);
end;

initialization
  RegisterClass(TColorPalettesMacOS);
end.
