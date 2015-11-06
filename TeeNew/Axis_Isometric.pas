unit Axis_Isometric;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages, 
  {$ENDIF}
  SysUtils, Classes, 
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QExtCtrls, QStdCtrls, 
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, ExtCtrls, StdCtrls, 
  {$ENDIF}
  Base, TeeProcs, TeEngine, Chart, Series, TeCanvas;

type
  TIsometricAxis = class(TBaseForm)
    Series1: TFastLineSeries;
    Button1: TButton;
    procedure FormCreate(Sender: TObject);
    procedure Chart1Zoom(Sender: TObject);
    procedure Chart1UndoZoom(Sender: TObject);
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

implementation

{$IFDEF CLX}
{$R *.xfm}
{$ELSE}
{$R *.dfm}
{$ENDIF}

// Call this function with a Chart or DBChart component
// to adjust the axis scales isometrically:
//
// MakeISOAxis( Chart1 );

procedure MakeIsoAxis(Vertical, Horizontal: TChartAxis); overload;
var tmpX,
    tmpY,
    XRange,
    YRange,
    Offset,
    XYScreen : Double;
begin
  with Vertical.ParentChart do
  if (ChartHeight>0) and (ChartWidth>0) then
  begin
    With Horizontal do XRange:=Maximum-Minimum;

    tmpX:=(XRange/ChartWidth);

    {$IFDEF CLX}
    XYScreen:=1024.0/768.0;  //TODO
    {$ELSE}
    XYScreen:=1.0*(GetDeviceCaps(Canvas.Handle,HORZSIZE)/Screen.Width)/
                  (GetDeviceCaps(Canvas.Handle,VERTSIZE)/Screen.Height);
    {$ENDIF}

    With Vertical do YRange:=Maximum-Minimum;

    tmpY:=(YRange/ChartHeight)*XYScreen;

    if tmpX>tmpY then
    begin
      if tmpY<>0 then
      begin
        Offset:=((YRange*tmpX/tmpY)-YRange)/2.0;
        With Vertical do SetMinMax(Minimum-Offset,Maximum+Offset);
      end;
    end
    else
    if tmpX<tmpY then
    begin
      if tmpX<>0 then
      begin
        Offset:=((XRange*tmpY/tmpX)-XRange)/2.0;
        With Horizontal do SetMinMax(Minimum-Offset,Maximum+Offset);
      end;
    end;
  end;
end;

procedure MakeIsoAxis(Series: TChartSeries); overload;
begin
  MakeIsoAxis(Series.GetVertAxis, Series.GetHorizAxis);
end;

procedure MakeIsoAxis(Chart: TCustomChart); overload;
begin
  MakeIsoAxis(Chart.Axes.Left, Chart.Axes.Bottom);
end;

//-------------------------------------------------------

procedure TIsometricAxis.FormCreate(Sender: TObject);
var t : Integer;
begin
  inherited;

  with Chart1.Axes.Left do
  begin
    Grid.Style:=psSolid;
    Grid.Color:=clBlack;
    Increment:=50;
    LabelsSeparation:=0;
  end;

  with Chart1.Axes.Bottom do
  begin
    Grid.Style:=psSolid;
    Grid.Color:=clBlack;
    Increment:=50;
    LabelsSeparation:=0;
  end;

  Series1.Clear;
  for t:=1 to 100 do Series1.Add(Random(100));
end;

// After zooming, make isometric axis
procedure TIsometricAxis.Chart1Zoom(Sender: TObject);
begin
  inherited;
  MakeIsoAxis(Series1);
end;

// After un-zooming, make isometric axis
procedure TIsometricAxis.Chart1UndoZoom(Sender: TObject);
begin
  inherited;
  MakeIsoAxis(Series1);
end;

procedure TIsometricAxis.Button1Click(Sender: TObject);
begin
  MakeIsoAxis(Series1);
end;

initialization
  RegisterClass(TIsometricAxis);
end.
