//---------------------------------------------------------------------------

#ifndef Chart_WebSourceH
#define Chart_WebSourceH
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
#include "TeeURL.hpp"
//---------------------------------------------------------------------------
class TChartWebSourceForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TEdit *Edit1;
        TButton *Button1;
        TChartWebSource *ChartWebSource1;
        TTeeCommander *TeeCommander1;
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartWebSourceForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartWebSourceForm *ChartWebSourceForm;
//---------------------------------------------------------------------------
#endif
