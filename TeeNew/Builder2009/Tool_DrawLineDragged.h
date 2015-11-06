//---------------------------------------------------------------------------

#ifndef Tool_DrawLineDraggedH
#define Tool_DrawLineDraggedH
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
class TDrawLineOnDragged : public TBaseForm
{
__published:	// IDE-managed Components
    TFastLineSeries *Series1;
    TDrawLineTool *ChartTool1;
    TLabel *LabelLinePos;
    TLabel *Label1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ChartTool1DraggedLine(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDrawLineOnDragged(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDrawLineOnDragged *DrawLineOnDragged;
//---------------------------------------------------------------------------
#endif
