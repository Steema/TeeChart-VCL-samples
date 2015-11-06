//---------------------------------------------------------------------------

#ifndef Tool_CursorSynchroH
#define Tool_CursorSynchroH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <SysUtils.hpp>
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
class TCursorSynchro : public TBaseForm
{
__published:	// IDE-managed Components
     TFastLineSeries *Series1;
     TFastLineSeries *Series2;
     TCursorTool *ChartTool1;
     TCursorTool *ChartTool2;
     TCheckBox *CheckBox1;
     TCheckBox *CheckBox2;
     TLabel *Label1;
     TSplitter *Splitter1;
     TChart *Chart2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ChartTool2Change(TCursorTool *Sender, int x, int y,
          const double XValue, const double YValue, TChartSeries *Series,
          int ValueIndex);
        void __fastcall ChartTool1Change(TCursorTool *Sender, int x, int y,
          const double XValue, const double YValue, TChartSeries *Series,
          int ValueIndex);
private:	// User declarations
        void __fastcall ShowXY(const double X,const double Y);
public:		// User declarations
        __fastcall TCursorSynchro(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCursorSynchro *CursorSynchro;
//---------------------------------------------------------------------------
#endif
