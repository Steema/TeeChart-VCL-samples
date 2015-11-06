//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_MinorGrid.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisMinorGrid *AxisMinorGrid;
//---------------------------------------------------------------------------
__fastcall TAxisMinorGrid::TAxisMinorGrid(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisMinorGrid::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);

  Chart1->BottomAxis->MinorGrid->Visible = true;
  Chart1->BottomAxis->MinorTickCount = 3;
}
//---------------------------------------------------------------------------

void __fastcall TAxisMinorGrid::CheckBox1Click(TObject *Sender)
{
  Chart1->BottomAxis->MinorGrid->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

