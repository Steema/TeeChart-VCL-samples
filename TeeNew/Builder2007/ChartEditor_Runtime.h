//---------------------------------------------------------------------------

#ifndef ChartEditor_RuntimeH
#define ChartEditor_RuntimeH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartEditorRuntime : public TBaseForm
{
__published:	// IDE-managed Components
        TChartEditor *ChartEditor1;
        TButton *Button1;
        TLineSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartEditorRuntime(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartEditorRuntime *ChartEditorRuntime;
//---------------------------------------------------------------------------
#endif
