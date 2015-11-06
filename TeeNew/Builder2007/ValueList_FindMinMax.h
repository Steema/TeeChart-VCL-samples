//---------------------------------------------------------------------------

#ifndef ValueList_FindMinMaxH
#define ValueList_FindMinMaxH
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
class TFindMinMaxValues : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TButton *Button1;
        TColorLineTool *ChartTool1;
        TColorLineTool *ChartTool2;
        TColorLineTool *ChartTool3;
        TColorLineTool *ChartTool4;
        TButton *Button2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFindMinMaxValues(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFindMinMaxValues *FindMinMaxValues;
//---------------------------------------------------------------------------
#endif
