//---------------------------------------------------------------------------

#ifndef Pointer_DrawCanvasH
#define Pointer_DrawCanvasH
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
class TPointerDrawCanvas : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        TLabel *Label1;
        TPaintBox *PaintBox1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall PaintBox1Paint(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPointerDrawCanvas(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPointerDrawCanvas *PointerDrawCanvas;
//---------------------------------------------------------------------------
#endif
