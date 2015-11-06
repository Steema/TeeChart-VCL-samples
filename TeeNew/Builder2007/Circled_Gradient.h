//---------------------------------------------------------------------------

#ifndef Circled_GradientH
#define Circled_GradientH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCircledGradient : public TBaseForm
{
__published:	// IDE-managed Components
    TPolarSeries *Series1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCircledGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCircledGradient *CircledGradient;
//---------------------------------------------------------------------------
#endif
