unit SeriesType_Ternary;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeeTools, TeeSurfa, TeeTernary;

type
  TTernarySeriesForm = class(TBaseForm)
    Button1: TButton;
    Series1: TTernarySeries;
    ChartTool1: TMarksTipTool;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Chart1BeforeDrawAxes(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  TernarySeriesForm: TTernarySeriesForm;

implementation

{$IFNDEF CLX}
{$R *.DFM}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses EditChar, TeeConst;

procedure TTernarySeriesForm.Button1Click(Sender: TObject);
begin
  EditSeries(Self,Series1);
end;

procedure TTernarySeriesForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(10);
  Series1.UseColorRange:=false;

  Series1.Pointer.Style:=psCircle;
  Series1.Pointer.Transparency:=20;

  Series1.TernaryStyle:=tsBubble;
  Series1.TernaryLegendStyle:=tlsBubbleWeight;

  Chart1.Legend.Title.Text.Add(TeeMsg_TernaryMarkRadius + ', ' + TeeMsg_TernaryMarkWeight);
  Chart1.Legend.Title.Visible:=true;
end;

procedure TTernarySeriesForm.Chart1BeforeDrawAxes(Sender: TObject);
begin
  Chart1.Legend.Title.Visible := Series1.ColorEachPoint;
end;

initialization
  RegisterClass(TTernarySeriesForm);
end.
