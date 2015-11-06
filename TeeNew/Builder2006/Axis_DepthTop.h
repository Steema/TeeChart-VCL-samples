//---------------------------------------------------------------------------

#ifndef Axis_DepthTopH
#define Axis_DepthTopH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TDepthTopAxisForm : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TTowerSeries *Series1;
    TCheckBox *CheckBox2;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TDepthTopAxisForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDepthTopAxisForm *DepthTopAxisForm;
//---------------------------------------------------------------------------
#endif
