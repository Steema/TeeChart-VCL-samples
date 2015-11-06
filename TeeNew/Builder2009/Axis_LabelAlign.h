//---------------------------------------------------------------------------

#ifndef Axis_LabelAlignH
#define Axis_LabelAlignH
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
class TAxisLabelAlignForm : public TBaseForm
{
__published:	// IDE-managed Components
        THorizBarSeries *Series1;
        TCheckBox *CheckBox1;
        TRadioGroup *RadioGroup1;
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisLabelAlignForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisLabelAlignForm *AxisLabelAlignForm;
//---------------------------------------------------------------------------
#endif
