//---------------------------------------------------------------------------

#ifndef Tool_RotateH
#define Tool_RotateH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TRotateToolForm : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TCheckBox *CheckBox1;
        TRotateTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRotateToolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRotateToolForm *RotateToolForm;
//---------------------------------------------------------------------------
#endif
