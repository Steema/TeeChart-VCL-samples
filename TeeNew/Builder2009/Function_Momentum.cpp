//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Momentum.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TMomentumForm *MomentumForm;
//---------------------------------------------------------------------------
__fastcall TMomentumForm::TMomentumForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMomentumForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(30);
}
//---------------------------------------------------------------------------

void __fastcall TMomentumForm::Edit1Change(TObject *Sender)
{
  TeeFunction1->Period = UpDown1->Position;
}
//---------------------------------------------------------------------------

