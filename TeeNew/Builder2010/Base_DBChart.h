//---------------------------------------------------------------------------

#ifndef Base_DBChartH
#define Base_DBChartH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <DBChart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
//---------------------------------------------------------------------------
class TBaseDBChart : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
        TPanel *Panel1;
        TDBChart *DBChart1;
        TSplitter *BaseSplitter1;
  void __fastcall Memo1DblClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBaseDBChart(TComponent* Owner);
};

void __fastcall CheckTable(TTable *ATable);
//---------------------------------------------------------------------------
extern PACKAGE TBaseDBChart *BaseDBChart;
//---------------------------------------------------------------------------
#endif
