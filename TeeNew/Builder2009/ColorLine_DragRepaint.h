//---------------------------------------------------------------------------

#ifndef ColorLine_DragRepaintH
#define ColorLine_DragRepaintH
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
class TColorLineDragRepaint : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TColorLineTool *ChartTool1;
    TColorLineTool *ChartTool2;
    TColorLineTool *ChartTool3;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TColorLineDragRepaint(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorLineDragRepaint *ColorLineDragRepaint;
//---------------------------------------------------------------------------
#endif
