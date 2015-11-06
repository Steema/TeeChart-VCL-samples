//---------------------------------------------------------------------------

#ifndef Axis_BehindH
#define Axis_BehindH
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
class TAxisBehind : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TBarSeries *Series1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisBehind(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisBehind *AxisBehind;
//---------------------------------------------------------------------------
#endif
