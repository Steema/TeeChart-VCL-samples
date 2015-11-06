//---------------------------------------------------------------------------

#ifndef Function_CLVH
#define Function_CLVH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include "TeeCLVFunction.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCLVFuncDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TCandleSeries *Series1;
    TVolumeSeries *Series2;
    TColorLineTool *ChartTool1;
    TLineSeries *Series3;
    TCLVFunction *TeeFunction1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TColorLineTool *ChartTool2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCLVFuncDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCLVFuncDemo *CLVFuncDemo;
//---------------------------------------------------------------------------
#endif
