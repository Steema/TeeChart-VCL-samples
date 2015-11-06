unit TriSurface_Series;
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
  Base, TeCanvas, TeEngine, TeeSurfa, TeeTriSurface, TeeProcs,
  Chart, TeePenDlg;

type
  TTriSurfaceForm = class(TBaseForm)
    Series1: TTriSurfaceSeries;
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

procedure TTriSurfaceForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(30);
  ButtonPen1.LinkPen(Series1.Border);
  ButtonPen2.LinkPen(Series1.Pen);
end;

initialization
  RegisterClass(TTriSurfaceForm);
end.
