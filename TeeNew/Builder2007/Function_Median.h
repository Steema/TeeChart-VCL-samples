//---------------------------------------------------------------------------

#ifndef Function_MedianH
#define Function_MedianH
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
#include <Series.hpp>
#include <TeeFunci.hpp>
//---------------------------------------------------------------------------
class TMedianFunctionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
    TLineSeries *Series2;
    TMedianTeeFunction *TeeFunction1;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TMedianFunctionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMedianFunctionDemo *MedianFunctionDemo;
//---------------------------------------------------------------------------
#endif
