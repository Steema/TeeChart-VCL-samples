//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Customers.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TTeeCustomers *TeeCustomers;
//---------------------------------------------------------------------------
__fastcall TTeeCustomers::TTeeCustomers(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
