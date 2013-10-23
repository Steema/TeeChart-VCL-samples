unit Surface_Smooth;
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
  TSurfaceSmooth = class(TBaseForm)
    Series1: TSurfaceSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TSurfaceSmooth.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
end;

procedure TSurfaceSmooth.CheckBox1Click(Sender: TObject);
begin
  inherited;
  Series1.SmoothPalette:=CheckBox1.Checked
end;

initialization
  RegisterClass(TSurfaceSmooth);
end.
