unit ChartGrid_AllowAppend;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, Grids, TeeChartGrid;

type
  TChartGridAllowAppend = class(TBaseForm)
    ChartGrid1: TChartGrid;
    cbAllowAppend: TCheckBox;
    procedure FormCreate(Sender: TObject);
    procedure cbAllowAppendClick(Sender: TObject);
  private
    { Private declarations }
    BarSeries : TBarSeries;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TChartGridAllowAppend.FormCreate(Sender: TObject);
begin
  inherited;

  BarSeries:=TBarSeries.Create(self);
  Chart1.AddSeries(BarSeries);

  with BarSeries do
  begin
    FillSampleValues();
    ColorEachPoint:=True;
  end;

  with ChartGrid1 do
  begin
    Chart:=Chart1;
    AllowAppend:=true;
    Hint:='KeyDown to Append';
  end;
end;

procedure TChartGridAllowAppend.cbAllowAppendClick(Sender: TObject);
begin
  ChartGrid1.AllowAppend:=cbAllowAppend.Checked;
end;

initialization
  RegisterClass(TChartGridAllowAppend);
end.
