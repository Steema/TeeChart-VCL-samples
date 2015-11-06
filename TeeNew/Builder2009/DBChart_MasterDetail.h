//---------------------------------------------------------------------------

#ifndef DBChart_MasterDetailH
#define DBChart_MasterDetailH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <Db.hpp>
#include <DBChart.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TLinkedTablesForm : public TForm
{
__published:	// IDE-managed Components
    TDBChart *DBChart1;
    TDataSource *DataSource1;
    TPanel *Panel2;
    TTable *Table1;
    TTable *Table2;
    TDBNavigator *DBNavigator1;
    TDataSource *DataSource2;
    TFloatField *Table2OrderNo;
    TFloatField *Table2CustNo;
    TDateTimeField *Table2SaleDate;
    TCurrencyField *Table2AmountPaid;
    TFloatField *Table1CustNo;
    TStringField *Table1Company;
    TAreaSeries *AreaSeries1;
    TCheckBox *CheckBox1;
    TPanel *Panel1;
    TDBGrid *DBGrid1;
    TDBGrid *DBGrid2;
    TSplitter *Splitter1;
        void __fastcall DataSource1DataChange(TObject *Sender,
          TField *Field);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLinkedTablesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLinkedTablesForm *LinkedTablesForm;
//---------------------------------------------------------------------------
#endif
