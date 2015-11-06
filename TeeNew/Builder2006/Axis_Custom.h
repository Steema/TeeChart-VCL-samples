//---------------------------------------------------------------------------

#ifndef Axis_CustomH
#define Axis_CustomH
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
class TAxisCustom : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TLineSeries *Series3;
        TCheckBox *CheckBox1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisCustom(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisCustom *AxisCustom;
//---------------------------------------------------------------------------
#endif
