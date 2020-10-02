unit Area_Stairs;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeGDIPlus;

type
  TAreaStairsForm = class(TBaseForm)
    Series1: TAreaSeries;
    CheckBox1: TCheckBox;
    Series2: TAreaSeries;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TAreaStairsForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Stairs:=CheckBox1.Checked;
  Series2.Stairs:=CheckBox1.Checked;
end;

procedure TAreaStairsForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series2.FillSampleValues(10);
end;

initialization
  RegisterClass(TAreaStairsForm);
end.
