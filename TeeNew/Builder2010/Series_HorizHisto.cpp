//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_HorizHisto.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
THorizHistoForm *HorizHistoForm;
//---------------------------------------------------------------------------
__fastcall THorizHistoForm::THorizHistoForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THorizHistoForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);  
}
//---------------------------------------------------------------------------

