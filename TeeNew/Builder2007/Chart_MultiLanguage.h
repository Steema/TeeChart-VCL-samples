//---------------------------------------------------------------------------

#ifndef Chart_MultiLanguageH
#define Chart_MultiLanguageH
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
#include <TeeConst.hpp>
#include <TeeProCo.hpp>
#include "TeeEdit.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartMultiLanguage : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *ComboBox1;
    TButton *Button1;
    TChartEditor *ChartEditor1;
    TPieSeries *Series1;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        /* class method */ static void ChangeLanguage(int ALanguage);
        __fastcall TChartMultiLanguage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartMultiLanguage *ChartMultiLanguage;
//---------------------------------------------------------------------------
#endif
