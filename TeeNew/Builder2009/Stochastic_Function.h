//---------------------------------------------------------------------------

#ifndef Stochastic_FunctionH
#define Stochastic_FunctionH
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
class TStochasticForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLineSeries *Series2;
        TStochasticFunction *TeeFunction1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TColorLineTool *ChartTool1;
        TColorBandTool *ChartTool2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TStochasticForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TStochasticForm *StochasticForm;
//---------------------------------------------------------------------------
#endif
