//---------------------------------------------------------------------------

#ifndef Export_PDFH
#define Export_PDFH
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
#include <BubbleCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPDFExportForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TButton *Button2;
    TLineSeries *Series1;
    TCandleSeries *Series2;
    TBubbleSeries *Series3;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPDFExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPDFExportForm *PDFExportForm;
//---------------------------------------------------------------------------
#endif
