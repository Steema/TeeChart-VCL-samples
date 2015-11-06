unit Shape_Image;
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
  Base, TeEngine, TeeShape, TeeProcs, Chart;

type
  TShapeImage = class(TBaseForm)
    Series1: TChartShape;
    Series2: TChartShape;
    CheckBox1: TCheckBox;
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

procedure TShapeImage.CheckBox1Click(Sender: TObject);
begin
  Series1.Transparent:=CheckBox1.Checked;
  Series2.Transparent:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TShapeImage);
end.
