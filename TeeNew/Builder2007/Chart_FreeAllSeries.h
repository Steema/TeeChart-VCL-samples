//---------------------------------------------------------------------------

#ifndef Chart_FreeAllSeriesH
#define Chart_FreeAllSeriesH
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
class TFreeAllSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TBarSeries *Series1;
        TLineSeries *Series2;
        TBarSeries *Series3;
        TLineSeries *Series4;
        TBarSeries *Series5;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFreeAllSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFreeAllSeriesForm *FreeAllSeriesForm;
//---------------------------------------------------------------------------
#endif
