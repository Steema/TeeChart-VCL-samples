//---------------------------------------------------------------------------

#ifndef RSI_FunctionH
#define RSI_FunctionH
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
#include <CandleCh.hpp>
#include <OHLChart.hpp>
#include <StatChar.hpp>
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TRSICalcForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLineSeries *Series2;
        TRSIFunction *TeeFunction1;
        TComboBox *ComboBox1;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1AllowScroll(TChartAxis *Sender, double &AMin,
          double &AMax, bool &AllowScroll);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRSICalcForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRSICalcForm *RSICalcForm;
//---------------------------------------------------------------------------
#endif
