//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "AxisTitle_Visible.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisTitleVisible *AxisTitleVisible;
//---------------------------------------------------------------------------
__fastcall TAxisTitleVisible::TAxisTitleVisible(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisTitleVisible::CheckBox1Click(TObject *Sender)
{
  Chart1->LeftAxis->Title->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TAxisTitleVisible::Edit1Change(TObject *Sender)
{
  Chart1->LeftAxis->Title->Caption = Edit1->Text;
}
//---------------------------------------------------------------------------

void __fastcall TAxisTitleVisible::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(15);
  Edit1->Text = Chart1->LeftAxis->Title->Caption;
}
//---------------------------------------------------------------------------

