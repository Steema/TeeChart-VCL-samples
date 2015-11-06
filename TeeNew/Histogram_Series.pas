unit Histogram_Series;
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
  Base, TeCanvas, TeEngine, Series, StatChar, TeeProcs, Chart, TeePenDlg;

type
  THistogramForm = class(TBaseForm)
    Series1: THistogramSeries;
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
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

procedure THistogramForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  ButtonPen1.LinkPen(Series1.LinePen);
  ButtonPen2.LinkPen(Series1.LinesPen);
end;

initialization
  RegisterClass(THistogramForm);
end.
