//---------------------------------------------------------------------------

#ifndef Chart_PageNavigatorH
#define Chart_PageNavigatorH
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
class TPageNavigatorForm : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TChartPageNavigator *ChartPageNavigator1;
        TLabel *Label1;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1PageChange(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPageNavigatorForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPageNavigatorForm *PageNavigatorForm;
//---------------------------------------------------------------------------
#endif
