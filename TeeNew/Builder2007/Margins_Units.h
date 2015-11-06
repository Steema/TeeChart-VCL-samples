//---------------------------------------------------------------------------

#ifndef Margins_UnitsH
#define Margins_UnitsH
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
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TChartMarginUnits : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *ComboBox1;
    TLabel *Label2;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TLabel *Label3;
  void __fastcall ComboBox1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartMarginUnits(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartMarginUnits *ChartMarginUnits;
//---------------------------------------------------------------------------
#endif
