//---------------------------------------------------------------------------

#ifndef Font_GradientH
#define Font_GradientH
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
class TFontGradient : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFontGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFontGradient *FontGradient;
//---------------------------------------------------------------------------
#endif
