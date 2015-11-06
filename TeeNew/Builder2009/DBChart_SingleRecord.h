//---------------------------------------------------------------------------

#ifndef DBChart_SingleRecordH
#define DBChart_SingleRecordH
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
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Grids.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDBChartSingleRecord : public TBaseDBChart
{
__published:	// IDE-managed Components
        TDBGrid *DBGrid1;
        TTable *Table1;
        TBarSeries *Series1;
        TDataSource *DataSource1;
        TDBNavigator *DBNavigator1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDBChartSingleRecord(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartSingleRecord *DBChartSingleRecord;
//---------------------------------------------------------------------------
#endif
