unit Area_TreatNulls;
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
  Base, TeeProcs, TeEngine, Chart, Series, FastLine_TreatNulls, TeeChartGrid,
  TeeGDIPlus;

type
  TAreaTreatNulls = class(TFastLineTreatNulls)
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure RadioGroup1Click(Sender: TObject);
  private
    { Private declarations }
    procedure FillSeries;
  public
    { Public declarations }
    Area : TAreaSeries;
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAreaTreatNulls.FillSeries;
var
  X: Integer;
  Y: Double;
  done : Boolean;
begin
  done := false;

  for X:=0 To 10 do
  begin
     if X mod 2 = 0 then
        Y := 10
     else
        Y := 20;

     if (X >= 3) and (X <= 7) then
     begin
       if not done then
          Area.AddNullXY(X, 0);

       done := true;
     end
     else
       Area.AddXY(X, Y);
  end;
end;

procedure TAreaTreatNulls.FormCreate(Sender: TObject);
begin
  inherited;

  Chart1.RemoveAllSeries;

  Chart1.Axes.Left.SetMinMax(-10, 30);

  Area := TAreaSeries.Create(Self);
  Chart1.AddSeries(Area);

  FillSeries;
  ChartGrid1.RecalcDimensions;
  RadioGroup1.ItemIndex:=0;
end;

procedure TAreaTreatNulls.Edit1Change(Sender: TObject);
begin
  if Edit1.Text <> '' then
  begin
    Area.YValues[3]:=StrToFloatDef(Edit1.Text,Area.YValues[3]);
    Area.Repaint;
  end;
end;

procedure TAreaTreatNulls.RadioGroup1Click(Sender: TObject);
begin
  Area.TreatNulls:=TTreatNullsStyle(RadioGroup1.ItemIndex);
end;

initialization
  RegisterClass(TAreaTreatNulls);
end.
