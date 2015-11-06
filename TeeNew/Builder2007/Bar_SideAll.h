//---------------------------------------------------------------------------

#ifndef Bar_SideAllH
#define Bar_SideAllH
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
//---------------------------------------------------------------------------
class TBarSideAll : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TLabel *Label1;
        TRadioGroup *RadioGroup1;
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarSideAll(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarSideAll *BarSideAll;
//---------------------------------------------------------------------------
#endif
