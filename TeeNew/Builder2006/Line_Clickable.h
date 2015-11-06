//---------------------------------------------------------------------------

#ifndef Line_ClickableH
#define Line_ClickableH
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
class TLineClickableForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TLineClickableForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLineClickableForm *LineClickableForm;
//---------------------------------------------------------------------------
#endif
