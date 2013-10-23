unit Series_ColorGridTransparency;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, TeCanvas, Series, TeeProcs, Chart, TeeSurfa;

type
  TSeriesColorGridTransparency = class(TBaseForm)
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Series1: TContourSeries;
    Series2: TColorGridSeries;
    CheckBox1: TCheckBox;
    procedure Edit1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSeriesColorGridTransparency.Edit1Change(Sender: TObject);
begin
  Series2.Transparency:=UpDown1.Position;

  CheckBox1.Checked:= Series2.Transparency=0;
  CheckBox1.Enabled:=not CheckBox1.Checked;
end;

procedure TSeriesColorGridTransparency.CheckBox1Click(Sender: TObject);
begin
  if CheckBox1.Checked then
  begin
    UpDown1.Position:=0;
    Series2.Transparency:=0;

    CheckBox1.Enabled:=False;
  end;
end;

initialization
  RegisterClass(TSeriesColorGridTransparency);
end.
