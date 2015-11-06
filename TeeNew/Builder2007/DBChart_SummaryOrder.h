//---------------------------------------------------------------------------

#ifndef DBChart_SummaryOrderH
#define DBChart_SummaryOrderH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base_DBChart.h"
#include <Chart.hpp>
#include <DBChart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TDBSummaryOrder : public TBaseDBChart
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TButton *Button1;
    THorizBarSeries *Series1;
    TTable *Table1;
    TLabel *Label1;
    TComboFlat *ComboFlat1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall ComboFlat1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TDBSummaryOrder(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBSummaryOrder *DBSummaryOrder;
//---------------------------------------------------------------------------
#endif
