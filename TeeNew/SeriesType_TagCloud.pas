unit SeriesType_TagCloud;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QComCtrls, QExtCtrls,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ComCtrls, ExtCtrls,
  {$ENDIF}
  Base, TeEngine, TeeTools, TeeSurfa, TeeTagCloud, TeeProcs, Chart,
  TeeEdiFont, TeCanvas;

type
  TSeriesTagCloud = class(TBaseForm)
    Series1: TTagCloudSeries;
    Button1: TButton;
    Label1: TLabel;
    TrackBar1: TTrackBar;
    Label2: TLabel;
    Edit1: TEdit;
    ComboFlat1: TComboFlat;
    procedure Button1Click(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ComboFlat1Change(Sender: TObject);
    procedure TrackBar1Change(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Series1Click(Sender: TChartSeries; ValueIndex: Integer;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure Chart1AfterDraw(Sender: TObject);
  private
    { Private declarations }
    SelectedTag : Integer;
    procedure UnderLineSelectedTag;
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

procedure TSeriesTagCloud.Button1Click(Sender: TObject);
begin
  EditTeeFontEx(Self,Series1.Font);
end;

procedure TSeriesTagCloud.Edit1Change(Sender: TObject);
begin
  Series1.Filter:=Edit1.Text;
end;

procedure TSeriesTagCloud.ComboFlat1Change(Sender: TObject);
begin
  if ComboFlat1.ItemIndex=0 then
     Series1.Sort(toText, loAscending)
  else
     Series1.Sort(toValue, loDescending);
end;

procedure TSeriesTagCloud.TrackBar1Change(Sender: TObject);
begin
  Series1.Font.Size:=TrackBar1.Position;
end;

procedure TSeriesTagCloud.FormCreate(Sender: TObject);
begin
  inherited;

  TrackBar1.Position:=Series1.Font.Size;

  SelectedTag:=-1;

  // Some sample values
  Series1.FillSampleValues;

  // Add more tags:
  Series1.AddTag('Hello',100);
  Series1.AddTag('World',200);
end;

procedure TSeriesTagCloud.Series1Click(Sender: TChartSeries;
  ValueIndex: Integer; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  ShowMessage('Clicked Tag: '+Series1.XLabel[ValueIndex]+
    ' Value: '+FormatFloat(Series1.ValueFormat,Series1.YValues[ValueIndex]));
end;

procedure TSeriesTagCloud.UnderLineSelectedTag;
var R : TRect;
begin
  if SelectedTag<>-1 then
  begin
    with Chart1.Canvas.Pen do
    begin
      Color:=Series1.ValueColor[SelectedTag];
      Width:=2;
      Style:=psSolid;
    end;

    R:=Series1.Positions[SelectedTag];

    Chart1.Canvas.DoHorizLine(R.Left,R.Right,R.Bottom);
  end;
end;

procedure TSeriesTagCloud.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var tmp : Integer;
begin
  inherited;

  tmp:=Series1.Clicked(x,y);

  if tmp<>SelectedTag then
  begin
    SelectedTag:=tmp;
    Chart1.Invalidate;
  end;
end;

procedure TSeriesTagCloud.Chart1AfterDraw(Sender: TObject);
begin
  inherited;
  UnderLineSelectedTag;
end;

initialization
  RegisterClass(TSeriesTagCloud);
end.
