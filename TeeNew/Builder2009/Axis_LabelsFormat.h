//---------------------------------------------------------------------------

#ifndef Axis_LabelsFormatH
#define Axis_LabelsFormatH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAxisLabelsFormat : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
  void __fastcall Chart1GetAxisLabel(TChartAxis *Sender,
          TChartSeries *Series, int ValueIndex, AnsiString &LabelText);
private:	// User declarations
public:		// User declarations
  __fastcall TAxisLabelsFormat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisLabelsFormat *AxisLabelsFormat;
//---------------------------------------------------------------------------
#endif
