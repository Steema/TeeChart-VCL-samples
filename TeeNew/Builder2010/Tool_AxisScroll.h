//---------------------------------------------------------------------------

#ifndef Tool_AxisScrollH
#define Tool_AxisScrollH
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
class TAxisScrollToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
    TAxisScrollTool *ChartTool1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TAxisScrollToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisScrollToolDemo *AxisScrollToolDemo;
//---------------------------------------------------------------------------
#endif
