//---------------------------------------------------------------------------

#ifndef Function_CustomH
#define Function_CustomH
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
class TCustomFunctionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TLineSeries *Series1;
    TCustomTeeFunction *TeeFunction1;
    TButton *Button1;
  void __fastcall TeeFunction1Calculate(TCustomTeeFunction *Sender,
          const double x, double &y);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCustomFunctionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomFunctionDemo *CustomFunctionDemo;
//---------------------------------------------------------------------------
#endif
