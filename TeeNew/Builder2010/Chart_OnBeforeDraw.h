//---------------------------------------------------------------------------

#ifndef Chart_OnBeforeDrawH
#define Chart_OnBeforeDrawH
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
class TChartBeforeDraw : public TBaseForm
{
__published:	// IDE-managed Components
        TRadioGroup *RadioGroup1;
        TBarSeries *Series1;
        void __fastcall Chart1BeforeDrawChart(TObject *Sender);
        void __fastcall Chart1BeforeDrawAxes(TObject *Sender);
        void __fastcall Chart1BeforeDrawSeries(TObject *Sender);
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        void __fastcall DrawTheCircle();
        __fastcall TChartBeforeDraw(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartBeforeDraw *ChartBeforeDraw;
//---------------------------------------------------------------------------
#endif
