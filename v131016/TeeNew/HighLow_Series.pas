unit HighLow_Series;
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
  Base, TeCanvas, TeEngine, ErrorBar, TeeProcs, Chart, TeePenDlg;

type
  THighLowForm = class(TBaseForm)
    Series1: THighLowSeries;
    ButtonPen1: TButtonPen;
    ButtonPen2: TButtonPen;
    ButtonPen3: TButtonPen;
    Button1: TButton;
    Button2: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
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

Uses TeeBrushDlg;

procedure THighLowForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(20);
  ButtonPen1.LinkPen(Series1.HighPen);
  ButtonPen2.LinkPen(Series1.LowPen);
  ButtonPen3.LinkPen(Series1.Pen);
end;

procedure THighLowForm.Button1Click(Sender: TObject);
begin
  EditChartBrush(Self,Series1.HighBrush);
end;

procedure THighLowForm.Button2Click(Sender: TObject);
begin
  EditChartBrush(Self,Series1.LowBrush);
end;

initialization
  RegisterClass(THighLowForm);
end.
