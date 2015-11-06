unit Series3D_RangePalette;
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, TeeSurfa, TeePenDlg;

type
  TSeries3DRangePalette = class(TBaseForm)
    ButtonColor1: TButtonColor;
    ButtonColor2: TButtonColor;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    CheckBox1: TCheckBox;
    Series1: TColorGridSeries;
    ButtonColor3: TButtonColor;
    procedure CheckBox1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ButtonColor1Click(Sender: TObject);
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

procedure TSeries3DRangePalette.CheckBox1Click(Sender: TObject);
begin
  { enable the edit box... }
  Edit1.Enabled:=not CheckBox1.Checked;
  UpDown1.Enabled:=not CheckBox1.Checked;

  { do we use "Steps" ?? }
  if CheckBox1.Checked then  { no }
  begin
    Series1.UsePalette:=False;
    Series1.UseColorRange:=True;
    Series1.CreateDefaultPalette(Series1.PaletteSteps);
  end
  else  { yes }
  begin
    Series1.UsePalette:=True;
    Series1.UseColorRange:=False;
    Series1.CreateRangePalette;    { <-- new, use range of colors }
  end;
end;

procedure TSeries3DRangePalette.Edit1Change(Sender: TObject);
begin
  if Showing then  { re-create the color palette using range }
  begin
    Series1.PaletteSteps:=UpDown1.Position;
    Series1.CreateRangePalette;
    Series1.Repaint;
  end;
end;

procedure TSeries3DRangePalette.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(100);
  Series1.PaletteSteps:=10;

  { set-up initial values for controls }
  ButtonColor1.LinkProperty(Series1,'StartColor');
  ButtonColor2.LinkProperty(Series1,'EndColor');
  ButtonColor3.LinkProperty(Series1,'MidColor');
  UpDown1.Position:=Series1.PaletteSteps;

  { create the palette }
  CheckBox1Click(Self);
end;

procedure TSeries3DRangePalette.ButtonColor1Click(Sender: TObject);
begin
  inherited;
  if not CheckBox1.Checked then Series1.CreateRangePalette;
end;

initialization
  RegisterClass(TSeries3DRangePalette);
end.
