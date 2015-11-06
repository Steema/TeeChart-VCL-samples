unit Line_Outline;
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
  Base, TeCanvas, TeePenDlg, TeEngine, Series, TeeProcs, Chart;

type
  TLineOutline = class(TBaseForm)
    Series1: TLineSeries;
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

procedure TLineOutline.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(25);

  ButtonPen1.LinkPen(Series1.LinePen);
  ButtonPen2.LinkPen(Series1.OutLine);
end;

initialization
  RegisterClass(TLineOutline);
end.
