unit Surface_Palette;
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
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeGDIPlus;

type
  TSurfacePaletteForm = class(TBaseForm)
    Series1: TSurfaceSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TSurfacePaletteForm.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: Series1.PaletteStyle:=psPale;
    1: Series1.PaletteStyle:=psStrong;
    2: Series1.PaletteStyle:=psGrayScale;
    3: Series1.PaletteStyle:=psInvGray;
    4: begin
         Series1.PaletteStyle:=psRainbow;
         Series1.PaletteSteps:=25;
       end;
  end;
end;

procedure TSurfacePaletteForm.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;

  Series1.FillSampleValues(30);
  Series1.PaletteStyle := psRainbow;
end;

procedure TSurfacePaletteForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=1;
end;

initialization
  RegisterClass(TSurfacePaletteForm);
end.
