//---------------------------------------------------------------------------

#ifndef Candle_CustomColorsH
#define Candle_CustomColorsH
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
class TCandleCustomColors : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TCandleSeries *Series1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
        void __fastcall SetCustomColors();
public:		// User declarations
        __fastcall TCandleCustomColors(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleCustomColors *CandleCustomColors;
//---------------------------------------------------------------------------
#endif
