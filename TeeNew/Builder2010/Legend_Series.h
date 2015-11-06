//---------------------------------------------------------------------------

#ifndef Legend_SeriesH
#define Legend_SeriesH
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
class TLegendSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TRadioButton *RadioButton1;
        TRadioButton *RadioButton2;
        TBarSeries *Series1;
        TLineSeries *Series2;
        void __fastcall RadioButton1Click(TObject *Sender);
        void __fastcall RadioButton2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendSeriesForm *LegendSeriesForm;
//---------------------------------------------------------------------------
#endif
