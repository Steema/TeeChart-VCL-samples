//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeCustomShapeEditor.hpp"
#include "Axes_LabelsFormat.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxesLabelsFormat *AxesLabelsFormat;
//---------------------------------------------------------------------------
__fastcall TAxesLabelsFormat::TAxesLabelsFormat(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
TTeeShape* __fastcall TAxesLabelsFormat::LabelsFormat(void)
{
  TTeeShape *shape;
  switch (ComboBox1->ItemIndex)
  {
    case 0: shape = Chart1->Axes->Left->Items->Format; break;
    case 1: shape = Chart1->Axes->Top->Items->Format;  break;
    case 2: shape = Chart1->Axes->Right->Items->Format; break;
    default : shape  = Chart1->Axes->Bottom->Items->Format;
  }
  return shape;
}
//---------------------------------------------------------------------------
void __fastcall TAxesLabelsFormat::ComboBox1Change(TObject *Sender)
{
  CheckBox1->Checked = LabelsFormat()->Transparent;
}
//---------------------------------------------------------------------------

void __fastcall TAxesLabelsFormat::CheckBox1Click(TObject *Sender)
{
  LabelsFormat()->Transparent = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxesLabelsFormat::Button1Click(TObject *Sender)
{
  EditTeeCustomShape(this,LabelsFormat());
}
//---------------------------------------------------------------------------

void __fastcall TAxesLabelsFormat::FormCreate(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

