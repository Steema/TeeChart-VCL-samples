//---------------------------------------------------------------------------

#ifndef TeeChartWizardDemoH
#define TeeChartWizardDemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <TeeExpForm.hpp>
//---------------------------------------------------------------------------
class TChartWizardDemo : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartWizardDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartWizardDemo *ChartWizardDemo;
//---------------------------------------------------------------------------
#endif
 