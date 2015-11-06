unit SeriesType_HighLowLine;
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
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, ComCtrls, Buttons,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart, ErrorBar, TeeHighLowLine,
  TeCanvas, TeePenDlg;

type
  TSeriesTypeHighLowLine = class(TBaseForm)
    Series1: THighLowLineSeries;
    Button1: TButton;
    ButtonPen1: TButtonPen;
    procedure FormCreate(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFNDEF CLX}
{$R *.dfm}
{$ELSE}
{$R *.xfm}
{$ENDIF}

Uses
  EditChar;

procedure TSeriesTypeHighLowLine.FormCreate(Sender: TObject);
begin
  inherited;

  Series1.Cursor:=crHandPoint;

  ButtonPen1.LinkPen(Series1.Pen);
end;

procedure TSeriesTypeHighLowLine.Button1Click(Sender: TObject);
begin
  EditSeries(Self, Series1);
end;

initialization
  RegisterClass(TSeriesTypeHighLowLine);
end.
