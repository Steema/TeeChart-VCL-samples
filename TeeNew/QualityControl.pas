unit QualityControl;
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
  TeeProcs, TeEngine, Chart, Series;

type
  TFormQuality = class(TForm)
    Chart1: TChart;
    Good: TLineSeries;
    Bad: TLineSeries;
    Upper: TFastLineSeries;
    Lower: TFastLineSeries;
    Panel1: TPanel;
    Memo2: TMemo;
    Panel2: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    UpperEdit: TEdit;
    LowerEdit: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure UpperEditChange(Sender: TObject);
    procedure LowerEditChange(Sender: TObject);
  private
    { Private declarations }
    UpperLim : Double;
    LowerLim : Double;
    Procedure CalculateSPC(GoodSeries,BadSeries:TChartSeries);
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

{ Calculate the upper and lower limits }
Procedure TFormQuality.CalculateSPC(GoodSeries,BadSeries:TChartSeries);
Var Sum,SumN,
    tmp,Aux,
    LCP,
    LCN,
    NumTotal,
    Percent    : Double;
    t,N        : Integer;
Begin
  UpperLim:=0;
  LowerLim:=0;
  Sum:=0;
  SumN:=0;
  N:=0;
  for t:=0 to GoodSeries.Count-1 do
  begin
    Percent:=(BadSeries.YValues[t]*GoodSeries.YValues[t]/100.0);
    NumTotal:=GoodSeries.YValues[t]+Percent;
    if NumTotal>0 then
    Begin
      Sum:=Sum+Percent/NumTotal;
      SumN:=SumN+NumTotal;
      inc(n);
    end;
  end;
  LCP:=Sum/n;
  LCN:=SumN/n;
  tmp:=(LCP*(1-LCP))/LCN;
  if tmp>0 then
  Begin
    Aux:=3*Sqrt(tmp); { <-- 3 by square root }
    UpperLim:=100.0*(LCP+Aux);
    LowerLim:=100.0*(LCP-Aux);
  end;
End;

procedure TFormQuality.FormCreate(Sender: TObject);
var t:Integer;
begin
  Good.Clear;
  for t:=0 to 19 do Good.Add(800+Random(200),'',clTeeColor);

  Bad.Clear;
  for t:=0 to 19 do Bad.Add(4+Random(4),'',clTeeColor);

  CalculateSPC(Good,Bad);

  UpperEdit.Text:=FormatFloat('#.0000',UpperLim);
  LowerEdit.Text:=FormatFloat('#.0000',LowerLim);

  Chart1.LeftAxis.SetMinMax(0,1100);
  Chart1.RightAxis.SetMinMax(0,10);
end;

procedure TFormQuality.UpperEditChange(Sender: TObject);
var tmp : Double;
begin
  try
    tmp:=StrToFloat(UpperEdit.Text);
  except
    on Exception do exit;
  end;
  Upper.Clear;
  Upper.AddXY(0,tmp);
  Upper.AddXY(19,tmp);
end;

procedure TFormQuality.LowerEditChange(Sender: TObject);
var tmp : Double;
begin
  try
    tmp:=StrToFloat(LowerEdit.Text);
  except
    on Exception do exit;
  end;
  Lower.Clear;
  Lower.AddXY(0,tmp);
  Lower.AddXY(19,tmp);
end;

initialization
  RegisterClass(TFormQuality);
end.
