//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Changes_Package.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChangesPackage *ChangesPackage;
//---------------------------------------------------------------------------
__fastcall TChangesPackage::TChangesPackage(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
