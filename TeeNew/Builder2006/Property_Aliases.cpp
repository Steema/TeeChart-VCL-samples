//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Property_Aliases.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TPropertyAliases *PropertyAliases;
//---------------------------------------------------------------------------
__fastcall TPropertyAliases::TPropertyAliases(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
