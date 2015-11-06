//---------------------------------------------------------------------------

#ifndef Candle_OpenCloseH
#define Candle_OpenCloseH
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
class TCandleOpenClose : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TRadioGroup *RadioGroup1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCandleOpenClose(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleOpenClose *CandleOpenClose;
//---------------------------------------------------------------------------
#endif
