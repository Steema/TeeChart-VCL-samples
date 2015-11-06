unit Series_WindRoseMirrorAngles;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeePolar, TeeRose;

type
  TSeriesWindRoseMirrorAngles = class(TBaseForm)
    Series1: TWindRoseSeries;
    cbMirror: TCheckBox;
    cbMirrorLabels: TCheckBox;
    ComboFlat1: TComboFlat;
    procedure cbMirrorClick(Sender: TObject);
    procedure cbMirrorLabelsClick(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
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

procedure TSeriesWindRoseMirrorAngles.cbMirrorClick(Sender: TObject);
begin
  Series1.MirrorAngles:=cbMirror.Checked;
end;

procedure TSeriesWindRoseMirrorAngles.cbMirrorLabelsClick(Sender: TObject);
begin
  Series1.MirrorLabels:=cbMirrorLabels.Checked;
end;

procedure TSeriesWindRoseMirrorAngles.ComboFlat1Change(Sender: TObject);
begin
  Series1.AngleIncrement:=StrToFloat(ComboFlat1.CurrentItem);
end;

initialization
  RegisterClass(TSeriesWindRoseMirrorAngles);
end.
