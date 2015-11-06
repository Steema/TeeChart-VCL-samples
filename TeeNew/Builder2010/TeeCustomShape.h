//---------------------------------------------------------------------------

#ifndef TeeCustomShapeH
#define TeeCustomShapeH
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
//---------------------------------------------------------------------------
class TCustomShape : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TScrollBar *ScrollBar1;
        TLabel *Label1;
        TScrollBar *ScrollBar2;
        TLabel *Label2;
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormDestroy(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall Chart1MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall ScrollBar2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        TTeeShape *Shape;
        __fastcall TCustomShape(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCustomShape *CustomShape;
//---------------------------------------------------------------------------
#endif
