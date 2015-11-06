//---------------------------------------------------------------------------

#ifndef Canvas_GrayScaleH
#define Canvas_GrayScaleH
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
class TGrayScaleForm : public TBaseForm
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGrayScaleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGrayScaleForm *GrayScaleForm;
//---------------------------------------------------------------------------
#endif
