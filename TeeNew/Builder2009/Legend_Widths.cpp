//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_Widths.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "OHLChart"
#pragma resource "*.dfm"
TLegendWidths *LegendWidths;
//---------------------------------------------------------------------------
__fastcall TLegendWidths::TLegendWidths(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendWidths::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TLegendWidths::Edit1Change(TObject *Sender)
{
  Chart1->Legend->ColumnWidths[0] = UpDown1->Position;
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TLegendWidths::CheckBox1Click(TObject *Sender)
{
  Chart1->Legend->ColumnWidthAuto = CheckBox1->Checked;
  Chart1->Repaint();

  UpDown1->Enabled = ! CheckBox1->Checked;
  UpDown2->Enabled = ! CheckBox1->Checked;
  Edit1->Enabled = ! CheckBox1->Checked;
  Edit2->Enabled = ! CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TLegendWidths::Edit2Change(TObject *Sender)
{
  Chart1->Legend->ColumnWidths[1] = UpDown2->Position;
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

