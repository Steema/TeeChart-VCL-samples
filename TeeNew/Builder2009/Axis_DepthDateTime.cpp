//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_DepthDateTime.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TDepthAxisDateTime *DepthAxisDateTime;
//---------------------------------------------------------------------------
__fastcall TDepthAxisDateTime::TDepthAxisDateTime(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TDepthAxisDateTime::FormCreate(TObject *Sender)
{
  Series1->XValues->DateTime = true;
  Series1->ZValues->DateTime = true;
  Series1->FillSampleValues();

  Chart1->Axes->Bottom->DateTimeFormat = "mmm-dd";
  Chart1->Axes->Depth->DateTimeFormat ="mmm-dd";
  Chart1->Axes->DepthTop->Visible = true;
  Chart1->Axes->DepthTop->DateTimeFormat = "mmm-dd";
  
}
//---------------------------------------------------------------------------

void __fastcall TDepthAxisDateTime::CheckBox1Click(TObject *Sender)
{
  Series1->ZValues->DateTime = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

