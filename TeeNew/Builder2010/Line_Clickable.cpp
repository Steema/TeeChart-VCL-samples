//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Line_Clickable.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLineClickableForm *LineClickableForm;
//---------------------------------------------------------------------------
__fastcall TLineClickableForm::TLineClickableForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLineClickableForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Series1->ClickableLine = false;
}
//---------------------------------------------------------------------------

void __fastcall TLineClickableForm::CheckBox1Click(TObject *Sender)
{
  Series1->ClickableLine = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLineClickableForm::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  int tmp = Series1->Clicked(X,Y);

  if (tmp ==-1) Label1->Caption ="";
  else Label1->Caption ="Point: "+IntToStr(tmp);

}
//---------------------------------------------------------------------------

