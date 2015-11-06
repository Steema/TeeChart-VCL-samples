unit FastLine_TreatNulls;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeeChartGrid;

type
  TFastLineTreatNulls = class(TBaseForm)
    RadioGroup1: TRadioGroup;
    Label1: TLabel;
    Edit1: TEdit;
    ChartGrid1: TChartGrid;
    Splitter1: TSplitter;
    procedure cbIgnoreNullsClick(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
    procedure FillSeries;
  public
    Series1  : TFastLineSeries;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TFastLineTreatNulls.FillSeries;
var
  X: Integer;
  Y: Double;
  done : Boolean;
begin
  done := False;

  for X:=0 To 100 do
  begin
     if X mod 2 = 0 then
        Y := 10
     else
        Y := 20;

     if (X >= 30) and (X <= 70) then
     begin
       if not done then
          Series1.AddNullXY(X, 0);

       done := True;
     end
     else
     begin
        Series1.AddXY(X, Y);
     end;
  end;
end;

procedure TFastLineTreatNulls.cbIgnoreNullsClick(Sender: TObject);
begin
//  Series1.IgnoreNulls:=cbIgnoreNulls.Checked;
end;

procedure TFastLineTreatNulls.RadioGroup1Click(Sender: TObject);
begin
  Series1.TreatNulls:=TTreatNullsStyle(RadioGroup1.ItemIndex);
end;

procedure TFastLineTreatNulls.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    Series1.YValues[30]:=StrToFloat(Edit1.Text);
    Series1.Repaint;
  end;
end;

procedure TFastLineTreatNulls.FormCreate(Sender: TObject);
begin
  inherited;

  Series1:=TFastLineSeries.Create(Self);
  Chart1.AddSeries(Series1);

  Chart1.Axes.Left.SetMinMax(-10, 30);
  FillSeries;
  ChartGrid1.RecalcDimensions;
end;

initialization
  RegisterClass(TFastLineTreatNulls);
end.
