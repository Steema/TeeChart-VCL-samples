//---------------------------------------------------------------------------

#ifndef Function_SubtractH
#define Function_SubtractH
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
class TSubtractForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TBarSeries *Series3;
        TSubtractTeeFunction *TeeFunction1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSubtractForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSubtractForm *SubtractForm;
//---------------------------------------------------------------------------
#endif
