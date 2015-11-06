unit Bar_Rounded;
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
  Base, TeCanvas, TeEngine, Series, TeeProcs, Chart, TeeTools;

type
  TBar_RoundedForm = class(TBaseForm)
    Series1: TBarSeries;
    ChartTool1: TColorLineTool;
    Button1: TButton;
    cbRoundBars: TCheckBox;
    Label1: TLabel;
    cbBarRound: TComboBox;
    Label2: TLabel;
    EditRoundSize: TEdit;
    cbPen: TCheckBox;
    UpDown1: TUpDown;
    cbHorizontal: TCheckBox;
    procedure FormShow(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure cbRoundBarsClick(Sender: TObject);
    procedure cbBarRoundChange(Sender: TObject);
    procedure EditRoundSizeChange(Sender: TObject);
    procedure cbHorizontalClick(Sender: TObject);
    procedure cbPenClick(Sender: TObject);
    procedure CustomizeSeries();
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Bar_RoundedForm: TBar_RoundedForm;

implementation

uses Math, EditChar;

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}


procedure TBar_RoundedForm.CustomizeSeries();
begin
  cbBarRound.ItemIndex:=1;
  
  with Series1 do
  begin
    If cbRoundBars.Checked then
      Series1.BarStyle := bsRoundRectangle
    else
      Series1.BarStyle := bsRectangle;

    RoundSize := UpDown1.Position;
    BarRound := TBarRound(cbBarRound.ItemIndex);
    Pen.Visible := cbPen.Checked;
  end;
end;

procedure TBar_RoundedForm.FormShow(Sender: TObject);
begin
  inherited;
  CustomizeSeries();
end;

procedure TBar_RoundedForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TBar_RoundedForm.cbRoundBarsClick(Sender: TObject);
begin
  If cbRoundBars.Checked then
    Series1.BarStyle := bsRoundRectangle
  else
    Series1.BarStyle := bsRectangle;

  Label1.Enabled := cbRoundBars.Checked;
  cbBarRound.Enabled := cbRoundBars.Checked;
  Label2.Enabled := cbRoundBars.Checked;
  EditRoundSize.Enabled := cbRoundBars.Checked;
  UpDown1.Enabled := cbRoundBars.Checked;
end;

procedure TBar_RoundedForm.cbBarRoundChange(Sender: TObject);
begin
  Series1.BarRound := TBarRound(cbBarRound.ItemIndex);
end;

procedure TBar_RoundedForm.EditRoundSizeChange(Sender: TObject);
begin
  Series1.RoundSize := UpDown1.Position;
end;

procedure TBar_RoundedForm.cbHorizontalClick(Sender: TObject);
var ser : TChartSeries;
begin
  ser := Series1;
  if cbHorizontal.Checked then
  begin
    ChangeSeriesType(ser,THorizBarSeries);
    ChartTool1.Axis := Chart1.Axes.Bottom;
  end
  else begin
    ChangeSeriesType(ser,TBarSeries);
    ChartTool1.Axis := Chart1.Axes.Left;
  end;

  CustomizeSeries();
end;

procedure TBar_RoundedForm.cbPenClick(Sender: TObject);
begin
  CustomizeSeries();
end;

initialization
  RegisterClass(TBar_RoundedForm);
end.
