//---------------------------------------------------------------------------

#ifndef Template_ChartH
#define Template_ChartH
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
#include "TeeChartActions.hpp"
#include <ActnList.hpp>
//---------------------------------------------------------------------------
class TTemplateChart : public TBaseForm
{
__published:	// IDE-managed Components
        TChart *TemplateChart;
        TButton *Button1;
        TButton *Button2;
        TActionList *ActionList1;
        TChartActionEdit *ChartActionEdit1;
        TSplitter *Splitter1;
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTemplateChart(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTemplateChart *TemplateChart;
//---------------------------------------------------------------------------
#endif
