unit Series_ValueList;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TDynArrays = class(TBaseForm)
    Button1: TButton;
    Series1: TFastLineSeries;
    Label1: TLabel;
    Edit1: TEdit;
    procedure Button1Click(Sender: TObject);
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

procedure TDynArrays.Button1Click(Sender: TObject);
Var X,Y : TChartValues; // Array of Double; 
    t   : Integer;
    Num : Integer;
begin
  { number of points }
  Num:=StrToInt(Edit1.Text);

  { allocate our custom arrays }
  SetLength(X,Num);
  SetLength(Y,Num);

  { fill data in our custom arrays }
  X[0]:=0;
  Y[0]:=Random(10000);
  for t:=1 to Num-1 do
  begin
    X[t]:=t;
    Y[t]:=Y[t-1]+Random(101)-50;
  end;

  { set our X array }
  With Series1.XValues do
  begin
    Value:=TChartValues(X);  { <-- the array }
    Count:=Num;               { <-- number of points }
    Modified:=True;           { <-- recalculate min and max }
  end;

  { set our Y array }
  With Series1.YValues do
  begin
    Value:=TChartValues(Y);
    Count:=Num;
    Modified:=True;
  end;

  Chart1.UndoZoom; { <-- remove zoom (optional) }

  { Show data }
  Series1.Repaint;
end;

initialization
  RegisterClass(TDynArrays);
end.
