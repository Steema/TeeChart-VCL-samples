//---------------------------------------------------------------------------

#ifndef Bar_CylinderH
#define Bar_CylinderH
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
class TBarCylinderForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarCylinderForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarCylinderForm *BarCylinderForm;
//---------------------------------------------------------------------------
#endif
