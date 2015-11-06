//---------------------------------------------------------------------------

#ifndef Function_PerformanceH
#define Function_PerformanceH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPerfFuncDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TLineSeries *Series2;
    TPerformanceFunction *TeeFunction1;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPerfFuncDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPerfFuncDemo *PerfFuncDemo;
//---------------------------------------------------------------------------
#endif
