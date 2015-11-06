unit TeeAxisScroll;
{$I TeeDefs.inc}

interface

uses
  {$IFNDEF LINUX}
  Windows,
  {$ENDIF}
  {$IFDEF D6}
  Types, 
  {$ENDIF}
  Classes, TeeTools, TeEngine;

const
  TeeMsg_AxisScrollBar='Axis Scrollbar';

type
  TAxisScrollBarDemo=class(TTeeScrollBar)
  private
    FAxis : TChartAxis;
    procedure SetAxis(const Value: TChartAxis);
  protected
    function CurrentCount:Integer; override;
    function DeltaMain: Integer; override;
    function GetPosition:Integer; override;
    procedure SetParentChart(const Value: TCustomAxisPanel); override;
    procedure SetPosition(Value:Integer); override;
    function ShouldDraw(var R:TRect):Boolean; override;
    function TotalCount:Integer; override;
  public
    CustomCount : Integer;
    CustomTotal : Integer;

    class Function Description:String; override;
  published
    property Axis:TChartAxis read FAxis write SetAxis;
  end;

implementation

uses TeeProcs;

{ TAxisScrollBarDemo }

function TAxisScrollBarDemo.CurrentCount: Integer;
begin
  result:=CustomCount;
end;

function TAxisScrollBarDemo.DeltaMain: Integer;
begin
  result:=inherited DeltaMain;
end;

class function TAxisScrollBarDemo.Description: String;
begin
  result:=TeeMsg_AxisScrollbar;
end;

function TAxisScrollBarDemo.GetPosition: Integer;
begin
  result:=Round(FAxis.Minimum);
end;

procedure TAxisScrollBarDemo.SetAxis(const Value: TChartAxis);
begin
  if FAxis<>Value then
  begin
    FAxis:=Value;
    Repaint;

    if Assigned(ParentChart) then
       Horizontal:=ParentChart.Width>ParentChart.Height
    else
    if Assigned(FAxis) and Assigned(FAxis.ParentChart) then
       Horizontal:=FAxis.ParentChart.Width>FAxis.ParentChart.Height
  end;
end;

procedure TAxisScrollBarDemo.SetParentChart(const Value: TCustomAxisPanel);
begin
  inherited;
end;

procedure TAxisScrollBarDemo.SetPosition(Value: Integer);
var Range : Double;
begin
  Range:=FAxis.Maximum-FAxis.Minimum;
  FAxis.SetMinMax(Value,Value+Range);
  inherited;
end;

function TAxisScrollBarDemo.ShouldDraw(var R: TRect): Boolean;
begin
  R:=ParentChart.ClientRect;
  Size:=R.Bottom-R.Top-2*ParentChart.BevelWidth;
  R.Bottom:=R.Top+1;
  result:=True;
end;

function TAxisScrollBarDemo.TotalCount: Integer;
begin
  result:=CustomTotal;
end;

end.
