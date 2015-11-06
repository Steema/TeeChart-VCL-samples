//---------------------------------------------------------------------------

#ifndef Function_CumulativeH
#define Function_CumulativeH
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
#include "TeeCumu.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCumulativeForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TCumulative *TeeFunction1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCumulativeForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCumulativeForm *CumulativeForm;
//---------------------------------------------------------------------------
#endif
