unit Axis_LabelsBehind;
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
  TAxisLabelsBehind = class(TBaseForm)
    CBLeftLabelsBehind: TCheckBox;
    Series1: TPointSeries;
    procedure FormCreate(Sender: TObject);
    procedure CBLeftLabelsBehindClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  AxisLabelsBehind: TAxisLabelsBehind;  

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar;

procedure TAxisLabelsBehind.FormCreate(Sender: TObject);
begin
  inherited;

  CBLeftLabelsBehind.Checked := Chart1.Axes.Left.LabelsBehind;
  Chart1.Gradient.Visible := False;  
end;

procedure TAxisLabelsBehind.CBLeftLabelsBehindClick(Sender: TObject);
begin
  Chart1.Axes.Left.LabelsBehind := CBLeftLabelsBehind.Checked;
end;

initialization
  RegisterClass(TAxisLabelsBehind);
end.
