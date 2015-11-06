unit Pie_Multi;
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
  Base, TeEngine, Series, TeeProcs, Chart, TeCanvas, TeeGDIPlus;

type
  TPieMultiple = class(TBaseForm)
    Series1: TPieSeries;
    Series2: TPieSeries;
    Series3: TPieSeries;
    Series4: TPieSeries;
    procedure FormCreate(Sender: TObject);
    procedure Series1BeforeDrawValues(Sender: TObject);
    procedure Series2BeforeDrawValues(Sender: TObject);
    procedure Series3BeforeDrawValues(Sender: TObject);
    procedure Series4BeforeDrawValues(Sender: TObject);
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

procedure TPieMultiple.FormCreate(Sender: TObject);
begin
  inherited;
  Chart1.SeriesList.FillSampleValues(4);

  Chart1.ApplyZOrder:=False;

  Series1.EdgeStyle := edCurved;
  Series2.EdgeStyle := edCurved;
  Series3.EdgeStyle := edCurved;
  Series4.EdgeStyle := edCurved;
end;

procedure TPieMultiple.Series1BeforeDrawValues(Sender: TObject);
begin
  Chart1.ChartRect:=Rect(10,10,Chart1.Width div 2, Chart1.Height div 2);
end;

procedure TPieMultiple.Series2BeforeDrawValues(Sender: TObject);
begin
  Chart1.ChartRect:=Rect(Chart1.Width div 2, 10, Chart1.Width, Chart1.Height div 2);
end;

procedure TPieMultiple.Series3BeforeDrawValues(Sender: TObject);
begin
  Chart1.ChartRect:=Rect(10,Chart1.Height div 2,Chart1.Width div 2, Chart1.Height);
end;

procedure TPieMultiple.Series4BeforeDrawValues(Sender: TObject);
begin
  Chart1.ChartRect:=Rect(Chart1.Width div 2, Chart1.Height div 2, Chart1.Width, Chart1.Height);
end;

initialization
  RegisterClass(TPieMultiple);
end.
