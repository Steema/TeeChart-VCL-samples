//---------------------------------------------------------------------------

#ifndef Function_SmoothingH
#define Function_SmoothingH
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
#include "TeeSpline.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TSmoothingFunctionDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TLineSeries *Series1;
    TLineSeries *Series2;
    TSmoothingFunction *TeeFunction1;
    TButton *Button2;
    TCheckBox *CheckBox1;
    TEdit *Edit2;
    TLabel *Label1;
    TUpDown *UDFactor;
    TCheckBox *CheckBox2;
    TCheckBox *CheckBox3;
  void __fastcall CheckBox3Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Edit2Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSmoothingFunctionDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSmoothingFunctionDemo *SmoothingFunctionDemo;
//---------------------------------------------------------------------------
#endif
