//---------------------------------------------------------------------------

#ifndef Title_ClickEventH
#define Title_ClickEventH
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
class TTitleClickEvent : public TBaseForm
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1ClickTitle(TCustomChart *Sender,
          TChartTitle *ATitle, TMouseButton Button, TShiftState Shift,
          int X, int Y);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TTitleClickEvent(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTitleClickEvent *TitleClickEvent;
//---------------------------------------------------------------------------
#endif
