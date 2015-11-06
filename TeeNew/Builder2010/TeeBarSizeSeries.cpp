//---------------------------------------------------------------------------


#pragma hdrstop

#include "TeeBarSizeSeries.h"

//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------
__fastcall TBarSizeSeries::TBarSizeSeries(TComponent* Owner)
        : TBarSeries(Owner)
{
  TBarSeries::TBarSeries(Owner); // inherited
  // Create storage for each Bar "size" value.
  FSizeValues = new TChartValueList(this,"Size");
  // NOTE: No need to override Destructor to free the above variable.
  // It will be automatically destroyed by Self (the Series).
}
//---------------------------------------------------------------------------
void _fastcall TBarSizeSeries::InternalCalcBarSize(int ValueIndex)
{
  if (SizeValues->Items[ValueIndex]==0) IBarSize = ISize;
  else IBarSize = GetHorizAxis->CalcSizeValue(SizeValues->Items[ValueIndex]);
}
//---------------------------------------------------------------------------
void __fastcall TBarSizeSeries::SetSizeValues(TChartValueList *Value)
{
  FSizeValues->Assign(Value);
}
//---------------------------------------------------------------------------
void _fastcall TBarSizeSeries::DrawValue(int ValueIndex)
{
  if (ValueIndex==FirstValueIndex) ISize = IBarSize;

  InternalCalcBarSize(ValueIndex);

  // Call default Bar drawing method.
  TBarSeries::DrawValue(ValueIndex);
}
//---------------------------------------------------------------------------
bool __fastcall TBarSizeSeries::InternalClicked(int ValueIndex, const TPoint &APoint)
{
  InternalCalcBarSize(ValueIndex);
  return TBarSeries::InternalClicked(ValueIndex,APoint);
}
//---------------------------------------------------------------------------

