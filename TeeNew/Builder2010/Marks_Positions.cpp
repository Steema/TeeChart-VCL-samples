//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_Positions.h"
#include "TeeEditPro.hpp"
#include <TeeStore.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TMarksPositions *MarksPositions;
//---------------------------------------------------------------------------
__fastcall TMarksPositions::TMarksPositions(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksPositions::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(5);
}
//---------------------------------------------------------------------------

void __fastcall TMarksPositions::Button1Click(TObject *Sender)
{
  SaveChartDialog(Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TMarksPositions::Button2Click(TObject *Sender)
{
  if (OpenDialog1->Execute()); LoadChartFromFile(dynamic_cast<TCustomChart*>(Chart1),OpenDialog1->FileName);
}
//---------------------------------------------------------------------------

