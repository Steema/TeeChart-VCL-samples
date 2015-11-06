//---------------------------------------------------------------------------

#ifndef Function_ModeH
#define Function_ModeH
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
class TModeFunctionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TFastLineSeries *Series1;
    TLineSeries *Series2;
    TModeTeeFunction *TeeFunction1;
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TModeFunctionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TModeFunctionDemo *ModeFunctionDemo;
//---------------------------------------------------------------------------
#endif
