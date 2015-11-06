//---------------------------------------------------------------------------

#ifndef Legend_TitleH
#define Legend_TitleH
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
class TLegendTitleForm : public TBaseForm
{
__published:	// IDE-managed Components
    TLineSeries *Series1;
    TCheckBox *CheckBox1;
    TButton *Button1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TLegendTitleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendTitleForm *LegendTitleForm;
//---------------------------------------------------------------------------
#endif
