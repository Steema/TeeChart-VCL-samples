//---------------------------------------------------------------------------

#ifndef Series_BigCandleH
#define Series_BigCandleH
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
#include "BigCandl.hpp"
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBigCandleForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TChart *Chart2;
        TBigCandleSeries *Series2;
        TLabel *Label1;
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBigCandleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBigCandleForm *BigCandleForm;
//---------------------------------------------------------------------------
#endif
