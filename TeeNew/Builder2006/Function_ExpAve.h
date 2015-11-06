//---------------------------------------------------------------------------

#ifndef Function_ExpAveH
#define Function_ExpAveH
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
#include "StatChar.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExpAveForm : public TBaseForm
{
__published:	// IDE-managed Components
        TExpAverageFunction *TeeFunction1;
        TLineSeries *Series2;
        TLineSeries *Series1;
        TLabel *Label1;
        TTrackBar *TrackBar1;
        TLabel *Label2;
        TCheckBox *CheckBox1;
        TTimer *Timer1;
        void __fastcall TrackBar1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
        int Delta;
public:		// User declarations
        __fastcall TExpAveForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExpAveForm *ExpAveForm;
//---------------------------------------------------------------------------
#endif
