//---------------------------------------------------------------------------

#ifndef DBChart_LocateRecordH
#define DBChart_LocateRecordH
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
#include <DBGrids.hpp>
#include <DBTables.hpp>
#include <Grids.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDBChartRecordLocate : public TBaseDBChart
{
__published:	// IDE-managed Components
        TTable *Table1;
        TBarSeries *Series1;
        TDBGrid *DBGrid1;
        TDataSource *DataSource1;
        TCheckBox *CheckBox1;
        TStringField *Table1NAME;
        TSmallintField *Table1SIZE;
        TSplitter *Splitter1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall DBChart1ClickSeries(TCustomChart *Sender,
          TChartSeries *Series, int ValueIndex, TMouseButton Button,
          TShiftState Shift, int X, int Y);
        void __fastcall Series1AfterAdd(TChartSeries *Sender,
          int ValueIndex);
private:	// User declarations
public:		// User declarations
        DynamicArray<TBookmark> Bookmarks;
        __fastcall TDBChartRecordLocate(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDBChartRecordLocate *DBChartRecordLocate;
//---------------------------------------------------------------------------
#endif
