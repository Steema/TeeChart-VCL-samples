unit Function_CurveFitting;
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
  Base, TeCanvas, TeEngine, CurvFitt, Series, TeeProcs, Chart;

type
  TCurveFittingForm = class(TBaseForm)
    Data: TFastLineSeries;
    Curve1: TFastLineSeries;
    Curve2: TFastLineSeries;
    TeeFunction1: TCurveFittingFunction;
    TeeFunction2: TCurveFittingFunction;
    CheckBox1: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Edit2: TEdit;
    UpDown2: TUpDown;
    Label2: TLabel;
    Timer1: TTimer;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TCurveFittingForm.FormCreate(Sender: TObject);
begin
  inherited;
  Curve1.RecalcOptions:=[rOnInsert,rOnClear];
  Data.FillSampleValues(200); { <-- Some random points }
end;

procedure TCurveFittingForm.Edit1Change(Sender: TObject);
begin
  if UpDown1.Position>0 then
     TeeFunction1.PolyDegree:=UpDown1.Position;
end;

procedure TCurveFittingForm.Edit2Change(Sender: TObject);
begin
  if UpDown2.Position>0 then
     TeeFunction2.PolyDegree:=UpDown2.Position;
end;

procedure TCurveFittingForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TCurveFittingForm.Timer1Timer(Sender: TObject);
begin
  Timer1.Enabled:=False; { <-- stop timer }
  With Data do
  Begin
    Delete(0); { <-- remove the first point }

    { Add a new random point }
    AddXY( XValues.Last+1,
           YValues.Last+(Random(ChartSamplesMax)-(ChartSamplesMax/2)),
           '',clTeeColor);

    Curve1.CheckDataSource; { <-- fill again the points }
    Curve2.CheckDataSource; { <-- fill again the points }
  end;
  Timer1.Enabled:=True; { <-- restart timer }
end;

initialization
  RegisterClass(TCurveFittingForm);
end.
