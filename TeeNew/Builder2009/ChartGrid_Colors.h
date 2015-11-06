//---------------------------------------------------------------------------

#ifndef ChartGrid_ColorsH
#define ChartGrid_ColorsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Chart_Grid.h"
#include "TeeChartGrid.hpp"
#include "TeeNavigator.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TChartGridColors : public TChartGridForm
{
__published:	// IDE-managed Components
   TCheckBox *CheckBox3;
   TCheckBox *CheckBox4;
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartGridColors(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartGridColors *ChartGridColors;
//---------------------------------------------------------------------------
#endif
