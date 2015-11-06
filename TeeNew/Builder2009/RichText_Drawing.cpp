//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "RichText_Drawing.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TRichTextDrawing *RichTextDrawing;
//---------------------------------------------------------------------------
__fastcall TRichTextDrawing::TRichTextDrawing(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TRichTextDrawing::DrawRichText(TCustomTeePanel *Chart,TRichEdit *RichEdit,TRect R)
{
  double TwipsPerPixel = 1440.0/96.0;
  FORMATRANGE fr;
  fr.hdc = Chart->Canvas->Handle;
  fr.hdcTarget = fr.hdc;
  R.left = int(R.Left*TwipsPerPixel);
  R.top = int(R.Top*TwipsPerPixel);
  R.right = int(R.Right*TwipsPerPixel);
  R.bottom = int(R.Bottom*TwipsPerPixel);
  fr.rc = R;
  fr.rcPage = R;
  fr.chrg.cpMin = 0;
  fr.chrg.cpMax = -1;

  RichEdit->Perform(EM_FORMATRANGE,1,(int)&fr);

}
//---------------------------------------------------------------------------
void __fastcall TRichTextDrawing::DrawRichText(TCustomTeePanel *Chart,const AnsiString RichText,TRect R)
{
  TRichEdit *RichEdit = new TRichEdit(static_cast<TComponent*>(NULL));
  try
  {
    RichEdit->Parent = Chart->Parent; // set Parent before text and color
    RichEdit->Text = RichText;
    RichEdit->Color = Chart->Color;
    DrawRichText(Chart,RichEdit,R);
  }
  __finally
  {
    delete RichEdit;
  }
}
//---------------------------------------------------------------------------
void __fastcall TRichTextDrawing::Chart1AfterDraw(TObject *Sender)
{
  AnsiString RichText = AnsiString("{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033") +
             AnsiString("{\\fonttbl{\\f0\\fswiss\\fcharset0 Arial;}")+
             AnsiString("{\\f1\\fmodern\\fprq1\\fcharset0 Courier New;}")+
             AnsiString("{\\f2\\fnil\\fcharset2 Symbol;}}")+
             AnsiString("{SuperScript}{\\super 2} {+ SubScript}{\\sub 2}  =  a^2 + a2}");

  DrawRichText(Chart1,RichText,Rect(60,60,360,90));

  RichText = AnsiString("{\\rtf1\\ansi\\ansicpg1252\\deff0\\deflang1033{\\fonttbl{\\f0\\fswiss")+
      AnsiString("\\fcharset0 Arial;}{\\f1\\fmodern\\fprq1\\fcharset0 Courier New;}{\\f2") +
      AnsiString("\\fnil\fcharset2 Symbol;}}")+
      AnsiString("\\viewkind4\\uc1\\pard\\f0\\fs20 Normal\\par")+
      AnsiString("\\b Bold  \\ul\\b0 Underline\\ulnone   \\i Itallic\\par")+
      AnsiString("}");

  DrawRichText(Chart1,RichText,Rect(60,100,360,140));
}
//---------------------------------------------------------------------------

