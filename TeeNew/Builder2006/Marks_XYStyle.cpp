//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_XYStyle.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksXYStyle *MarksXYStyle;
//---------------------------------------------------------------------------
__fastcall TMarksXYStyle::TMarksXYStyle(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksXYStyle::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);

  Series1->Marks->Style = smsXY;
}
//---------------------------------------------------------------------------

void __fastcall TMarksXYStyle::Series1GetMarkText(TChartSeries *Sender,
      int ValueIndex, AnsiString &MarkText)
{
  MarkText = StringReplace(MarkText," ","-",TReplaceFlags());
}
//---------------------------------------------------------------------------

