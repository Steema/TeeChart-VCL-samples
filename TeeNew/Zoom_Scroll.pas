unit Zoom_Scroll;
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
  Base, TeEngine, Series, TeeProcs, Chart;

type
  TZoomScrollForm = class(TBaseForm)
    Button1: TButton;
    Button2: TButton;
    Series1: TLineSeries;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
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

procedure TZoomScrollForm.Button1Click(Sender: TObject);
begin
  Chart1.ZoomPercent(110);  { 110 % = zoom in 10% }
end;

procedure TZoomScrollForm.Button2Click(Sender: TObject);
begin
  Chart1.BottomAxis.Scroll(2,False);
end;

procedure TZoomScrollForm.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(50);
end;

initialization
  RegisterClass(TZoomScrollForm);
end.
