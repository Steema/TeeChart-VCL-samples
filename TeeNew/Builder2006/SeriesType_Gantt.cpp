//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Gantt.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TGanttSeriesForm *GanttSeriesForm;
//---------------------------------------------------------------------------
__fastcall TGanttSeriesForm::TGanttSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TGanttSeriesForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TGanttSeriesForm::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TGanttSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

