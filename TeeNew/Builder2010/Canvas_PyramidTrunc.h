//---------------------------------------------------------------------------

#ifndef Canvas_PyramidTruncH
#define Canvas_PyramidTruncH
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
//---------------------------------------------------------------------------
class TTruncPyramidForm : public TBaseForm
{
__published:	// IDE-managed Components
    TTeeCommander *TeeCommander1;
    TScrollBar *ScrollBar1;
    TScrollBar *ScrollBar2;
    TLabel *Label1;
    TLabel *Label2;
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTruncPyramidForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTruncPyramidForm *TruncPyramidForm;
//---------------------------------------------------------------------------
#endif
