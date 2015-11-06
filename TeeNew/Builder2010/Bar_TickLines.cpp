//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Bar_TickLines.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TBarTickLines *BarTickLines;
//---------------------------------------------------------------------------
__fastcall TBarTickLines::TBarTickLines(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarTickLines::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();

  ButtonPen1->LinkPen(Series1->TickLines);
  Series1->TickLines->Visible = true;
}
//---------------------------------------------------------------------------

void __fastcall TBarTickLines::CheckBox1Click(TObject *Sender)
{
  Series1->TickLines->Visible = CheckBox1->Checked;

  ButtonPen1->Invalidate();
}
//---------------------------------------------------------------------------

