unit Series_BarNegativeStacked;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeComma;

type
  TBarStackNegative = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TBarSeries;
    Series3: TBarSeries;
    TeeCommander1: TTeeCommander;
    ChartTool1: TColorLineTool;
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

procedure TBarStackNegative.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.AddArray([ 23, -56, 42, 9, -8] );
  Series2.AddArray([ 32, -16, 9, 39, -28] );
  Series3.AddArray([ 12, -21, 14, 22, -13] );
end;

initialization
  RegisterClass(TBarStackNegative);
end.
