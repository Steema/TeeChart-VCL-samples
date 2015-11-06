//---------------------------------------------------------------------------

#ifndef Legend_CheckBoxH
#define Legend_CheckBoxH
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
#include "ErrorBar.hpp"
#include "StatChar.hpp"
#include <BubbleCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendCheckbox : public TBaseForm
{
__published:	// IDE-managed Components
    TLineSeries *Series1;
    TBarSeries *Series2;
    TAreaSeries *Series3;
    TPointSeries *Series4;
    TFastLineSeries *Series5;
    TBubbleSeries *Series6;
    TVolumeSeries *Series7;
    THistogramSeries *Series8;
    TErrorBarSeries *Series9;
    THighLowSeries *Series10;
    TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendCheckbox(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendCheckbox *LegendCheckbox;
//---------------------------------------------------------------------------
#endif
