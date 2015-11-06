//---------------------------------------------------------------------------

#ifndef Clock_EditorsH
#define Clock_EditorsH
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
#include "MyPoint.hpp"
#include "TeePolar.hpp"
#include "TeeRose.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TClockEdi : public TBaseForm
{
__published:	// IDE-managed Components
        TChart *Chart2;
        TClockSeries *Series1;
        TMyPointSeries *Series2;
        TButton *Button1;
        TButton *Button2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TClockEdi(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TClockEdi *ClockEdi;
//---------------------------------------------------------------------------
#endif
