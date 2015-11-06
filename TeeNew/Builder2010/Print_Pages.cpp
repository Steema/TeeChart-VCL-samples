//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Print_Pages.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeNavigator"
#pragma resource "*.dfm"
TPrintPagesForm *PrintPagesForm;
//---------------------------------------------------------------------------
__fastcall TPrintPagesForm::TPrintPagesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPrintPagesForm::Button1Click(TObject *Sender)
{
  PrintDialog1->FromPage = 1;
  PrintDialog1->ToPage = Chart1->NumPages();
  PrintDialog1->MinPage = PrintDialog1->FromPage;
  PrintDialog1->MaxPage = PrintDialog1->ToPage;
  if (PrintDialog1->Execute()) Chart1->PrintPages(PrintDialog1->FromPage,PrintDialog1->ToPage);
}
//---------------------------------------------------------------------------

void __fastcall TPrintPagesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
  ChartPageNavigator1->EnableButtons();
  Chart1PageChange(this);
}
//---------------------------------------------------------------------------

void __fastcall TPrintPagesForm::Chart1PageChange(TObject *Sender)
{
  Label2->Caption = IntToStr(Chart1->Page)+" of "+IntToStr(Chart1->NumPages());
}
//---------------------------------------------------------------------------

