//---------------------------------------------------------------------------

#ifndef Commander_CustomH
#define Commander_CustomH
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
#include "TeeComma.hpp"
#include <Buttons.hpp>
//---------------------------------------------------------------------------
class TCommanderCustom : public TBaseForm
{
__published:	// IDE-managed Components
    TTeeCommander *TeeCommander1;
    TSpeedButton  *SpeedButton1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
        void __fastcall ButtonClick(TObject *Sender);
public:		// User declarations
        __fastcall TCommanderCustom(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCommanderCustom *CommanderCustom;
//---------------------------------------------------------------------------
#endif
