//---------------------------------------------------------------------------

#ifndef QualityControlH
#define QualityControlH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeTools.hpp"
#include <Chart.hpp>
#include <ComCtrls.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TFormQuality : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TLineSeries *Good;
        TLineSeries *Bad;
        TPanel *Panel1;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *UpperEdit;
        TEdit *LowerEdit;
        TPageControl *PageControl1;
        TTabSheet *TabSheet1;
        TMemo *Memo1;
        TTabSheet *TabSheet2;
        TMemo *Memo2;
        TColorLineTool *ChartTool1;
        TColorLineTool *ChartTool2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall UpperEditChange(TObject *Sender);
        void __fastcall LowerEditChange(TObject *Sender);
private:	// User declarations
        double UL, LL;
        void __fastcall CalculateSPC(TChartSeries *Good, TChartSeries *Bad);
public:		// User declarations
        __fastcall TFormQuality(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormQuality *FormQuality;
//---------------------------------------------------------------------------
#endif
