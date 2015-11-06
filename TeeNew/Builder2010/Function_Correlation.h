//---------------------------------------------------------------------------

#ifndef Function_CorrelationH
#define Function_CorrelationH
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
#include "CurvFitt.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCorrelationFunctionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TPointSeries *Series1;
    TLineSeries *Series2;
    TCorrelationFunction *TeeFunction1;
    TCheckBox *CheckBox1;
    TLineSeries *Series3;
    TTrendFunction *TeeFunction2;
    TButton *Button1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCorrelationFunctionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCorrelationFunctionDemo *CorrelationFunctionDemo;
//---------------------------------------------------------------------------
#endif
