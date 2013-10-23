unit Title_ClickEvent;
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
  {$IFDEF CLR}
  Types,
  {$ENDIF}
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TTitleClickEvent = class(TBaseForm)
    Series1: TPieSeries;
    procedure FormCreate(Sender: TObject);
    procedure Chart1ClickTitle(Sender: TCustomChart; ATitle: TChartTitle;
      Button: TMouseButton; Shift: TShiftState; X, Y: Integer);
    procedure Chart1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
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

procedure TTitleClickEvent.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

procedure TTitleClickEvent.Chart1ClickTitle(Sender: TCustomChart;
  ATitle: TChartTitle; Button: TMouseButton; Shift: TShiftState; X,
  Y: Integer);
begin
  Panel1.Caption:=ATitle.Text.Text;
end;

procedure TTitleClickEvent.Chart1MouseMove(Sender: TObject;
  Shift: TShiftState; X, Y: Integer);
var P : TChartClickedPart;
begin
  Chart1.CalcClickedPart(Point(x,y),P);
  Case P.Part of
    cpTitle,cpFoot,
    cpSubTitle,cpSubFoot: Chart1.Cursor:=crHandPoint;
  else
    Chart1.Cursor:=crDefault;
  end;
  Chart1.OriginalCursor:=Chart1.Cursor;
end;

initialization
  RegisterClass(TTitleClickEvent);
end.
