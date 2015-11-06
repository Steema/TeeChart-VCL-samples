//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_Performance.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TPerfFuncDemo *PerfFuncDemo;
//---------------------------------------------------------------------------
__fastcall TPerfFuncDemo::TPerfFuncDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPerfFuncDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
}
//---------------------------------------------------------------------------

