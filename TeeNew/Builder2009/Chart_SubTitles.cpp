//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_SubTitles.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TSubTitles *SubTitles;
//---------------------------------------------------------------------------
__fastcall TSubTitles::TSubTitles(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSubTitles::FormCreate(TObject *Sender)
{
  Chart1->SubTitle->Text->Add("Hello");
  Chart1->SubTitle->Font->Color = clGreen;
  Chart1->SubTitle->Font->Size = 12;
  Chart1->SubTitle->Font->Style = TFontStyles() << fsBold;

  Chart1->SubFoot->Text->Add("World !");
}
//---------------------------------------------------------------------------

void __fastcall TSubTitles::CheckBox1Click(TObject *Sender)
{
  Chart1->SubTitle->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSubTitles::CheckBox2Click(TObject *Sender)
{
  Chart1->SubFoot->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

