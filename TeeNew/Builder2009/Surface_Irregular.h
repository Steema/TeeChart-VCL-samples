//---------------------------------------------------------------------------

#ifndef Surface_IrregularH
#define Surface_IrregularH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TSurfaceFloat : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TSurfaceSeries *Series1;
        TCheckBox *CheckBox2;
        TRotateTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceFloat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceFloat *SurfaceFloat;
//---------------------------------------------------------------------------
#endif
