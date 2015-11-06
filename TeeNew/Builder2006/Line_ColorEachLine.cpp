//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Line_ColorEachLine.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLineColorEachLine *LineColorEachLine;
//---------------------------------------------------------------------------
__fastcall TLineColorEachLine::TLineColorEachLine(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLineColorEachLine::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);

  Chart1->View3D = false;
  Series1->ColorEachPoint = true;
  Series1->ColorEachLine = false;
}
//---------------------------------------------------------------------------

void __fastcall TLineColorEachLine::CheckBox1Click(TObject *Sender)
{
  Series1->ColorEachLine = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLineColorEachLine::CheckBox2Click(TObject *Sender)
{
  CheckBox1->Enabled = CheckBox2->Checked;
  Series1->ColorEachPoint = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

