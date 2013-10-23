unit Function_AverageNulls;
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
  Base, TeEngine, TeeFunci, Series, TeeProcs, Chart;

type
  TAverageFunctionNulls = class(TBaseForm)
    CheckBox1: TCheckBox;
    Series1: TBarSeries;
    Series2: TLineSeries;
    TeeFunction1: TAverageTeeFunction;
    Label1: TLabel;
    LabelAverage: TLabel;
    procedure CheckBox1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Procedure SetLabelAverage;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TAverageFunctionNulls.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.IncludeNulls:=CheckBox1.Checked;

  SetLabelAverage;
end;

Procedure TAverageFunctionNulls.SetLabelAverage;
var tmp      : Double;
    t        : Integer;
    tmpCount : Integer;
begin
  { calculate the sum and number of points... }
  tmp:=0;
  tmpCount:=0;
  for t:=0 to Series1.Count-1 do
  begin
    { consider or not null points... }
    if TeeFunction1.IncludeNulls or (not Series1.IsNull(t)) then
    begin
      tmp:=tmp+Series1.YValues[t];
      Inc(tmpCount);
    end;
  end;

  LabelAverage.Caption:=FloatToStr(tmp)+' / '+
                        IntToStr(tmpCount)+' = '+
                        FloatToStr(tmp/tmpCount);
  Series2.CheckDataSource;
end;

procedure TAverageFunctionNulls.FormCreate(Sender: TObject);
begin
  inherited;

  { Add some points and one null point... }
  Series1.Clear;
  Series1.Add( 10 ,'One', clRed );
  Series1.Add( 20 ,'Two', clRed );
  Series1.AddNull('Three');
  Series1.Add( 40 ,'Four', clRed );
  Series1.Add( 50 ,'Five', clRed );

  Series1.Marks.Style:=smsValue;

  SetLabelAverage;
end;

procedure TAverageFunctionNulls.FormShow(Sender: TObject);
begin
  inherited;
  {$IFDEF CLX}
  Series1.CheckDataSource;
  {$ENDIF}
end;

initialization
  RegisterClass( TAverageFunctionNulls );
end.
