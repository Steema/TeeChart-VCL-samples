unit Line_ColorEachLine;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TLineColorEachLine = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TLineSeries;
    CheckBox2: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
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

procedure TLineColorEachLine.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);

  Chart1.View3D:=False;
  Series1.ColorEachPoint:=True;
  Series1.ColorEachLine:=False;
end;

procedure TLineColorEachLine.CheckBox1Click(Sender: TObject);
begin
  Series1.ColorEachLine:=CheckBox1.Checked;
end;

procedure TLineColorEachLine.CheckBox2Click(Sender: TObject);
begin
  CheckBox1.Enabled:=CheckBox2.Checked;
  Series1.ColorEachPoint:=CheckBox2.Checked;
end;

initialization
  RegisterClass(TLineColorEachLine);
end.
