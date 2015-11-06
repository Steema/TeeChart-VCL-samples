//---------------------------------------------------------------------------

#ifndef Function_RSIH
#define Function_RSIH
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
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TRSIFunctionForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TCandleSeries *Series1;
        TChart *Chart2;
        TLineSeries *Series2;
        TRSIFunction *TeeFunction1;
        TColorLineTool *ChartTool1;
        TColorLineTool *ChartTool2;
        TComboBox *ComboBox1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRSIFunctionForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRSIFunctionForm *RSIFunctionForm;
//---------------------------------------------------------------------------
#endif
