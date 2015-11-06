//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_PolarBar.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePolar"
#pragma resource "*.dfm"
TPolarBarForm *PolarBarForm;
//---------------------------------------------------------------------------
__fastcall TPolarBarForm::TPolarBarForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPolarBarForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TPolarBarForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

