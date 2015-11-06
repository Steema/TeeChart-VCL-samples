//---------------------------------------------------------------------------

#ifndef Function_ExpMovAveH
#define Function_ExpMovAveH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include "StatChar.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExpMovAveForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLineSeries *Series2;
        TExpMovAveFunction *TeeFunction1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TLabel *Label2;
        TComboBox *ComboBox1;
        TCheckBox *CheckBox1;
        TTimer *Timer1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
        int Delta;
public:		// User declarations
        __fastcall TExpMovAveForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExpMovAveForm *ExpMovAveForm;
//---------------------------------------------------------------------------
#endif
