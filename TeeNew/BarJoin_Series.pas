unit BarJoin_Series;
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
  Base, TeCanvas, TeEngine, Series, MyPoint, TeeProcs, Chart, TeePenDlg;

type
  TBarJoinForm = class(TBaseForm)
    Series1: TBarJoinSeries;
    ButtonPen1: TButtonPen;
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

procedure TBarJoinForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(3);
  ButtonPen1.LinkPen(Series1.JoinPen);
end;

initialization
  RegisterClass(TBarJoinForm);
end.
