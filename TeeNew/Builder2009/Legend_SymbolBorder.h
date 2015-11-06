//---------------------------------------------------------------------------

#ifndef Legend_SymbolBorderH
#define Legend_SymbolBorderH
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
#include "TeePenDlg.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TLegendSymbolBorder : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TButtonPen *ButtonPen1;
    TBarSeries *Series1;
    TCheckBox *CheckBox2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TLegendSymbolBorder(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendSymbolBorder *LegendSymbolBorder;
//---------------------------------------------------------------------------
#endif
