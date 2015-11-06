//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_SymbolBorder.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TLegendSymbolBorder *LegendSymbolBorder;
//---------------------------------------------------------------------------
__fastcall TLegendSymbolBorder::TLegendSymbolBorder(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendSymbolBorder::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);

  // Do not use series border to display legend symbols:
  TLegendSymbol *symbol = Chart1->Legend->Symbol;
  symbol->DefaultPen = false;

  // Customize border:
  symbol->Pen->Color = clRed;
  symbol->Pen->Width = 2;
  symbol->Pen->EndStyle = esFlat;

  ButtonPen1->LinkPen(symbol->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolBorder::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->Symbol->DefaultPen = CheckBox1->Checked;
  ButtonPen1->Enabled = !CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendSymbolBorder::CheckBox2Click(TObject *Sender)
{
  Chart1->Legend->Symbol->Squared = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

