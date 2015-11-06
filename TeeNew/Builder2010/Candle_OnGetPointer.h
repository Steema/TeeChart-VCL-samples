//---------------------------------------------------------------------------

#ifndef Candle_OnGetPointerH
#define Candle_OnGetPointerH
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
class TCandleOnGetPointer : public TBaseForm
{
__published:	// IDE-managed Components
    TCandleSeries *Series1;
    TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        TSeriesPointerStyle __fastcall Series1GetPointerStyle(
          TChartSeries *Sender, int ValueIndex);
private:	// User declarations
public:		// User declarations
        __fastcall TCandleOnGetPointer(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleOnGetPointer *CandleOnGetPointer;
//---------------------------------------------------------------------------
#endif
