//---------------------------------------------------------------------------

#ifndef Area_GradientH
#define Area_GradientH
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
class TAreaGradient : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
    TAreaSeries *Series1;
    TCheckBox *CheckBox1;
    TScrollBar *ScrollBar1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAreaGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAreaGradient *AreaGradient;
//---------------------------------------------------------------------------
#endif
