//---------------------------------------------------------------------------

#ifndef Axis_MultiRuntimeH
#define Axis_MultiRuntimeH
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
class TAxisMultiRuntime : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TFastLineSeries *Series2;
        TFastLineSeries *Series3;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisMultiRuntime(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisMultiRuntime *AxisMultiRuntime;
//---------------------------------------------------------------------------
#endif
