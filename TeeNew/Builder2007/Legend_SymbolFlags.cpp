//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_SymbolFlags.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TLegendSymbolDraw *LegendSymbolDraw;
//---------------------------------------------------------------------------
__fastcall TLegendSymbolDraw::TLegendSymbolDraw(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendSymbolDraw::LegendDraw(TObject *Sender,  TChartSeries *Series,
  int ValueIndex, const TRect &R)
{
  TRect bRect = R;
  if (CheckBox1->Checked)
  {
    Graphics::TBitmap *flag = new Graphics::TBitmap(); // create flag bitmap
    try
    {
      bRect.Top -= 3;
      bRect.Bottom += 3;
      // copy image from imagelist
      ImageList1->GetBitmap(ValueIndex,flag);

      Chart1->Canvas->StretchDraw(bRect,flag);  // draw image to legend
      // draw border
      if (Chart1->Legend->Symbol->Pen->Visible)
      {
        Chart1->Canvas->Brush->Style = bsClear;
        Chart1->Canvas->AssignVisiblePen(Chart1->Legend->Symbol->Pen);
        Chart1->Canvas->Rectangle(bRect,0);
      }
    }
    __finally
    {
      delete flag; // destroy bitmap
    }
  }
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolDraw::FormCreate(TObject *Sender)
{
  Series1->Clear();
  randomize();
  Series1->Add(random(100),"USA");
  Series1->Add(random(100),"France");
  Series1->Add(random(100),"Germany");
  Series1->Add(random(100),"India");
  Series1->Add(random(100),"Italy");
  Series1->Add(random(100),"Japan");
  Series1->Add(random(100),"Portugal");
  Series1->Add(random(100),"U.K.");

  // Set event to display custom legend symbols:
  Chart1->Legend->Symbol->OnDraw = LegendDraw;

  ButtonPen1->LinkPen(Chart1->Legend->Symbol->Pen);

  // Make space bigger for flags
  Chart1->Legend->Font->Size = 10;
  Chart1->Legend->VertSpacing = 8;
  Chart1->Legend->Symbol->Width = 30;
  Chart1->Legend->Symbol->WidthUnits = lcsPixels;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolDraw::CheckBox1Click(TObject *Sender)
{
  Chart1->Invalidate();  
}
//---------------------------------------------------------------------------

