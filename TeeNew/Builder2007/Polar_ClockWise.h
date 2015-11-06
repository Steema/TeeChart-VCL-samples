//---------------------------------------------------------------------------

#ifndef Polar_ClockWiseH
#define Polar_ClockWiseH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarClockWise : public TBaseForm
{
__published:	// IDE-managed Components
        TPolarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPolarClockWise(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarClockWise *PolarClockWise;
//---------------------------------------------------------------------------
#endif
