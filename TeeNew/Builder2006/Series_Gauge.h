//---------------------------------------------------------------------------

#ifndef Series_GaugeH
#define Series_GaugeH
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
#include "TeeGauges.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TGaugeDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TGaugeSeries *Series1;
    TButton *Button1;
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall Series1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGaugeDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGaugeDemo *GaugeDemo;
//---------------------------------------------------------------------------
#endif
