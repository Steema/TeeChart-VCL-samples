//---------------------------------------------------------------------------

#ifndef Function_RootMeanSqH
#define Function_RootMeanSqH
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
#include "StatChar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TRootMeanSqForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TRMSFunction *TeeFunction1;
        TLabel *Label1;
        TLabel *Label2;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
        void __fastcall DisplayCalc();
public:		// User declarations
        __fastcall TRootMeanSqForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRootMeanSqForm *RootMeanSqForm;
//---------------------------------------------------------------------------
#endif
