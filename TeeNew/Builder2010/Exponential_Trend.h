//---------------------------------------------------------------------------

#ifndef Exponential_TrendH
#define Exponential_TrendH
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
#include "CurvFitt.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExponentialTrendForm : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TExpTrendFunction *TeeFunction1;
        TFastLineSeries *Series2;
        TLineSeries *Series3;
        TTrendFunction *TeeFunction2;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TExponentialTrendForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExponentialTrendForm *ExponentialTrendForm;
//---------------------------------------------------------------------------
#endif
