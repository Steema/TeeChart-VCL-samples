//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_Cylinder.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBarCylinderForm *BarCylinderForm;
//---------------------------------------------------------------------------
__fastcall TBarCylinderForm::TBarCylinderForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarCylinderForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

