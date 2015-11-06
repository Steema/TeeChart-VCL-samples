//---------------------------------------------------------------------------

#ifndef Tool_AxisArrowH
#define Tool_AxisArrowH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAxisArrowToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TAxisArrowTool *ChartTool1;
        TAxisArrowTool *ChartTool2;
        TLineSeries *Series1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TAxisArrowTool *ChartTool3;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisArrowToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisArrowToolDemo *AxisArrowToolDemo;
//---------------------------------------------------------------------------
#endif
