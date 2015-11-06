//---------------------------------------------------------------------------

#ifndef Legend_ScrollH
#define Legend_ScrollH
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
class TLegendScroll : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TColorLineTool *ChartTool1;
        TScrollBar *ScrollBar1;
        TLabel *Label1;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall ChartTool1EndDragLine(TColorLineTool *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendScroll(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendScroll *LegendScroll;
//---------------------------------------------------------------------------
#endif
