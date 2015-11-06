//---------------------------------------------------------------------------

#ifndef Chart_ClipboardH
#define Chart_ClipboardH
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
class TChartClipboard : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TPointSeries *Series1;
        TLineSeries *Series2;
        TFastLineSeries *Series3;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartClipboard(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartClipboard *ChartClipboard;
//---------------------------------------------------------------------------
#endif
