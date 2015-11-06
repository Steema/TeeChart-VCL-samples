unit SeriesType_Bubble;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, QComCtrls,
  QButtons,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls,
  Buttons,
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, TeeTools, Series, BubbleCh;

type
  TBubbleSeriesForm = class(TBaseForm)
    ZoomInButton: TSpeedButton;
    ZoomOutButton: TSpeedButton;
    CheckBox3: TCheckBox;
    CheckBox2: TCheckBox;
    ComboBox1: TComboBox;
    Label1: TLabel;
    Series1: TBubbleSeries;
    procedure CheckBox2Click(Sender: TObject);
    procedure CheckBox3Click(Sender: TObject);
    function Series1GetPointerStyle(Sender: TChartSeries;
      ValueIndex: Integer): TSeriesPointerStyle;
    procedure ZoomInButtonClick(Sender: TObject);
    procedure ZoomOutButtonClick(Sender: TObject);
    procedure ComboBox1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormShow(Sender: TObject);
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

procedure TBubbleSeriesForm.CheckBox2Click(Sender: TObject);
begin
  Series1.Marks.Visible:=CheckBox2.Checked
end;

procedure TBubbleSeriesForm.CheckBox3Click(Sender: TObject);
begin
  Chart1.Repaint;
end;

function TBubbleSeriesForm.Series1GetPointerStyle(Sender: TChartSeries;
  ValueIndex: Integer): TSeriesPointerStyle;
begin
  if CheckBox3.Checked then
     result:=TSeriesPointerStyle(Random(Ord(High(TSeriesPointerStyle))))
  else
     result:=Series1.Pointer.Style;
end;

procedure TBubbleSeriesForm.ZoomInButtonClick(Sender: TObject);
begin
  Chart1.ZoomPercent(110);
end;

procedure TBubbleSeriesForm.ZoomOutButtonClick(Sender: TObject);
begin
  Chart1.ZoomPercent(90);
end;

procedure TBubbleSeriesForm.ComboBox1Change(Sender: TObject);
begin
  Series1.Pointer.Style:=TSeriesPointerStyle(ComboBox1.ItemIndex);
end;

procedure TBubbleSeriesForm.FormCreate(Sender: TObject);
var t: Integer;
begin
  inherited;
  Series1.Clear;
  for t:=1 to 100 do
      Series1.AddBubble( Date+t,                          { <-- x value }
                         Random(ChartSamplesMax),         { <-- y value }
                         ChartSamplesMax/(20+Random(25)), { <-- radius value }
                         '',                              { <-- label string }
                         GetDefaultColor(t));             { <-- color }
end;

procedure TBubbleSeriesForm.FormShow(Sender: TObject);
begin
  inherited;
  ComboBox1.ItemIndex:=Ord(psCircle); { <-- Circled Bubbles by default }
end;

initialization
  RegisterClass(TBubbleSeriesForm);
end.
