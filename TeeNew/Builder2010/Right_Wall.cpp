//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Right_Wall.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TRightWallForm *RightWallForm;
//---------------------------------------------------------------------------
__fastcall TRightWallForm::TRightWallForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRightWallForm::CheckBox1Click(TObject *Sender)
{
  Chart1->RightWall->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TRightWallForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

