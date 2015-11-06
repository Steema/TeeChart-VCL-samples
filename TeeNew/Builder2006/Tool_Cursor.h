//---------------------------------------------------------------------------

#ifndef Tool_CursorH
#define Tool_CursorH
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
#include "TeeEdit.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCursorToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TLabel *Label2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCursorTool *ChartTool1;
        TFastLineSeries *Series2;
        TCursorTool *ChartTool2;
        TColorLineTool *ChartTool3;
        TFastLineSeries *Series1;
        TButton *Button1;
        TChartEditor *ChartEditor1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall ChartTool1Change(TCursorTool *Sender, int x, int y,
          const double XValue, const double YValue, TChartSeries *Series,
          int ValueIndex);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall ChartTool2Change(TCursorTool *Sender, int x, int y,
          const double XValue, const double YValue, TChartSeries *Series,
          int ValueIndex);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCursorToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCursorToolDemo *CursorToolDemo;
//---------------------------------------------------------------------------
#endif
