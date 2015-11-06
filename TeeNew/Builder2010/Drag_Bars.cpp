//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Drag_Bars.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "CurvFitt"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TDragBarForm *DragBarForm;
//---------------------------------------------------------------------------
__fastcall TDragBarForm::TDragBarForm(TComponent* Owner)
        : TForm(Owner)
{
  Dragged = -1;
}
//---------------------------------------------------------------------------
void __fastcall TDragBarForm::FormCreate(TObject *Sender)
{
  Series2->FillSampleValues(7);
}
//---------------------------------------------------------------------------

void __fastcall TDragBarForm::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  // if dragging a bar then...
  if (Dragged !=-1)
  {
    // drag the bar, changing the bar's Y value
    Series2->YValues->Value[Dragged] = Series2->YValues->Value[Dragged]+
                                       (Series2->YScreenToValue(Y)-Series2->YScreenToValue(OldY));
    OldY = Y;
    Series1->CheckDataSource();
  }
}
//---------------------------------------------------------------------------

void __fastcall TDragBarForm::Chart1MouseUp(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  Dragged = -1; // stop dragging
}
//---------------------------------------------------------------------------

void __fastcall TDragBarForm::RadioGroup1Click(TObject *Sender)
{
  // change bar style
  Series2->BarStyle = TBarStyle(RadioGroup1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TDragBarForm::CheckBox1Click(TObject *Sender)
{
  Series2->ColorEachPoint = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TDragBarForm::Chart1MouseDown(TObject *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  // when clicking a Bar, start dragging
  Dragged = Series2->Clicked(X,Y);
  OldY = Y;
}
//---------------------------------------------------------------------------

