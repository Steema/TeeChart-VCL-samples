//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "DrawLine_Style.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TDrawLineStyleForm *DrawLineStyleForm;
//---------------------------------------------------------------------------
__fastcall TDrawLineStyleForm::TDrawLineStyleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDrawLineStyleForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;

  Chart1->LeftAxis->SetMinMax(0,100);
  Chart1->BottomAxis->SetMinMax(0,100);
}
//---------------------------------------------------------------------------

void __fastcall TDrawLineStyleForm::ChartTool1NewLine(TObject *Sender)
{
  // Change line style for new added lines:
  switch (ComboBox1->ItemIndex)
  {
    case 0: ChartTool1->Lines->Last()->Style = dlLine; break;
    case 1: ChartTool1->Lines->Last()->Style = dlHorizParallel; break;
    case 2: ChartTool1->Lines->Last()->Style = dlVertParallel; break;
  }
}
//---------------------------------------------------------------------------

