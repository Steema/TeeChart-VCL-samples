//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Editor_Formatting.h"
#include <TeeFormatting.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFormatEditorDemo *FormatEditorDemo;
//---------------------------------------------------------------------------
__fastcall TFormatEditorDemo::TFormatEditorDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFormatEditorDemo::SetOtherFormats()
{
  Series1->GetHorizAxis->AxisValuesFormat = Edit1->Text;
  Series1->GetVertAxis->AxisValuesFormat = Edit1->Text;
  Series1->ValueFormat = Edit1->Text;
}
//---------------------------------------------------------------------------
void __fastcall TFormatEditorDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);

  Edit1->Text = Series1->ValueFormat;

  SetOtherFormats();
}
//---------------------------------------------------------------------------

void __fastcall TFormatEditorDemo::Button1Click(TObject *Sender)
{
//  Edit1->Text = TFormatEditor::Change(__classid(TFormatEditorDemo),this,Edit1->Text);
  SetOtherFormats();
}
//---------------------------------------------------------------------------

void __fastcall TFormatEditorDemo::Edit1Change(TObject *Sender)
{
  SetOtherFormats();
}
//---------------------------------------------------------------------------

