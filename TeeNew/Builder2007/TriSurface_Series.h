//---------------------------------------------------------------------------

#ifndef TriSurface_SeriesH
#define TriSurface_SeriesH
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
#include "TeePenDlg.hpp"
#include "TeeSurfa.hpp"
#include "TeeTriSurface.hpp"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TTriSurfaceForm : public TBaseForm
{
__published:	// IDE-managed Components
        TTriSurfaceSeries *Series1;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTriSurfaceForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTriSurfaceForm *TriSurfaceForm;
//---------------------------------------------------------------------------
#endif
