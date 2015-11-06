//---------------------------------------------------------------------------

#ifndef MACD_FunctionH
#define MACD_FunctionH
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
class TMACDForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLineSeries *Series2;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TMACDFunction *TeeFunction1;
        TLabel *Label2;
        TEdit *Edit2;
        TUpDown *UpDown2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMACDForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMACDForm *MACDForm;
//---------------------------------------------------------------------------
#endif
