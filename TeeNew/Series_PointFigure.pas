unit Series_PointFigure;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls,
  {$ENDIF}
  TeePointFigure, Base, TeeProcs, TeEngine, Chart, Series, OHLChart;

type
  TPointFigureDemo = class(TBaseForm)
    Button1: TButton;
    Series1: TPointFigureSeries;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
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

uses EditChar;

procedure TPointFigureDemo.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues;
  Series1.BoxSize:=5;
end;

procedure TPointFigureDemo.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

initialization
  RegisterClass(TPointFigureDemo);
end.
