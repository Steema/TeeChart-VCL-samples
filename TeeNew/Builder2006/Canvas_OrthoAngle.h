//---------------------------------------------------------------------------

#ifndef Canvas_OrthoAngleH
#define Canvas_OrthoAngleH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TOrthoAngle : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TTrackBar *TrackBar1;
        TLabel *Label2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TrackBar1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TOrthoAngle(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrthoAngle *OrthoAngle;
//---------------------------------------------------------------------------
#endif
