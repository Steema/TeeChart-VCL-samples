//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_Levels.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TContourLevelsForm *ContourLevelsForm;
//---------------------------------------------------------------------------
__fastcall TContourLevelsForm::TContourLevelsForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContourLevelsForm::AddCustomLevels()
{
  Series1->NumLevels = 10;
  Series1->CreateAutoLevels();
  TContourLevels *Levels = Series1->Levels;
  Levels->Items[0]->UpToValue = -1.0;
  Levels->Items[1]->UpToValue = -0.8;
  Levels->Items[2]->UpToValue = -0.6;
  Levels->Items[3]->UpToValue = -0.4;
  Levels->Items[4]->UpToValue = -0.2;
  Levels->Items[5]->UpToValue =  0.0;
  Levels->Items[6]->UpToValue =  0.2;
  Levels->Items[7]->UpToValue =  0.4;
  Levels->Items[8]->UpToValue =  0.6;
  Levels->Items[9]->UpToValue =  0.8;
}
//---------------------------------------------------------------------------
void __fastcall TContourLevelsForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  AddCustomLevels();
}
//---------------------------------------------------------------------------

void __fastcall TContourLevelsForm::CheckBox1Click(TObject *Sender)
{
  Series1->AutomaticLevels = !CheckBox1->Checked;
  if (!Series1->AutomaticLevels) AddCustomLevels();
}
//---------------------------------------------------------------------------

