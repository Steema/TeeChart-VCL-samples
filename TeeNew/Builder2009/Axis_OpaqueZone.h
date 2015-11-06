//---------------------------------------------------------------------------

#ifndef Axis_OpaqueZoneH
#define Axis_OpaqueZoneH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAxisOpaqueZone : public TBaseForm
{
__published:	// IDE-managed Components
    TLineSeries *Series1;
    TLineSeries *Series2;
    TLineSeries *Series3;
    TLineSeries *Series4;
    TColorLineTool *ChartTool1;
    TColorLineTool *ChartTool2;
    TColorLineTool *ChartTool3;
    TCheckBox *CheckBox1;
    TScrollBar *ScrollBar1;
    TLabel *Label1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall SeriesBeforeDraw(TObject *Sender);
        void __fastcall SeriesAfterDraw(TObject *Sender);
        void __fastcall Chart1Scroll(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
private:	// User declarations
        void __fastcall DoScroll(TChartSeries *Series);
public:		// User declarations
        __fastcall TAxisOpaqueZone(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisOpaqueZone *AxisOpaqueZone;
//---------------------------------------------------------------------------
#endif
