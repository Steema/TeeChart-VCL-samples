unit Surface_WirePalette;
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
  TSurfaceWire = class(TBaseForm)
    Series1: TSurfaceSeries;
    Label1: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TSurfaceWire.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.View3D := True;
  Series1.FillSampleValues(10);

  Series1.UsePalette:=True;
  Series1.Pen.Width:=2;
  Series1.WireFrame:=True;
end;

procedure TSurfaceWire.ComboBox1Change(Sender: TObject);
begin
  Case ComboBox1.ItemIndex of
    0: begin Series1.UseColorRange:=False; Series1.UsePalette:=False; end;
    1: begin Series1.UseColorRange:=True; Series1.UsePalette:=False; end;
    2: begin Series1.UseColorRange:=False; Series1.UsePalette:=True; end;
  end;
end;

procedure TSurfaceWire.CheckBox1Click(Sender: TObject);
begin
  Series1.WireFrame:=CheckBox1.Checked;
end;

procedure TSurfaceWire.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=2;
end;

initialization
  RegisterClass(TSurfaceWire);
end.
