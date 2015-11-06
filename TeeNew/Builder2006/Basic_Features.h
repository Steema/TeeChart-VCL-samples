//---------------------------------------------------------------------------

#ifndef Basic_FeaturesH
#define Basic_FeaturesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeEdit.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TBasicFeatures : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        TMemo *Memo2;
        TPanel *Panel1;
        TButton *Button1;
        TChart *MyChart;
        TButton *Button2;
        TChartEditor *ChartEditor1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBasicFeatures(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBasicFeatures *BasicFeatures;
//---------------------------------------------------------------------------
#endif
