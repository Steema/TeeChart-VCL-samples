//---------------------------------------------------------------------------

#ifndef ChartEditor_HideDataSetsH
#define ChartEditor_HideDataSetsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <DB.hpp>
#include <DBTables.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <Chart.hpp>
#include <DBChart.hpp>
#include <EditChar.hpp>
#include <Series.hpp>

//---------------------------------------------------------------------------
class TMyChart : public TDBChart
{
  public:		// User declarations
    TDataSet *HideTable;
    DYNAMIC bool __fastcall IsValidDataSource(TChartSeries *ASeries,
        TComponent *AComponent);
    __fastcall TMyChart(TComponent *Owner);
}
;

//---------------------------------------------------------------------------
class TChartEditorHideDataSets : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
    TPanel *Panel1;
    TButton *Button1;
    TCheckBox *CheckBox1;
    TTable *Table1;
    TTable *Table2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
    TMyChart *MyChart;
  __fastcall TChartEditorHideDataSets(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartEditorHideDataSets *ChartEditorHideDataSets;
//---------------------------------------------------------------------------
#endif
