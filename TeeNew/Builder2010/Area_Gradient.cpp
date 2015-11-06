//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Area_Gradient.h"

#include "TeeEdiGrad.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAreaGradient *AreaGradient;
//---------------------------------------------------------------------------
__fastcall TAreaGradient::TAreaGradient(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAreaGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Series1->Gradient,false);
}
//---------------------------------------------------------------------------

void __fastcall TAreaGradient::FormCreate(TObject *Sender)
{

  Series1->FillSampleValues(10);
  // This can be also done at design-time:
  TTeeGradient *grad = Series1->Gradient;
  grad->Visible = true;
  grad->StartColor = clRed;
  grad->MidColor=clBlue;
  grad->EndColor=clGreen;
}
//---------------------------------------------------------------------------

void __fastcall TAreaGradient::CheckBox1Click(TObject *Sender)
{
  Series1->Gradient->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAreaGradient::ScrollBar1Change(TObject *Sender)
{
  Series1->Transparency = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

