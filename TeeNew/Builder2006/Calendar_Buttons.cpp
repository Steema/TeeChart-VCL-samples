//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Calendar_Buttons.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeCalendar"
#pragma link "EditChar"
#pragma resource "*.dfm"
TCalendarButtons *CalendarButtons;
//---------------------------------------------------------------------------
__fastcall TCalendarButtons::TCalendarButtons(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCalendarButtons::FormCreate(TObject *Sender)
{
  ComboBox1->ItemIndex=0;

  // set button hints
  Series1->PreviousMonthButton->Hint="Previous Month";
  Series1->NextMonthButton->Hint="Next Month";
  Series1->PreviousMonthButton->ShowHint=true;
  Series1->NextMonthButton->ShowHint=true;
}
//---------------------------------------------------------------------------

void __fastcall TCalendarButtons::Button1Click(TObject *Sender)
{
  TPoint P;
  // do popup menu
  P=Chart1->ClientToScreen(Point(Chart1->ChartXCenter,10));
  Series1->PopupMenu->Popup(P.x,P.y);
}
//---------------------------------------------------------------------------

void __fastcall TCalendarButtons::CheckBox2Click(TObject *Sender)
{
  // switch on / off transparency for some cells...
  int tmp;
  if (CheckBox2->Checked) tmp=50; else tmp=0;
  Series1->Days->Transparency=tmp;
  Series1->Sunday->Transparency=tmp;
  Series1->Today->Transparency=tmp;
}
//---------------------------------------------------------------------------

void __fastcall TCalendarButtons::Button2Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TCalendarButtons::ComboBox1Change(TObject *Sender)
{
  // re-position buttons to left, right or middle
  switch (ComboBox1->ItemIndex)
  {
    case 0: {
         Series1->PreviousMonthButton->Left=6;
         Series1->NextMonthButton->Left=26;
       } break;
    case 1: {
         Series1->PreviousMonthButton->Left=Chart1->Width-48;
         Series1->NextMonthButton->Left=Chart1->Width-26;
       } break;
    case 2: {
         Series1->PreviousMonthButton->Left=Chart1->ChartXCenter-26;
         Series1->NextMonthButton->Left=Chart1->ChartXCenter+6;
       } break;
  };
}
//---------------------------------------------------------------------------

void __fastcall TCalendarButtons::CheckBox1Click(TObject *Sender)
{
  // show / hide buttons
  Series1->NextMonthButton->Visible=CheckBox1->Checked;
  Series1->PreviousMonthButton->Visible=CheckBox1->Checked;
}
//---------------------------------------------------------------------------

