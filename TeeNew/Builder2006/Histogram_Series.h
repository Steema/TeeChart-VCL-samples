//---------------------------------------------------------------------------

#ifndef Histogram_SeriesH
#define Histogram_SeriesH
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
#include "StatChar.hpp"
#include "TeePenDlg.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class THistogramForm : public TBaseForm
{
__published:	// IDE-managed Components
        THistogramSeries *Series1;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THistogramForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THistogramForm *HistogramForm;
//---------------------------------------------------------------------------
#endif
