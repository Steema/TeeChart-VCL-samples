//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Multi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksMulti *MarksMulti;
//---------------------------------------------------------------------------
__fastcall TMarksMulti::TMarksMulti(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksMulti::FormCreate(TObject *Sender)
{
  Series1->Add( 123, AnsiString("Hello")+AnsiString(TeeLineSeparator)+AnsiString("World!"),clTeeColor);

  Series1->Marks->Style = smsLabelValue;
  Series1->Marks->MultiLine = true;

  Chart1->MarginBottom = 10;
}
//---------------------------------------------------------------------------

void __fastcall TMarksMulti::CheckBox1Click(TObject *Sender)
{
  Series1->Marks->MultiLine = CheckBox1->Checked;

  AnsiString Text;

  if (Series1->Marks->MultiLine)
  {
    Text = "Hello" + TeeLineSeparator;  // due to BCB limitation, split "+" in two lines
    Text = Text + "World";
  }
  else
    Text = "Hello World";

  Series1->XLabel[0] = Text;
}
//---------------------------------------------------------------------------

