unit Series_Funnel;
{$I TeeDefs.inc}
//Developed by Marjan Slatinek
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
  Base, TeCanvas, TeeProcs, TeEngine, Chart, TeeFunnel, TeeFunnelEditor;

type
  TFunnelSeriesForm = class(TBaseForm)
    Button1: TButton;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    Funnel: TFunnelSeries;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1ClickSeries(Sender: TCustomChart; Series: TChartSeries;
      ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
      Y: Integer);
    procedure Edit1Change(Sender: TObject);
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

Uses EditChar;

procedure TFunnelSeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self, Funnel);
end;

procedure TFunnelSeriesForm.FormCreate(Sender: TObject);
begin
  inherited;

  Funnel.Marks.Visible := True;
  Funnel.Marks.Clip := True;

  { add some points to Funnnel/Pipeline }
  Funnel.AddSegment(50,110,'1st',clTeeColor);
  Funnel.AddSegment(200,50,'2nd',clTeeColor);
  Funnel.AddSegment(100,50,'3rd',clTeeColor);
  Funnel.AddSegment(60,55,'4th',clTeeColor);

  Funnel.Recalc;
end;

procedure TFunnelSeriesForm.Chart1ClickSeries(Sender: TCustomChart;
  Series: TChartSeries; ValueIndex: Integer; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
var tmpStr : String;
begin
  if (Series = Funnel) and (Button = mbLeft) then
  begin
    tmpStr := 'Quote = '+FormatFloat('0.000',Funnel.QuoteValues.Value[ValueIndex]) + Chr(13);
    tmpStr := tmpStr + 'Opportunity =' +
              FormatFloat('0.000',Funnel.OpportunityValues.Value[ValueIndex]) +
              Chr(13);
    tmpStr := tmpStr +
              'Percentage = ' +
              FormatFloat('0.00%',Funnel.OpportunityValues.Value[ValueIndex]/Funnel.QuoteValues.Value[ValueIndex]*100);
    ShowMessage(tmpStr);
  end
  else Chart1.CancelMouse:=False; { <-- enable zoom and scroll if not }
end;

procedure TFunnelSeriesForm.Edit1Change(Sender: TObject);
begin
  inherited;
  Funnel.DifferenceLimit:=(UpDown1.Position);
end;

initialization
  RegisterClass(TFunnelSeriesForm);
end.
