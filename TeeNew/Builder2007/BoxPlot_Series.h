//---------------------------------------------------------------------------

#ifndef BoxPlot_SeriesH
#define BoxPlot_SeriesH
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
#include "TeeBoxPlot.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBoxPlotForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBoxSeries *Series1;
        TBoxSeries *Series2;
        TBoxSeries *Series3;
        TCheckBox *CheckBox1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBoxPlotForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBoxPlotForm *BoxPlotForm;
//---------------------------------------------------------------------------
#endif
