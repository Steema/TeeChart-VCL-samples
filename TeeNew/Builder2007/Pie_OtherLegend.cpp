//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Pie_OtherLegend.h"
#include "TeeEdiLege.hpp"
#include "TeCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TPieOtherLegend *PieOtherLegend;
//---------------------------------------------------------------------------
__fastcall TPieOtherLegend::TPieOtherLegend(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPieOtherLegend::FormCreate(TObject *Sender)
{
  // add data
  Series1->Add(134, "Google");
  Series1->Add( 65, "Yahoo");
  Series1->Add( 23, "AltaVista");
  Series1->Add( 12, "AllTheWeb");
  Series1->Add(  9, "Terra");
  Series1->Add(  6, "Lycos");
  Series1->Add(  3, "Ask Jeeves");

  // prepare "Other" to group values below 10
  Series1->OtherSlice->Style = poBelowValue;
  Series1->OtherSlice->Value = 10;

  // Display "Other" legend:
  Series1->OtherSlice->Legend->Visible = true;
  Series1->OtherSlice->Legend->Left = 340;
  Series1->OtherSlice->Legend->Top = 150;
}
//---------------------------------------------------------------------------

void __fastcall TPieOtherLegend::CheckBox1Click(TObject *Sender)
{
  // Show / Hide "Other" legend
  Series1->OtherSlice->Legend->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TPieOtherLegend::Button1Click(TObject *Sender)
{
  // Show Legend editor dialog...
  TFormTeeLegend *legform = new TFormTeeLegend(this,Series1->OtherSlice->Legend);
  try
  {
    legform->ShowModal();
  }
  __finally
  {
    delete legform;
  }
}
//---------------------------------------------------------------------------

void __fastcall TPieOtherLegend::Chart1AfterDraw(TObject *Sender)
{
  // cosmetic line from normal legend to "other" legend
  if (Series1->OtherSlice->Legend->Visible)
  {
    TCanvas3D *canvas = Chart1->Canvas;
    canvas->Pen->Style = psDot;
    canvas->Pen->Width = 2;
    canvas->Pen->Color =clNavy;

    int tmpX = Chart1->Legend->Left;

    canvas->MoveTo(tmpX,Chart1->Legend->ShapeBounds.Bottom-4);
    canvas->LineTo(tmpX-10,Chart1->Legend->ShapeBounds.Bottom);
    canvas->LineTo(tmpX-10,Series1->OtherSlice->Legend->Top+4);
    canvas->LineTo(Series1->OtherSlice->Legend->Left,Series1->OtherSlice->Legend->Top+4);
  }
}
//---------------------------------------------------------------------------

