unit Function_Count;
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
  Base, TeEngine, TeeFunci, Series, TeeProcs, Chart, TeeCount;

type
  TCountForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TLineSeries;
    TeeFunction1: TCountTeeFunction;
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

procedure TCountForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

initialization
  RegisterClass(TCountForm);
end.
