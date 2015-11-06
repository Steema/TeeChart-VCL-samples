//---------------------------------------------------------------------------

#ifndef DBChart_CrossTabSourceH
#define DBChart_CrossTabSourceH
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
#include "TeeDBCrosstab.hpp"
#include "TeeDBEdit.hpp"
#include <DB.hpp>
#include <DBTables.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDBCrossTabSourceDemo : public TBaseDBChart
{
__published:	// IDE-managed Components
    TDBCrossTabSource *DBCrossTabSource1;
    TBarSeries *Series1;
    TTable *Table1;
    TCheckBox *CheckBox1;
    TRadioGroup *RadioGroup1;
    TButton *Button1;
  void __fastcall FormShow(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall RadioGroup1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TDBCrossTabSourceDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBCrossTabSourceDemo *DBCrossTabSourceDemo;
//---------------------------------------------------------------------------
#endif
