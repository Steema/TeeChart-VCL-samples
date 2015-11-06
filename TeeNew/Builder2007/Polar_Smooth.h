//---------------------------------------------------------------------------

#ifndef Polar_SmoothH
#define Polar_SmoothH
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
#include "TeeSpline.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarSmoothForm : public TBaseForm
{
__published:	// IDE-managed Components
    TPolarSeries *Series2;
    TSmoothingFunction *TeeFunction1;
    TPolarSeries *Series1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TGroupBox *GroupBox1;
    TCheckBox *CheckBox3;
  void __fastcall CheckBox3Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPolarSmoothForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarSmoothForm *PolarSmoothForm;
//---------------------------------------------------------------------------
#endif
