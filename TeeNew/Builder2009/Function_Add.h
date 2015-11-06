//---------------------------------------------------------------------------

#ifndef Function_AddH
#define Function_AddH
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
class TFunctionAddForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TCheckBox *CheckBox1;
        TAddTeeFunction *TeeFunction1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFunctionAddForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFunctionAddForm *FunctionAddForm;
//---------------------------------------------------------------------------
#endif
