//---------------------------------------------------------------------------

#ifndef Surface_XYZFloatH
#define Surface_XYZFloatH
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
class TSurfaceFloatOther : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TRotateTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceFloatOther(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceFloatOther *SurfaceFloatOther;
//---------------------------------------------------------------------------
#endif
