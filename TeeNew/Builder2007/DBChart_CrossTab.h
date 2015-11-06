//---------------------------------------------------------------------------

#ifndef DBChart_CrossTabH
#define DBChart_CrossTabH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <Db.hpp>
#include <DBCtrls.hpp>
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TDBChartCrossTab : public TForm
{
__published:	// IDE-managed Components
        TDataSource *DataSource1;
        TChart *Chart1;
        TBarSeries *Series1;
        TTable *Table1;
        TFloatField *Table1OrderNo;
        TStringField *Table1ShipVIA;
        TStringField *Table1Terms;
        TCurrencyField *Table1AmountPaid;
        TPanel *Panel1;
        TDBGrid *DBGrid1;
        TPanel *Panel2;
        TDBNavigator *DBNavigator1;
        TRadioGroup *RadioGroup1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
        AnsiString Dim1;
        AnsiString Dim2;
        void __fastcall CrossTab(void);
public:		// User declarations
        __fastcall TDBChartCrossTab(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartCrossTab *DBChartCrossTab;
//---------------------------------------------------------------------------
#endif
