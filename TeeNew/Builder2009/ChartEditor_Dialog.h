//---------------------------------------------------------------------------

#ifndef ChartEditor_DialogH
#define ChartEditor_DialogH
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
#include "TeeEdit.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartEditorForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartEditor *ChartEditor1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        THorizBarSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartEditorForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartEditorForm *ChartEditorForm;
//---------------------------------------------------------------------------
#endif
