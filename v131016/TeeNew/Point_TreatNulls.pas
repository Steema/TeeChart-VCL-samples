unit Point_TreatNulls;
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
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas, FastLine_TreatNulls,
  TeeChartGrid;

type
  TPointTreatNulls = class(TFastLineTreatNulls)
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FillSeries;
  public
    { Public declarations }
    Point : TPointSeries;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TPointTreatNulls.FillSeries;
var
  X: Integer;
  Y: Double;
  done : Boolean;
begin
  done := False;

  for X:=0 To 5 do
  begin
     if X mod 2 = 0 then
        Y := 10
     else
        Y := 20;

     if X = 3 then
     begin
       if not done then
          Point.AddNullXY(X, 0);

       done := True;
     end
     else
        Point.AddXY(X, Y);
  end;
end;

procedure TPointTreatNulls.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.RemoveAllSeries;

  Chart1.Axes.Left.SetMinMax(-10, 30);

  Point := TPointSeries.Create(Self);
  Chart1.AddSeries(Point);

  FillSeries;
  ChartGrid1.RecalcDimensions;
  RadioGroup1.ItemIndex:=0;
end;

procedure TPointTreatNulls.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    Point.YValues[3]:=StrToFloat(Edit1.Text);
    Point.Repaint;
  end;
end;

procedure TPointTreatNulls.RadioGroup1Click(Sender: TObject);
begin
  Point.TreatNulls:=TTreatNullsStyle(RadioGroup1.ItemIndex);
end;

initialization
  RegisterClass(TPointTreatNulls);
end.

