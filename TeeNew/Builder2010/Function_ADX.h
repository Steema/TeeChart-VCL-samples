//---------------------------------------------------------------------------

#ifndef Function_ADXH
#define Function_ADXH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TADXFunctionForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLineSeries *Series2;
        TADXFunction *TeeFunction1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TADXFunctionForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TADXFunctionForm *ADXFunctionForm;
//---------------------------------------------------------------------------
#endif
