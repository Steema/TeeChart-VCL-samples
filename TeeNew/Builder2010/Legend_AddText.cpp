//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_AddText.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TLegendAddText *LegendAddText;
//---------------------------------------------------------------------------
__fastcall TLegendAddText::TLegendAddText(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendAddText::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
  Series1->XLabel[0] = "one";
  Series1->XLabel[1] = "two";
  Series1->XLabel[2] = "three";
  Series1->XLabel[3]= "four";
  Series1->XLabel[4] = "five";
  Series1->XLabel[5] = "six";
  Chart1->Legend->TextStyle = ltsPlain;
}
//---------------------------------------------------------------------------

void __fastcall TLegendAddText::Chart1AfterDraw(TObject *Sender)
{
  if (CheckBox1->Checked)
  {
    TRect R = Chart1->Legend->ShapeBounds;
    Chart1->Canvas->DoHorizLine(R.Left,R.Right,R.Bottom - 30);
    Chart1->Canvas->TextAlign = TA_LEFT;
    Chart1->Canvas->Font->Size = 8;
    Chart1->Canvas->Font->Color = clNavy;
    Chart1->Canvas-> TextOut(R.Left+8,R.Bottom-28,"Additional text");
    Chart1->Canvas->TextOut(R.Left+8,R.Bottom-16,"displayed here.");
  }
}
//---------------------------------------------------------------------------

void __fastcall TLegendAddText::Chart1GetLegendPos(TCustomChart *Sender,
      int Index, int &X, int &Y, int &XColor)
{
  if (CheckBox1->Checked)
  {
    X = X-40;
    XColor = XColor-40;
  }
}
//---------------------------------------------------------------------------

void __fastcall TLegendAddText::Chart1GetLegendRect(TCustomChart *Sender,
      TRect &Rect)
{
  if (CheckBox1->Checked)
  {
    Rect.Left = Rect.Left-40;
    Rect.Bottom = Rect.Bottom+30;
  }
}
//---------------------------------------------------------------------------

void __fastcall TLegendAddText::CheckBox1Click(TObject *Sender)
{
  Chart1->Repaint();
}
//---------------------------------------------------------------------------

