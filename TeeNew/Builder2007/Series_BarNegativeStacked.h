//---------------------------------------------------------------------------

#ifndef Series_BarNegativeStackedH
#define Series_BarNegativeStackedH
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
#include "TeeComma.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBarStackNegative : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TBarSeries *Series3;
        TTeeCommander *TeeCommander1;
        TColorLineTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarStackNegative(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarStackNegative *BarStackNegative;
//---------------------------------------------------------------------------
#endif
