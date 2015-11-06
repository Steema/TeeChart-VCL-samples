//---------------------------------------------------------------------------
#ifndef TeeBarSizeSeriesH
#define TeeBarSizeSeriesH

#include <Windows.hpp>
#include <Classes.hpp>
#include <Graphics.hpp>
#include <TeEngine.hpp>
#include <Series.hpp>

class TBarSizeSeries : public Series::TBarSeries
{
private:
  TChartValueList *FSizeValues;
  int ISize;
  void _fastcall InternalCalcBarSize(int ValueIndex);
  void __fastcall SetSizeValues(TChartValueList *Value);
protected:
  virtual bool __fastcall InternalClicked(int ValueIndex, const TPoint &APoint);
public:
  virtual void _fastcall DrawValue(int ValueIndex);
  __fastcall virtual TBarSizeSeries(TComponent* Owner);
__published:
  __property TChartValueList *SizeValues = {read= FSizeValues, write = SetSizeValues};
};

//---------------------------------------------------------------------------
#endif
