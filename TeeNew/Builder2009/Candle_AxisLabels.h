//---------------------------------------------------------------------------

#ifndef Candle_AxisLabelsH
#define Candle_AxisLabelsH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCandleAxisLabels : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1GetAxisLabel(TChartAxis *Sender,
          TChartSeries *Series, int ValueIndex, AnsiString &LabelText);
private:	// User declarations
public:		// User declarations
        __fastcall TCandleAxisLabels(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleAxisLabels *CandleAxisLabels;
//---------------------------------------------------------------------------
#endif
