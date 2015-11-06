unit Contour_Palette;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart;

type
  TContourPaletteForm = class(TBaseForm)
    Series1: TContourSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TContourPaletteForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(25);
end;

procedure TContourPaletteForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: begin                                 { single color }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=False;
         Series1.SeriesColor:=clYellow;
       end;
    1: begin                                 { gradient 2 colors }
         Series1.UseColorRange:=True;
         Series1.UsePalette:=False;
         Series1.StartColor:=clBlue;
         Series1.EndColor:=clRed;
         Series1.MidColor:=clNone;
       end;
    2: begin                                 { gradient 3 colors }
         Series1.UseColorRange:=True;
         Series1.UsePalette:=False;
         Series1.StartColor:=clBlue;
         Series1.EndColor:=clRed;
         Series1.MidColor:=clYellow;
       end;
    3: begin                                 { palette "pale" }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=True;
         Series1.PaletteStyle:=psPale;
       end;
    4: begin                                 { palette "strong" }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=True;
         Series1.PaletteStyle:=psStrong;
       end;
    5: begin                                 { palette "gray levels" }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=True;
         Series1.PaletteStyle:=psGrayScale;
       end;
    6: begin                                 { palette "Inverted gray levels" }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=True;
         Series1.PaletteStyle:=psInvGray;
       end;
    7: begin                                 { palette "Rainbow" }
         Series1.UseColorRange:=False;
         Series1.UsePalette:=True;
         Series1.PaletteStyle:=psRainbow;
       end;
  end;
end;

procedure TContourPaletteForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=2;
  ComboBox1Change(Self);
end;

initialization
  RegisterClass(TContourPaletteForm);
end.
