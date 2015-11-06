//---------------------------------------------------------------------------

#ifndef Series_Vector3DH
#define Series_Vector3DH
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
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TVector3DSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButtonPen *ButtonPen1;
    TVector3DSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TVector3DSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TVector3DSeriesForm *Vector3DSeriesForm;
//---------------------------------------------------------------------------
#endif
