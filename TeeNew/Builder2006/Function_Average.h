//---------------------------------------------------------------------------

#ifndef Function_AverageH
#define Function_AverageH
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
class TAverageForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLineSeries *Series2;
        TAverageTeeFunction *TeeFunction1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAverageForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAverageForm *AverageForm;
//---------------------------------------------------------------------------
#endif
