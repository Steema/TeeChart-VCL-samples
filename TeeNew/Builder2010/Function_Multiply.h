//---------------------------------------------------------------------------

#ifndef Function_MultiplyH
#define Function_MultiplyH
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
#include <TeeFunci.hpp>
//---------------------------------------------------------------------------
class TMultiplyForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TMultiplyTeeFunction *TeeFunction1;
        TBarSeries *Series3;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMultiplyForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMultiplyForm *MultiplyForm;
//---------------------------------------------------------------------------
#endif
