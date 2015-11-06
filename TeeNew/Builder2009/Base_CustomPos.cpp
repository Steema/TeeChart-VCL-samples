//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Base_CustomPos.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBaseCustomPos *BaseCustomPos;
//---------------------------------------------------------------------------
__fastcall TBaseCustomPos::TBaseCustomPos(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
