unit HorizLine_Series;
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
  Base, TeeComma, TeEngine, Series, TeeProcs, Chart;

type
  THorizLineForm = class(TBaseForm)
    Series1: THorizLineSeries;
    TeeCommander1: TTeeCommander;
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

procedure THorizLineForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(8);
end;

procedure THorizLineForm.CheckBox1Click(Sender: TObject);
begin
  Series1.Stairs:=CheckBox1.Checked;
end;

initialization
  RegisterClass(THorizLineForm);
end.
