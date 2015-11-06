//---------------------------------------------------------------------------

#ifndef FastLine_DrawAllH
#define FastLine_DrawAllH
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
class TFastLineDrawAll : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
    TLabel *Label1;
    TRadioButton *RadioButton1;
    TRadioButton *RadioButton2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall RadioButton1Click(TObject *Sender);
        void __fastcall RadioButton2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFastLineDrawAll(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFastLineDrawAll *FastLineDrawAll;
//---------------------------------------------------------------------------
#endif
