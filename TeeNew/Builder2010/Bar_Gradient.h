//---------------------------------------------------------------------------

#ifndef Bar_GradientH
#define Bar_GradientH
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
class TBarGradient : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarGradient *BarGradient;
//---------------------------------------------------------------------------
#endif
