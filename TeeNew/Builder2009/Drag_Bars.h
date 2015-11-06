//---------------------------------------------------------------------------

#ifndef Drag_BarsH
#define Drag_BarsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "CurvFitt.hpp"
#include "TeeComma.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TDragBarForm : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TLineSeries *Series1;
        TTrendFunction *TeeFunction1;
        TBarSeries *Series2;
        TTeeCommander *TeeCommander1;
        TPanel *Panel1;
        TRadioGroup *RadioGroup1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
        void __fastcall Chart1MouseUp(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
        void __fastcall RadioGroup1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Chart1MouseDown(TObject *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
private:	// User declarations
        int Dragged;
        int OldY;
public:		// User declarations
        __fastcall TDragBarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDragBarForm *DragBarForm;
//---------------------------------------------------------------------------
#endif
