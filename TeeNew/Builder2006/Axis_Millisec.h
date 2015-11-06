//---------------------------------------------------------------------------

#ifndef Axis_MillisecH
#define Axis_MillisecH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TAxisMillisec : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisMillisec(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisMillisec *AxisMillisec;
//---------------------------------------------------------------------------
#endif
