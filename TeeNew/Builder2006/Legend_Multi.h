//---------------------------------------------------------------------------

#ifndef Legend_MultiH
#define Legend_MultiH
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
class TMultiLegendForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TCheckBox *CheckBox1;
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMultiLegendForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMultiLegendForm *MultiLegendForm;
//---------------------------------------------------------------------------
#endif
