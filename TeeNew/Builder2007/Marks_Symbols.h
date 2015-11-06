//---------------------------------------------------------------------------

#ifndef Marks_SymbolsH
#define Marks_SymbolsH
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
class TMarkSymbols : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TCheckBox *CheckBox1;
    TButton *Button1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TMarkSymbols(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarkSymbols *MarkSymbols;
//---------------------------------------------------------------------------
#endif
