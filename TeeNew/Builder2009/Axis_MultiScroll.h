//---------------------------------------------------------------------------

#ifndef Axis_MultiScrollH
#define Axis_MultiScrollH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <math.hpp>
#include "Base.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMultiAxisScroll : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TFastLineSeries *Series2;
        TCandleSeries *Series3;
        TVolumeSeries *Series4;
        TLabel *Label1;
        TCheckBox *CheckBoxRed;
        TCheckBox *CheckBoxBlue;
        TCheckBox *CheckBoxGreen;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1Scroll(TObject *Sender);
private:	// User declarations
public:		// User declarations
        TChartAxis *Green;
        TChartAxis *Blue;
        __fastcall TMultiAxisScroll(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMultiAxisScroll *MultiAxisScroll;
//---------------------------------------------------------------------------
#endif
