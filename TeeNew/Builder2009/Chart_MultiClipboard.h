//---------------------------------------------------------------------------

#ifndef Chart_MultiClipboardH
#define Chart_MultiClipboardH
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
class TChartMultiClipboard : public TBaseForm
{
__published:	// IDE-managed Components
        TChart *Chart2;
        TChart *Chart3;
        TLineSeries *Series1;
        TBarSeries *Series2;
        TAreaSeries *Series3;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartMultiClipboard(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartMultiClipboard *ChartMultiClipboard;
//---------------------------------------------------------------------------
#endif
