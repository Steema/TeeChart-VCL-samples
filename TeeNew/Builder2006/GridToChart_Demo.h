//---------------------------------------------------------------------------

#ifndef GridToChart_DemoH
#define GridToChart_DemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeDragPoint.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Grids.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TGridToChartDemo : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
    TStringGrid *StringGrid1;
    TSplitter *Splitter1;
    TChart *Chart1;
  TDragPointTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall StringGrid1SetEditText(TObject *Sender, int ACol,
          int ARow, const AnsiString Value);
  void __fastcall Chart1ClickSeries(TCustomChart *Sender,
          TChartSeries *Series, int ValueIndex, TMouseButton Button,
          TShiftState Shift, int X, int Y);
  void __fastcall Chart1ClickLegend(TCustomChart *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
  void __fastcall ChartTool1DragPoint(TDragPointTool *Sender, int Index);
private:	// User declarations
public:		// User declarations
    void __fastcall GridToChart(TStringGrid *Grid, TCustomChart *Chart,
        TChartSeriesClass SeriesClass);
        __fastcall TGridToChartDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGridToChartDemo *GridToChartDemo;
//---------------------------------------------------------------------------
#endif
