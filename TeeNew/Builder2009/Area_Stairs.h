//---------------------------------------------------------------------------

#ifndef Area_StairsH
#define Area_StairsH
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
class TAreaStairsForm : public TBaseForm
{
__published:	// IDE-managed Components
        TAreaSeries *Series1;
        TAreaSeries *Series2;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAreaStairsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAreaStairsForm *AreaStairsForm;
//---------------------------------------------------------------------------
#endif
