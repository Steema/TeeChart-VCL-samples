unit Chart_FreeAllSeries;
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
  Base, Series, TeEngine, TeeProcs, Chart;

type
  TFreeAllSeriesForm = class(TBaseForm)
    Button1: TButton;
    Series1: TBarSeries;
    Series2: TLineSeries;
    Series3: TBarSeries;
    Series4: TLineSeries;
    Series5: TBarSeries;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TFreeAllSeriesForm.Button1Click(Sender: TObject);
begin
  Chart1.FreeAllSeries( TLineSeries ); { removes LINE only }
  Button1.Enabled:=False;
end;

procedure TFreeAllSeriesForm.Button2Click(Sender: TObject);
begin
  Chart1.FreeAllSeries( TBarSeries );  { removes BAR only }
  Button2.Enabled:=False;
end;

procedure TFreeAllSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
  Series2.FillSampleValues(21);
  Series3.FillSampleValues(6);
  Series4.FillSampleValues(16);
  Series5.FillSampleValues(6);
end;

initialization
  RegisterClass(TFreeAllSeriesForm);
end.
