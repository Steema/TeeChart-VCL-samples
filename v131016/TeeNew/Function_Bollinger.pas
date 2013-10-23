unit Function_Bollinger;
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
  Base, TeCanvas, TeePenDlg, TeEngine, StatChar,
  Series, OHLChart, CandleCh, TeeProcs, Chart;

type
  TBollingerForm = class(TBaseForm)
    Series1: TCandleSeries;
    TeeFunction1: TBollingerFunction;
    ButtonPen1: TButtonPen;
    Edit1: TEdit;
    Label1: TLabel;
    UpDown1: TUpDown;
    Label2: TLabel;
    Edit2: TEdit;
    UpDown2: TUpDown;
    CheckBox1: TCheckBox;
    Series2: TFastLineSeries;
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ButtonPen1Click(Sender: TObject);
    procedure Edit2Change(Sender: TObject);
    procedure CheckBox1Click(Sender: TObject);
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

procedure TBollingerForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(400);

  ButtonPen1.LinkPen(Series2.Pen);
end;

procedure TBollingerForm.Edit1Change(Sender: TObject);
begin
  TeeFunction1.Period:=UpDown1.Position;
end;

procedure TBollingerForm.ButtonPen1Click(Sender: TObject);
begin
  TeeFunction1.LowBand.Pen.Assign(Series2.Pen);
end;

procedure TBollingerForm.Edit2Change(Sender: TObject);
begin
  TeeFunction1.Deviation:=UpDown2.Position;
end;

procedure TBollingerForm.CheckBox1Click(Sender: TObject);
begin
  TeeFunction1.Exponential:=CheckBox1.Checked;
end;

initialization
  RegisterClass(TBollingerForm);
end.
