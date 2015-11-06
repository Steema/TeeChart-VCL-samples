//---------------------------------------------------------------------------

#ifndef Axis_ExponentH
#define Axis_ExponentH
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
class TAxisLabelExp : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisLabelExp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisLabelExp *AxisLabelExp;
//---------------------------------------------------------------------------
#endif
