//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_FirstLastLabels.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TFirstLastLabels *FirstLastLabels;
//---------------------------------------------------------------------------
__fastcall TFirstLastLabels::TFirstLastLabels(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TFirstLastLabels::BottomAxisDrawLabel(TChartAxis *Sender, int &X, int &Y, int &Z,
    AnsiString &Text, bool &DrawLabel)
{

  if (CheckBox1->Checked)
  {
    TCanvas3D * c = Sender->ParentChart->Canvas;
    // With bottom axis do:
    if (X==Sender->CalcPosValue(Sender->Minimum)) // first label
    {
      c->TextAlign = c->TextAlign - TA_CENTER + TA_LEFT;  // align to left
      c->Font->Style = TFontStyles()<< fsBold;
    }
    else
    if (X==Sender->CalcPosValue(Sender->Maximum)) // last label
    {
      c->TextAlign = c->TextAlign - TA_CENTER + TA_RIGHT; // align to right
      c->Font->Style = TFontStyles()<< fsBold;
    }
  }
}

void __fastcall TFirstLastLabels::FormCreate(TObject *Sender)
{
  Series1->Clear();
  Series1->Add( 123, "First");
  Series1->Add( 456, "Second");
  Series1->Add( 321, "Third");
  Series1->Add( 234, "Last");

  Chart1->Axes->Bottom->OnDrawLabel = BottomAxisDrawLabel;
}
//---------------------------------------------------------------------------

void __fastcall TFirstLastLabels::CheckBox1Click(TObject *Sender)
{
  Chart1->Invalidate();
}
//---------------------------------------------------------------------------

