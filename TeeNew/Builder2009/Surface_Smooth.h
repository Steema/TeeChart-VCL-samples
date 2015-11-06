//---------------------------------------------------------------------------

#ifndef Surface_SmoothH
#define Surface_SmoothH
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
//---------------------------------------------------------------------------
class TSurfaceSmooth : public TBaseForm
{
__published:	// IDE-managed Components
        TSurfaceSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSurfaceSmooth(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceSmooth *SurfaceSmooth;
//---------------------------------------------------------------------------
#endif
