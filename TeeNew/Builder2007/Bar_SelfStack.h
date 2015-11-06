//---------------------------------------------------------------------------

#ifndef Bar_SelfStackH
#define Bar_SelfStackH
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
//---------------------------------------------------------------------------
class TBarSelfStack : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TBarSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBarSelfStack(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarSelfStack *BarSelfStack;
//---------------------------------------------------------------------------
#endif
