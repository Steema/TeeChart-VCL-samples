//---------------------------------------------------------------------------

#ifndef Legend_CurrentPageH
#define Legend_CurrentPageH
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
#include "TeeNavigator.hpp"
#include <Series.hpp>
#include "TeeEdiGene.hpp"
//---------------------------------------------------------------------------
class TLegendCurrentPage : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TChartPageNavigator *ChartPageNavigator1;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendCurrentPage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendCurrentPage *LegendCurrentPage;
//---------------------------------------------------------------------------
#endif
