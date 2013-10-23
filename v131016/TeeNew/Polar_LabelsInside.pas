unit Polar_LabelsInside;
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
  Base, TeEngine, Series, TeePolar, TeeProcs, Chart;

type
  TPolarLabelsInside = class(TBaseForm)
    Series1: TPolarSeries;
    CheckBox1: TCheckBox;
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

procedure TPolarLabelsInside.CheckBox1Click(Sender: TObject);
begin
  Series1.CircleLabelsInside:=CheckBox1.Checked
end;

procedure TPolarLabelsInside.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series1.CircleLabelsInside:=True;
end;

initialization
  RegisterClass(TPolarLabelsInside);
end.
