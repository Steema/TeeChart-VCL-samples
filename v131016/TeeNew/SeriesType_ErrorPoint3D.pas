unit SeriesType_ErrorPoint3D;
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
  TErrorPoint3DSeriesForm = class(TBaseForm)
    Button1: TButton;
    procedure Button1Click(Sender: TObject);
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

Uses EditChar, TeeConst, TeeErrorPoint;

var Series1: TErrorPoint3DSeries;

procedure TErrorPoint3DSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TErrorPoint3DSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1:=Chart1.AddSeries(TErrorPoint3DSeries) as TErrorPoint3DSeries;
  Series1.ColorEachPoint:=true;
  Series1.FillSampleValues(10);
end;

initialization
  RegisterClass(TErrorPoint3DSeriesForm);
end.
