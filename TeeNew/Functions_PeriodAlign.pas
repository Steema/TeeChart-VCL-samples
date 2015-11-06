unit Functions_PeriodAlign;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, StatChar;

type
  TFunctionsPeriod = class(TBaseForm)
    Label1: TLabel;
    ScrollBar1: TScrollBar;
    Series1: TBarSeries;
    Series2: TLineSeries;
    TeeFunction1: TExpMovAveFunction;
    Label2: TLabel;
    Label3: TLabel;
    cbPeriodAlign: TComboFlat;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure cbPeriodAlignChange(Sender: TObject);
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

procedure TFunctionsPeriod.FormCreate(Sender: TObject);
begin
  inherited;

  ScrollBar1.Max:=Series1.Count-1;
  cbPeriodAlign.ItemIndex:=1;

  with TeeFunction1 do
  begin
    Period:=ScrollBar1.Position;
    PeriodAlign:=paCenter;
  end;
end;

procedure TFunctionsPeriod.ScrollBar1Change(Sender: TObject);
begin
  TeeFunction1.Period:=ScrollBar1.Position;

  Label2.Caption:=IntToStr(ScrollBar1.Position);
end;

procedure TFunctionsPeriod.cbPeriodAlignChange(Sender: TObject);
begin
  TeeFunction1.PeriodAlign:=TFunctionPeriodAlign(cbPeriodAlign.ItemIndex);

  Series2.CheckDataSource;
end;

initialization
  RegisterClass(TFunctionsPeriod);
end.
