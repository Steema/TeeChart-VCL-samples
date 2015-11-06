//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Area_Origin.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAreaOriginForm *AreaOriginForm;
//---------------------------------------------------------------------------
__fastcall TAreaOriginForm::TAreaOriginForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------



void __fastcall TAreaOriginForm::FormCreate(TObject *Sender)
{
   Series1->FillSampleValues(20);

  /* calc middle point as an example... */
  double tmp = ceil((Series1->YValues->MaxValue+Series1->YValues->MinValue)/2.0);
  UDOrigin->Position = tmp;
  Series1->YOrigin = tmp;

}
//---------------------------------------------------------------------------

void __fastcall TAreaOriginForm::CBUseOriginClick(TObject *Sender)
{
   Series1->UseYOrigin = CBUseOrigin->Checked;
   Series1->YOrigin = UDOrigin->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAreaOriginForm::EOriginChange(TObject *Sender)
{
  if (this->Showing) Series1->YOrigin = UDOrigin->Position;

}
//---------------------------------------------------------------------------

