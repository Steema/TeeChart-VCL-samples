unit ChartGrid_FirstRowNum;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QButtons, QExtCtrls,
  QGrids,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, Buttons, ExtCtrls, Grids,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, TeeChartGrid;

type
  TChartGridFirstRowNum = class(TBaseForm)
    cbShowFields: TCheckBox;
    BitBtn1: TBitBtn;
    ChartGrid1: TChartGrid;
    Series1: TAreaSeries;
    Series2: TAreaSeries;
    procedure cbShowFieldsClick(Sender: TObject);
    procedure BitBtn1Click(Sender: TObject);
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

procedure TChartGridFirstRowNum.cbShowFieldsClick(Sender: TObject);
begin
  ChartGrid1.ShowFields:=cbShowFields.Checked;
end;

procedure TChartGridFirstRowNum.BitBtn1Click(Sender: TObject);
begin
  ShowMessage('Row num. : ' + IntToStr(ChartGrid1.FirstRowNum));
end;

procedure TChartGridFirstRowNum.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Depth:=0;
  Series2.Depth:=0;
end;

initialization
  RegisterClass(TChartGridFirstRowNum);
end.

