//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Welcome_All.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeDraw3D"
#pragma resource "*.dfm"
TWelcomeAllForm *WelcomeAllForm;
//---------------------------------------------------------------------------
__fastcall TWelcomeAllForm::TWelcomeAllForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TWelcomeAllForm::FormShow(TObject *Sender)
{
  for (int t=2; t<14; t++)
  {
    TImage *tmp = new TImage(this);
    tmp->Left = Image1->Left;
    tmp->Transparent = true;
    tmp->Top = Image1->Top+(Label2->Top-Label1->Top)*(t-1);
    tmp->Picture->Assign(Image1->Picture);
    tmp->Parent = Image1->Parent;
  }

  // Set axis...
  Chart1->LeftAxis->SetMinMax(-100,100);
  Chart1->BottomAxis->SetMinMax(0,360);

  // Start animation
  Timer1->Enabled = true;

}
//---------------------------------------------------------------------------

void __fastcall TWelcomeAllForm::Timer1Timer(TObject *Sender)
{
  if (Series1->Count() == 360) Series1->Clear();
  else Series1->Add( 100.0*sin(Series1->Count()*M_PI/180.0), "", clTeeColor);
}
//---------------------------------------------------------------------------

