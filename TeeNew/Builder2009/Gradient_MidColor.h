//---------------------------------------------------------------------------

#ifndef Gradient_MidColorH
#define Gradient_MidColorH
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
//---------------------------------------------------------------------------
class TGradientMiddle : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TShape *Shape1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Shape1MouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGradientMiddle(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGradientMiddle *GradientMiddle;
//---------------------------------------------------------------------------
#endif
