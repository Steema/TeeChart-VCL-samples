//---------------------------------------------------------------------------

#ifndef Function_StdDeviationH
#define Function_StdDeviationH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TStdDeviationForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TStdDeviationFunction *TeeFunction1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TStdDeviationForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStdDeviationForm *StdDeviationForm;
//---------------------------------------------------------------------------
#endif
