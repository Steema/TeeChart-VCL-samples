unit Function_SubSet;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, TeeSubsetEditor, TeCanvas,
  TeeFunci;

type
  TSubSetFunctionForm = class(TBaseForm)
    Series1: TBarSeries;
    Series2: TLineSeries;
    TeeFunction1: TSubsetTeeFunction;
    Label1: TLabel;
    CBValues: TComboFlat;
    Label2: TLabel;
    EStart: TEdit;
    Label3: TLabel;
    EEnd: TEdit;
    UpDown1: TUpDown;
    UpDown2: TUpDown;
    procedure FormCreate(Sender: TObject);
    procedure CBValuesChange(Sender: TObject);
    procedure EStartChange(Sender: TObject);
    procedure EEndChange(Sender: TObject);
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

procedure TSubSetFunctionForm.FormCreate(Sender: TObject);
begin
  inherited;

  CBValues.ItemIndex:=0;

  UpDown1.Max:=Round(Series1.XValues.MaxValue);
  UpDown2.Max:=Round(Series1.XValues.MaxValue);
end;

procedure TSubSetFunctionForm.CBValuesChange(Sender: TObject);
var tmp: TChartSeries;
begin
  Series2.MandatoryValueList.ValueSource:=CBValues.Text;

  tmp:=Chart1.Series[0];

  if CBValues.ItemIndex=0 then
  begin
    // change series type to TBarSeries
    ChangeSeriesType(tmp,TBarSeries);

    UpDown1.Position:=Round(Series1.XValues.MinValue);
    UpDown2.Position:=Round(Series1.XValues.MaxValue);
    UpDown1.Max:=Round(Series1.XValues.MaxValue);
    UpDown2.Max:=Round(Series1.XValues.MaxValue);
  end
  else begin
    // change series type to THorizBarSeries
    ChangeSeriesType(tmp,THorizBarSeries);

    UpDown1.Position:=Round(Series1.YValues.MinValue);
    UpDown2.Position:=Round(Series1.YValues.MaxValue);
    UpDown1.Max:=Round(Series1.YValues.MaxValue);
    UpDown2.Max:=Round(Series1.YValues.MaxValue);
  end;

  Series2.CheckDataSource;
end;

procedure TSubSetFunctionForm.EStartChange(Sender: TObject);
begin
  TeeFunction1.StartValue:=UpDown1.Position;
end;

procedure TSubSetFunctionForm.EEndChange(Sender: TObject);
begin
  TeeFunction1.EndValue:=UpDown2.Position;
end;

initialization
  RegisterClass(TSubSetFunctionForm);
end.
