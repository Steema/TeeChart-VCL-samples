//---------------------------------------------------------------------------

#ifndef Tool_CursorProgH
#define Tool_CursorProgH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCursorToolProg : public TBaseForm
{
__published:	// IDE-managed Components
   TPointSeries *Series1;
   TCursorTool *ChartTool1;
   TButton *ButtonLeft;
   TButton *ButtonRight;
   TButton *ButtonTop;
   TButton *ButtonBottom;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall ButtonLeftClick(TObject *Sender);
        void __fastcall ButtonRightClick(TObject *Sender);
        void __fastcall ButtonTopClick(TObject *Sender);
        void __fastcall ButtonBottomClick(TObject *Sender);
private:	// User declarations
        double __fastcall SomeValue(void);
public:		// User declarations
        __fastcall TCursorToolProg(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCursorToolProg *CursorToolProg;
//---------------------------------------------------------------------------
#endif
