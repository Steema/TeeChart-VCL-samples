unit TeeBarSizeSeries;
{$I TeeDefs.inc}

interface

uses {$IFNDEF LINUX}
     Windows,
     {$ENDIF}
     Classes,
     {$IFDEF CLX}
     QGraphics, Types,
     {$ELSE}
     Graphics,
     {$ENDIF}
     TeEngine, Series;


// EXAMPLE:
// Implementing a new Bar series that can display individual bar points
// with different sizes (different widths).

// The example form (Series_BarSize.pas unit) also shows how to position
// each bar at a custom "X".


type
  TBarSizeSeries=class(TBarSeries)
  private
    FSizeValues : TChartValueList;
    ISize       : Integer;
    procedure InternalCalcBarSize(ValueIndex:Integer);
    procedure SetSizeValues(const Value: TChartValueList);
  protected
    procedure DrawValue(ValueIndex:Integer); override;
    Function InternalClicked(ValueIndex:Integer; P:TPoint):Boolean; override;
  public
    Constructor Create(AOwner:TComponent); override;
  published
    property SizeValues:TChartValueList read FSizeValues write SetSizeValues;
  end;

implementation

{ TBarSizeSeries }

Constructor TBarSizeSeries.Create(AOwner: TComponent);
begin
  inherited;
  // Create storage for each Bar "size" value.
  FSizeValues:=TChartValueList.Create(Self,'Size');

  // No need to override Destructor to free the above variable.
  // It will be automatically destroyed by Self (the Series).
end;

procedure TBarSizeSeries.DrawValue(ValueIndex: Integer);
begin
  if ValueIndex=FirstValueIndex then ISize:=IBarSize;

  InternalCalcBarSize(ValueIndex);

  // Call default Bar drawing method.
  inherited;
end;

Function TBarSizeSeries.InternalClicked(ValueIndex:Integer; P:TPoint):Boolean;
begin
  InternalCalcBarSize(ValueIndex);
  result:=inherited InternalClicked(ValueIndex,P);
end;

procedure TBarSizeSeries.InternalCalcBarSize(ValueIndex:Integer);
begin
  if SizeValues[ValueIndex]=0 then
     IBarSize:=ISize
  else
     IBarSize:=GetHorizAxis.CalcSizeValue(SizeValues[ValueIndex]);
end;

procedure TBarSizeSeries.SetSizeValues(const Value: TChartValueList);
begin
  SetChartValueList(FSizeValues,Value);
end;

end.
