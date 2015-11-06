//---------------------------------------------------------------------------

#ifndef DBChart_SummaryH
#define DBChart_SummaryH
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
class TDBChartSummary : public TBaseDBChart
{
__published:	// IDE-managed Components
        TButton *Button1;
        TBarSeries *Series1;
        TTable *Table1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TComboBox *ComboBox2;
        TCheckBox *CheckBox1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall ComboBox2Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDBChartSummary(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartSummary *DBChartSummary;
//---------------------------------------------------------------------------
#endif
