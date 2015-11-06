//---------------------------------------------------------------------------

#ifndef Chart_GridH
#define Chart_GridH
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
#include "TeeChartGrid.hpp"
#include "TeeNavigator.hpp"
#include <Grids.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TChartGridForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TPanel *Panel2;
        TChartGridNavigator *ChartGridNavigator1;
        TChartGrid *ChartGrid1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TButtonColor *ButtonColor1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartGridForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartGridForm *ChartGridForm;
//---------------------------------------------------------------------------
#endif
