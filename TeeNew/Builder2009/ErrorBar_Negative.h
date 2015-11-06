//---------------------------------------------------------------------------

#ifndef ErrorBar_NegativeH
#define ErrorBar_NegativeH
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
#include "ErrorBar.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TErrorBarNegativeForm : public TBaseForm
{
__published:	// IDE-managed Components
        TErrorBarSeries *Series1;
        TColorLineTool *ChartTool1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TErrorBarNegativeForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TErrorBarNegativeForm *ErrorBarNegativeForm;
//---------------------------------------------------------------------------
#endif
