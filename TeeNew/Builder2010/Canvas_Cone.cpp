//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Canvas_Cone.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TConesForm *ConesForm;
//---------------------------------------------------------------------------
__fastcall TConesForm::TConesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TConesForm::Chart1AfterDraw(TObject *Sender)
{
  Chart1->Canvas->Cone(true,30,30,80,50,0,20,true,ScrollBar1->Position);
}
//---------------------------------------------------------------------------

void __fastcall TConesForm::ScrollBar1Change(TObject *Sender)
{
  TeeDefaultConePercent = ScrollBar1->Position;
  Label2->Caption = IntToStr(ScrollBar1->Position)+"%";
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TConesForm::FormCreate(TObject *Sender)
{
        Series1->FillSampleValues(5);        
}
//---------------------------------------------------------------------------

void __fastcall TConesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TConesForm::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) Series1->BarStyle = bsCone;
  else Series1->BarStyle = bsPyramid;

  ScrollBar1->Enabled = (Series1->BarStyle == bsCone);
}
//---------------------------------------------------------------------------

