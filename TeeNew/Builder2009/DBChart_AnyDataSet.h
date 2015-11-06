//---------------------------------------------------------------------------

#ifndef DBChart_AnyDataSetH
#define DBChart_AnyDataSetH
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
#include <Db.hpp>
#include <DBTables.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDBChartAny : public TBaseDBChart
{
__published:	// IDE-managed Components
        TTable *Table1;
        TPieSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDBChartAny(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartAny *DBChartAny;
//---------------------------------------------------------------------------
#endif
