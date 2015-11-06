//---------------------------------------------------------------------------

#ifndef Function_AverageNullsH
#define Function_AverageNullsH
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
class TAverageFunctionNulls : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TBarSeries *Series1;
        TLineSeries *Series2;
        TAverageTeeFunction *TeeFunction1;
        TLabel *Label1;
        TLabel *LabelAverage;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        void __fastcall SetLabelAverage();
public:		// User declarations
        __fastcall TAverageFunctionNulls(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAverageFunctionNulls *AverageFunctionNulls;
//---------------------------------------------------------------------------
#endif
