//---------------------------------------------------------------------------

#ifndef Function_VarianceH
#define Function_VarianceH
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
class TVarianceDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TPointSeries *Series1;
    TLineSeries *Series2;
    TVarianceFunction *TeeFunction1;
    TButton *Button1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TVarianceDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TVarianceDemo *VarianceDemo;
//---------------------------------------------------------------------------
#endif
