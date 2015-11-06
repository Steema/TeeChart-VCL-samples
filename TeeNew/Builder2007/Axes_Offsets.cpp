//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axes_Offsets.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxesOffsets *AxesOffsets;
//---------------------------------------------------------------------------
__fastcall TAxesOffsets::TAxesOffsets(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxesOffsets::Edit1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) Chart1->Axes->Left->MinimumOffset = UpDown1->Position;
  else Chart1->Axes->Bottom->MinimumOffset = UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAxesOffsets::Edit2Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex==0) Chart1->Axes->Left->MaximumOffset = UpDown2->Position;
  else Chart1->Axes->Bottom->MaximumOffset = UpDown2->Position;
}
//---------------------------------------------------------------------------

void __fastcall TAxesOffsets::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TAxesOffsets::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex ==0)
  {
    UpDown1->Position = Chart1->Axes->Left->MinimumOffset;
    UpDown2->Position = Chart1->Axes->Left->MaximumOffset;
  }
  else
  {
    UpDown1->Position = Chart1->Axes->Bottom->MinimumOffset;
    UpDown2->Position = Chart1->Axes->Bottom->MaximumOffset;
  }
}
//---------------------------------------------------------------------------

