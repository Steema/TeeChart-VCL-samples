//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "MarkTips_MouseDelay.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TMarksTipMouseDelay *MarksTipMouseDelay;
//---------------------------------------------------------------------------
__fastcall TMarksTipMouseDelay::TMarksTipMouseDelay(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksTipMouseDelay::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);
  Series2->FillSampleValues(4);
  Series3->FillSampleValues(4);

  ChartTool1->MouseDelay=500; // wait 500 milliseconds before display
}
//---------------------------------------------------------------------------

void __fastcall TMarksTipMouseDelay::Edit1Change(TObject *Sender)
{
  ChartTool1->MouseDelay=UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TMarksTipMouseDelay::ComboBox1Change(TObject *Sender)
{
  switch ( ComboBox1->ItemIndex )
  {
    case 0: ChartTool1->Series=NULL;  break; // all series !
    case 1: ChartTool1->Series=Series1; break;
    case 2: ChartTool1->Series=Series2; break;
    case 3: ChartTool1->Series=Series3; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TMarksTipMouseDelay::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex=0; // all series
}
//---------------------------------------------------------------------------

