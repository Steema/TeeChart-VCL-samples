unit Contour_Levels;
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
  TContourLevels = class(TBaseForm)
    Series1: TContourSeries;
    CheckBox1: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
  private
    { Private declarations }
    Procedure AddCustomLevels;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TContourLevels.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  AddCustomLevels;
end;

procedure TContourLevels.CheckBox1Click(Sender: TObject);
begin
  Series1.AutomaticLevels:=not CheckBox1.Checked;
  if not Series1.AutomaticLevels then AddCustomLevels;
end;

Procedure TContourLevels.AddCustomLevels;
begin
  Series1.NumLevels:=10;
  Series1.CreateAutoLevels;
  With Series1.Levels do
  begin
    Items[0].UpToValue:=-1;
    Items[1].UpToValue:=-0.8;
    Items[2].UpToValue:=-0.6;
    Items[3].UpToValue:=-0.4;
    Items[4].UpToValue:=-0.2;
    Items[5].UpToValue:= 0;
    Items[6].UpToValue:= 0.2;
    Items[7].UpToValue:= 0.4;
    Items[8].UpToValue:= 0.6;
    Items[9].UpToValue:= 0.8;
  end;
end;

initialization
  RegisterClass(TContourLevels);
end.
