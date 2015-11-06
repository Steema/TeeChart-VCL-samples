//---------------------------------------------------------------------------

#ifndef Legend_GenFormatH
#define Legend_GenFormatH
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
#include "TeeDonut.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendGenFormat : public TBaseForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TDonutSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendGenFormat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendGenFormat *LegendGenFormat;
//---------------------------------------------------------------------------
#endif
