//---------------------------------------------------------------------------

#ifndef PrintPreview_NavigateH
#define PrintPreview_NavigateH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Print_Preview.h"
#include "TeePreviewPanel.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include "StatChar.hpp"
#include "TeeNavigator.hpp"
#include <Series.hpp>
#include "TeeEdiGene.hpp"
//---------------------------------------------------------------------------
class TPrintPreviewNavigate : public TPrintPreviewForm
{
__published:	// IDE-managed Components
        TChartPageNavigator *ChartPageNavigator1;
        THistogramSeries *Series1;
        void __fastcall Chart1PageChange(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPrintPreviewNavigate(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintPreviewNavigate *PrintPreviewNavigate;
//---------------------------------------------------------------------------
#endif
