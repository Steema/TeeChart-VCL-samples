//---------------------------------------------------------------------------

#ifndef ComboFlat_DemoH
#define ComboFlat_DemoH
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
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TComboFlatForm : public TBaseForm
{
__published:	// IDE-managed Components
        TComboFlat *ComboFlat1;
        TLabel *Label1;
        TBarSeries *Series1;
        void __fastcall ComboFlat1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TComboFlatForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TComboFlatForm *ComboFlatForm;
//---------------------------------------------------------------------------
#endif
