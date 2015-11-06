//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_Shadow.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieShadowForm *PieShadowForm;
//---------------------------------------------------------------------------
__fastcall TPieShadowForm::TPieShadowForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieShadowForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(9);

  Series1->Shadow->Color=Tee_CircledShadowColor;  // silver color 
  Series1->Shadow->HorizSize=30;
  Series1->Shadow->VertSize=50;
}
//---------------------------------------------------------------------------

void __fastcall TPieShadowForm::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked)
     Series1->Shadow->Color=Tee_CircledShadowColor;
  else
     Series1->Shadow->Color=clNone;
}
//---------------------------------------------------------------------------

