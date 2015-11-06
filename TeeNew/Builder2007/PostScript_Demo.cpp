//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PostScript_Demo.h"
#include <TeePSCanvas.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPostScriptForm *PostScriptForm;
//---------------------------------------------------------------------------
__fastcall TPostScriptForm::TPostScriptForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPostScriptForm::Button1Click(TObject *Sender)
{
  if (SaveDialog1->Execute())
  {
    TEPSExportFormat *tmp = new TEPSExportFormat();
    try
    {
      tmp->Panel = Chart1;
      tmp->SaveToFile(SaveDialog1->FileName);
    }
    __finally
    {
      delete tmp;
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TPostScriptForm::FormCreate(TObject *Sender)
{
  Chart1->Color = clWhite;
  Chart1->BevelInner = bvNone;
  Chart1->BevelOuter = bvNone;

  Series1->FillSampleValues(5);
  Series2->FillSampleValues(5);
  Series3->FillSampleValues(5);
}
//---------------------------------------------------------------------------

