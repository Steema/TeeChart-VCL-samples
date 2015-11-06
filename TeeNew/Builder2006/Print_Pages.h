//---------------------------------------------------------------------------

#ifndef Print_PagesH
#define Print_PagesH
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
#include "TeeEdiGene.hpp"
#include <Dialogs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPrintPagesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TBarSeries *Series1;
        TChartPageNavigator* ChartPageNavigator1;
        TPrintDialog *PrintDialog1;
        TLabel *Label1;
        TLabel *Label2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1PageChange(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPrintPagesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintPagesForm *PrintPagesForm;
//---------------------------------------------------------------------------
#endif
