//---------------------------------------------------------------------------

#ifndef Legend_VertSpaH
#define Legend_VertSpaH
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
#include "Bar3D.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendVertSpa : public TBaseForm
{
__published:	// IDE-managed Components
        TEdit *Edit1;
        TUpDown *UpDown1;
        TLabel *Label1;
        TBar3DSeries *Series1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendVertSpa(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendVertSpa *LegendVertSpa;
//---------------------------------------------------------------------------
#endif
