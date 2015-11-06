//---------------------------------------------------------------------------

#ifndef MomentumDiv_FunctionH
#define MomentumDiv_FunctionH
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
#include "StatChar.hpp"
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMomentumDivForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TLineSeries *Series2;
        TMomentumDivFunction *TeeFunction1;
        TColorLineTool *ChartTool1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMomentumDivForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMomentumDivForm *MomentumDivForm;
//---------------------------------------------------------------------------
#endif
