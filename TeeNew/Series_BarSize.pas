unit Series_BarSize;
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
  Base, TeeProcs, TeCanvas, TeEngine, Chart, TeeBarSizeSeries, TeeTools;

type
  TBarSizeSeriesForm = class(TBaseForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ScrollBar1: TScrollBar;
    ScrollBar2: TScrollBar;
    ChartTool1: TAnnotationTool;
    procedure FormCreate(Sender: TObject);
    procedure ScrollBar1Change(Sender: TObject);
    procedure ScrollBar2Change(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
  private
    { Private declarations }
    Series1: TBarSizeSeries;
    procedure RefreshAnnotation;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TBarSizeSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1:=TBarSizeSeries.Create(Self);

  with Series1 do
  begin
    ParentChart:=Chart1;
    FillSampleValues;

    SizeValues[0]:=0.4;
    SizeValues[2]:=0.1;
    SizeValues[4]:=1.1;

    XValues[3]:=2.8;

    ValueColor[1]:=clBlue;
    ValueColor[4]:=clYellow;

    Marks.Visible:=False;
    
    Cursor:=crHandPoint;
  end;

  ScrollBar1.Max:=Series1.Count*100;
  ScrollBar1.Min:=-ScrollBar1.Max;

  UpDown1.Max:=Series1.Count-1;

end;

procedure TBarSizeSeriesForm.ScrollBar1Change(Sender: TObject);
begin
  Series1.XValues[UpDown1.Position]:=ScrollBar1.Position/100;
  Series1.Repaint;
  Label4.Caption:=FormatFloat('0.##',Series1.XValues[UpDown1.Position]);

  RefreshAnnotation;
end;

procedure TBarSizeSeriesForm.ScrollBar2Change(Sender: TObject);
begin
  Series1.SizeValues[UpDown1.Position]:=ScrollBar2.Position/100;
  Series1.Repaint;
  Label5.Caption:=FormatFloat('0.##',Series1.SizeValues[UpDown1.Position]);
end;

procedure TBarSizeSeriesForm.Edit1Change(Sender: TObject);
begin
  if Assigned(Series1) then
  begin
    ScrollBar1.Position:=Round(Series1.XValues[UpDown1.Position]*100);
    ScrollBar2.Position:=Round(Series1.SizeValues[UpDown1.Position]*100);

    RefreshAnnotation;
  end;
end;

procedure TBarSizeSeriesForm.RefreshAnnotation;
begin
  ChartTool1.Text:=IntToStr(UpDown1.Position);
  ChartTool1.Shape.Top:=Chart1.Height-28;
  ChartTool1.Shape.Left:=Series1.CalcXPosValue(Series1.XValues[UpDown1.Position])-8;
end;

procedure TBarSizeSeriesForm.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
  if ValueIndex>=0 then
     UpDown1.Position:=ValueIndex;
end;

initialization
  RegisterClass(TBarSizeSeriesForm);
end.
