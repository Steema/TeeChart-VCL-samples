//---------------------------------------------------------------------------

#ifndef Chart_PrintPreviewH
#define Chart_PrintPreviewH
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
#include "TeeEdit.hpp"
#include "TeeMapSeries.hpp"
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TChartPrintPreviewForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TButton *Button3;
        TMapSeries *Series1;
        TChartPreviewer *ChartPreviewer1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button3Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartPrintPreviewForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartPrintPreviewForm *ChartPrintPreviewForm;
//---------------------------------------------------------------------------
#endif
