unit TeeGDIPlusComponent;
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
  TeEngine, Series, TeeProcs, Chart, TeeTools, TeeComma, TeCanvas,
  Base, TeeNumericGauge, TeeLinearGauge, TeeCircularGauge, TeeGDIPlus;

// Sample project showing the TTeeGDIPlus to render TeeChart
// controls using Microsoft GDI+ Plus dlls.

type
  TGDIPlusComponentForm = class(TBaseForm)
    TeeCommander1: TTeeCommander;
    CheckBox1: TCheckBox;
    TeeGDIPlus1: TTeeGDIPlus;
    CheckBox3: TCheckBox;
    Series1: TCircularGauge;
    CBAliasText: TComboFlat;
    Label1: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    procedure CBAliasTextChange(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
    g: TGDIPlusCanvas;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TGDIPlusComponentForm.CheckBox1Click(Sender: TObject);
begin
  TeeGDIPlus1.Antialias:=CheckBox1.Checked;
end;

procedure TGDIPlusComponentForm.FormCreate(Sender: TObject);
begin
  CheckBox3Click(Self);
end;

procedure TGDIPlusComponentForm.CheckBox3Click(Sender: TObject);
begin
  inherited;
  
  TeeGDIPlus1.Active:=CheckBox3.Checked;

  // Some options for GDI Plus canvas
  TeeGDIPlus1.Antialias:=CheckBox1.Checked;
  TeeGDIPlus1.AntiAliasText:=TGDIPlusFontQuality(CBAliasText.ItemIndex);

  CheckBox1.Enabled:=CheckBox3.Checked;
  CBAliasText.Enabled:=CheckBox3.Checked;
end;

procedure TGDIPlusComponentForm.CBAliasTextChange(Sender: TObject);
begin
  TeeGDIPlus1.AntiAliasText:=TGDIPlusFontQuality(CBAliasText.ItemIndex);
end;

initialization
  RegisterClass(TGDIPlusComponentForm);
end.
