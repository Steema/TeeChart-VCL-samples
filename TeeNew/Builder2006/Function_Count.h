//---------------------------------------------------------------------------

#ifndef Function_CountH
#define Function_CountH
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
#include "TeeCount.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCountForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TCountTeeFunction *TeeFunction1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCountForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCountForm *CountForm;
//---------------------------------------------------------------------------
#endif
