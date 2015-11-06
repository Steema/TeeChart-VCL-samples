unit Function_ExpMovAve;
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
  Base, TeCanvas, TeEngine, StatChar, Series, OHLChart, CandleCh, TeeProcs, Chart;

type
  TExpMovAveForm = class(TBaseForm)
    Series1: TCandleSeries;
    Series2: TLineSeries;
    TeeFunction1: TExpMovAveFunction;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Label2: TLabel;
    ComboBox1: TComboBox;
    CheckBox1: TCheckBox;
    Timer1: TTimer;
    procedure Edit1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    Delta : Integer;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TExpMovAveForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
end;

procedure TExpMovAveForm.FormCreate(Sender: TObject);
begin
  inherited;
  Delta:=1;
  Series2.YValues.ValueSource:='Close';
  Series1.FillSampleValues(20);
end;

procedure TExpMovAveForm.ComboBox1Change(Sender: TObject);
begin
  Series2.YValues.ValueSource:=ComboBox1.Items[ComboBox1.ItemIndex];
end;

procedure TExpMovAveForm.CheckBox1Click(Sender: TObject);
begin
  Timer1.Enabled:=CheckBox1.Checked;
end;

procedure TExpMovAveForm.Timer1Timer(Sender: TObject);
begin
  With UpDown1 do
  begin
    Position:=Position+Delta;
    if (Position>19) or (Position<2) then Delta:=-Delta;
  end;
end;

procedure TExpMovAveForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=3;
end;

initialization
  RegisterClass(TExpMovAveForm);
end.
