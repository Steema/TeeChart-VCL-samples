//---------------------------------------------------------------------------

#ifndef DBChart_OrderH
#define DBChart_OrderH
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
class TDBChartOrder : public TBaseDBChart
{
__published:	// IDE-managed Components
        TTable *Table1;
        TRadioGroup *RadioGroup1;
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormShow(TObject *Sender);
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDBChartOrder(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartOrder *DBChartOrder;
//---------------------------------------------------------------------------
#endif
