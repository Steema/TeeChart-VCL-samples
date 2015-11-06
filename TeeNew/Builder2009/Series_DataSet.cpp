//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_DataSet.h"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeData"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSeriesDataSetForm *SeriesDataSetForm;
//---------------------------------------------------------------------------
__fastcall TSeriesDataSetForm::TSeriesDataSetForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSeriesDataSetForm::DBGrid1DrawColumnCell(TObject *Sender,
      const TRect &Rect, int DataCol, TColumn *Column,
      TGridDrawState State)
{
  if (DataCol == 0)
  {
    DBGrid1->Canvas->Brush->Color = TColor(Column->Field->AsInteger);
    DBGrid1->Canvas->FillRect(Rect);
  }
}
//---------------------------------------------------------------------------

void __fastcall TSeriesDataSetForm::CheckBox1Click(TObject *Sender)
{
  SeriesDataSet1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSeriesDataSetForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TSeriesDataSetForm::DBGrid1EditButtonClick(TObject *Sender)
{
  SeriesDataSet1Color->AsInteger = EditColor(this,TColor(SeriesDataSet1Color->AsInteger));
}
//---------------------------------------------------------------------------

