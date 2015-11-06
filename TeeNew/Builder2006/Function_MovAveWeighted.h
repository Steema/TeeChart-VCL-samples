//---------------------------------------------------------------------------

#ifndef Function_MovAveWeightedH
#define Function_MovAveWeightedH
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
class TMovAveWeightedForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TFastLineSeries *Series1;
        TFastLineSeries *Series2;
        TMovingAverageFunction *MovingAverageFunction1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMovAveWeightedForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMovAveWeightedForm *MovAveWeightedForm;
//---------------------------------------------------------------------------
#endif
