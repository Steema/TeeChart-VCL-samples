//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_Calendar.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeCalendar"
#pragma resource "*.dfm"
TCalendarSeriesForm *CalendarSeriesForm;
//---------------------------------------------------------------------------
__fastcall TCalendarSeriesForm::TCalendarSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCalendarSeriesForm::FormCreate(TObject *Sender)
{
  TCalendarSeries *Calendar = new TCalendarSeries(this);
  Calendar->ParentChart = Chart1;
  Calendar->WeekDays->Font->Color = clBlue;
  Calendar->WeekDays->Font->Size = 9;
  Calendar->WeekDays->Font->Style = TFontStyles()<<fsItalic;
  Calendar->WeekDays->UpperCase = true;
  Calendar->WeekDays->Color = clYellow;
  Calendar->Days->Font->Color = clGreen;
}
//---------------------------------------------------------------------------

void __fastcall TCalendarSeriesForm::CheckBox2Click(TObject *Sender)
{
  Calendar->Months->Visible = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCalendarSeriesForm::CheckBox1Click(TObject *Sender)
{
  Calendar->WeekDays->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TCalendarSeriesForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Calendar);
}
//---------------------------------------------------------------------------

