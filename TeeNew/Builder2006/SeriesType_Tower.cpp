//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Tower.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TTowerSeriesForm *TowerSeriesForm;
//---------------------------------------------------------------------------
__fastcall TTowerSeriesForm::TTowerSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTowerSeriesForm::FormCreate(TObject *Sender)
{
  Series1->Clear();
  for (int x=1; x<10; x++)
      for ( int z=1; z<10; z++)
          Series1->Value[x][z] = random(1000)-100.0;

  // example:
  Series1->Origin = 500;
  Series1->UseOrigin = true;

  ComboFlat1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

void __fastcall TTowerSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TTowerSeriesForm::ComboFlat1Change(TObject *Sender)
{
  Series1->TowerStyle = (TTowerStyle)ComboFlat1->ItemIndex;
}
//---------------------------------------------------------------------------

void __fastcall TTowerSeriesForm::CheckBox1Click(TObject *Sender)
{
  Series1->UseOrigin = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

