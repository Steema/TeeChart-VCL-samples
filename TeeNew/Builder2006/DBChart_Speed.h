//---------------------------------------------------------------------------

#ifndef DBChart_SpeedH
#define DBChart_SpeedH
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
class TDBChartSpeed : public TBaseDBChart
{
__published:	// IDE-managed Components
        TTable *Table1;
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDBChartSpeed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartSpeed *DBChartSpeed;
//---------------------------------------------------------------------------
#endif
