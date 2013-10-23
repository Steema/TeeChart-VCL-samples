unit Contour_SmoothSegments;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows, Messages,
  {$ENDIF}
  SysUtils, Classes,
  {$IFDEF CLX}
  QGraphics, QControls, QForms, QDialogs, QStdCtrls, QExtCtrls, QComCtrls,
  Types,
  {$ELSE}
  Graphics, Controls, Forms, Dialogs, StdCtrls, ExtCtrls, ComCtrls,
  {$ENDIF}
  Base, TeEngine, TeeSurfa, TeeProcs, Chart, TeeTools, TeCanvas;

type
  TContourSmooth = class(TBaseForm)
    Series1: TContourSeries;
    CheckBox1: TCheckBox;
    CheckBox2: TCheckBox;
    Label1: TLabel;
    Edit1: TEdit;
    UpDown1: TUpDown;
    ChartTool1: TMarksTipTool;
    CheckBox3: TCheckBox;
    procedure CheckBox1Click(Sender: TObject);
    procedure CheckBox2Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Edit1Change(Sender: TObject);
    procedure ChartTool1GetText(Sender: TMarksTipTool; var Text: String);
    procedure CheckBox3Click(Sender: TObject);
    procedure Chart1AfterDraw(Sender: TObject);
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

procedure TContourSmooth.CheckBox1Click(Sender: TObject);
begin
  Series1.Smoothing.Active:=CheckBox1.Checked;

  CheckBox2.Enabled:=CheckBox1.Checked;
  UpDown1.Enabled:=CheckBox1.Checked;
  Edit1.Enabled:=CheckBox1.Checked;
end;

procedure TContourSmooth.CheckBox2Click(Sender: TObject);
begin
  Series1.Smoothing.Interpolate:=CheckBox2.Checked;
end;

procedure TContourSmooth.FormCreate(Sender: TObject);
begin
  inherited;
  Series1.FillSampleValues(6);
end;

procedure TContourSmooth.Edit1Change(Sender: TObject);
begin
  Series1.Smoothing.Factor:=UpDown1.Position;
  Series1.Repaint;
end;

procedure TContourSmooth.ChartTool1GetText(Sender: TMarksTipTool;
  var Text: String);
var tmpLevel   : Integer;
    tmpSegment : Integer;
    tmpPoint   : Integer;
begin
  // Find level and segment under mouse cursor...
  with Chart1.GetCursorPos do
       tmpLevel:=Series1.Levels.Clicked(x,y,tmpSegment,tmpPoint);


  // If mouse is over a segment line...
  if tmpLevel<>-1 then
  begin
    Text:='Level: '+IntToStr(tmpLevel)+#13+
          'Segment: '+IntToStr(tmpSegment)+#13+
          'Point: '+IntToStr(tmpPoint);
  end
  else Text:='?';
end;

procedure TContourSmooth.CheckBox3Click(Sender: TObject);
begin
  Chart1.Invalidate;
end;

procedure TContourSmooth.Chart1AfterDraw(Sender: TObject);
var tmpLevel   : Integer;
    tmpSegment : Integer;
    P          : TPoint;
    tmp        : Integer;
begin
  if CheckBox3.Checked then
  begin
    // Draw small points at contour level segment lines...
    Chart1.Canvas.Brush.Color:=clBlack;
    Chart1.Canvas.Pen.Color:=clGreen;

    with Series1.Levels do
    for tmpLevel:=0 to Count-1 do  // for each level..
        with Items[tmpLevel] do
        for tmpSegment:=0 to SegmentCount-1 do  // for each segment in level...
        with Segments[tmpSegment] do
        begin
          for tmp:=0 to Length(Points)-1 do // for each point in segment...
          begin
            // Convert to screen coordinates...
            P.X:=Series1.GetHorizAxis.CalcXPosValue(Points[tmp].X);
            P.Y:=Series1.GetVertAxis.CalcYPosValue(Points[tmp].Y);

            // Draw point...
            Chart1.Canvas.Rectangle(P.X-2,P.Y-2,P.X+2,P.Y+2);
          end;
        end;
  end;
end;

initialization
  RegisterClass(TContourSmooth);
end.
