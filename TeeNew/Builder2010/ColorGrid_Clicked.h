//---------------------------------------------------------------------------

#ifndef ColorGrid_ClickedH
#define ColorGrid_ClickedH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TColorGridClicked : public TBaseForm
{
__published:	// IDE-managed Components
    TColorGridSeries *Series1;
    TLabel *Label1;
    TLabel *LabelCell;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TColorGridClicked(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGridClicked *ColorGridClicked;
//---------------------------------------------------------------------------
#endif
