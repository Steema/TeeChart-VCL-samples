//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Error.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "ErrorBar"
#pragma resource "*.dfm"
TErrorSeriesForm *ErrorSeriesForm;
//---------------------------------------------------------------------------
__fastcall TErrorSeriesForm::TErrorSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TErrorSeriesForm::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: Series1->ErrorStyle = essLeft; break;
    case 1: Series1->ErrorStyle = essTop; break;
    case 2: Series1->ErrorStyle = essRight; break;
    case 3: Series1->ErrorStyle = essBottom; break;
    case 4: Series1->ErrorStyle = essLeftRight; break;
    case 5: Series1->ErrorStyle = essTopBottom; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TErrorSeriesForm::FormCreate(TObject *Sender)
{
  Series1->Clear();

  //              Index Value Error Label Color
  Series1->AddErrorBar(0, 50, 10, "A", clRed);
  Series1->AddErrorBar(1, 80, 20, "B", clYellow);
  Series1->AddErrorBar(2, 20,  8, "C", clGreen);
  Series1->AddErrorBar(3, 60, 30, "D", clBlue);
  Series1->AddErrorBar(4, 40,  5, "E", clWhite);
}
//---------------------------------------------------------------------------

void __fastcall TErrorSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TErrorSeriesForm::ScrollBar1Change(TObject *Sender)
{
  Series1->ErrorWidth = ScrollBar1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TErrorSeriesForm::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 5;
}
//---------------------------------------------------------------------------

