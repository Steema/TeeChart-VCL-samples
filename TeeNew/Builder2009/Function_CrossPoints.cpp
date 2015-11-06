//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_CrossPoints.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma resource "*.dfm"
TCrossPointsDemo *CrossPointsDemo;
//---------------------------------------------------------------------------
__fastcall TCrossPointsDemo::TCrossPointsDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCrossPointsDemo::CheckBox1Click(TObject *Sender)
{
  Series3->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCrossPointsDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(25);
  Series2->FillSampleValues(25);
}
//---------------------------------------------------------------------------

