unit Function_MoneyFlow;
{$I TeeDefs.inc}

interface

uses
  Windows, Messages, SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, CandleCh, Series, OHLChart, StatChar;

type
  TMoneyFlowFunctionForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TVolumeSeries;
    bRandom: TButton;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure bRandomClick(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }

    func : TMoneyFlowFunction;
    line : tlineseries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

uses
  TeeFuncEdit, EditChar;

procedure TMoneyFlowFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.FillSampleValues(10);

  line := TLineSeries.Create(self);
  line.ParentChart := Chart1;
  line.DataSource := Series1;
  Chart1.Addseries(line);

  series2.FillSampleValues(10);

  func := TMoneyFlowFunction.Create(self);
  func.ParentSeries:=line;
  func.Volume := Series2;

  line.CheckDataSource;
  line.CustomVertAxis := Chart1.CustomAxes[1];

  func.CMFStyle := cmfHistogram;
  func.HistogramPen.Visible := false;
end;

procedure TMoneyFlowFunctionForm.bRandomClick(Sender: TObject);
begin
  Series1.FillSampleValues(10);
end;

procedure TMoneyFlowFunctionForm.Button1Click(Sender: TObject);
begin
  EditSeriesDataSource(Self,line);
end;

initialization
  RegisterClass(TMoneyFlowFunctionForm);
end.
