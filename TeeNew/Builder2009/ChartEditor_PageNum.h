//---------------------------------------------------------------------------

#ifndef ChartEditor_PageNumH
#define ChartEditor_PageNumH
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
#include "TeeNavigator.hpp"
#include <Series.hpp>
#include <EditChar.hpp>
#include <TeeEditCha.hpp>
#include "TeeEdiGene.hpp"
//---------------------------------------------------------------------------
class TChartEditorPageNum : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TBarSeries *Series1;
    TChartPageNavigator *ChartPageNavigator1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartEditorPageNum(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartEditorPageNum *ChartEditorPageNum;
//---------------------------------------------------------------------------
#endif
