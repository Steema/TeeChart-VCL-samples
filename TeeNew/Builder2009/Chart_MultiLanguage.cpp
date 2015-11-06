//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include <TeeSpanish.hpp>
#include <TeeGerman.hpp>
#include <TeeCatalan.hpp>
#include <TeeFrench.hpp>
#include <TeeDanish.hpp>
#include <TeeDutch.hpp>
#include <TeeChinese.hpp>
#include <TeeChineseSimp.hpp>
#include <TeeBrazil.hpp>
#include <TeeSwedish.hpp>
#include <TeePortuguese.hpp>
#include <TeeRussian.hpp>
#include <TeeSlovene.hpp>
#include <TeeNorwegian.hpp>
#include <TeeJapanese.hpp>
#include <TeePolish.hpp>
#include <TeeTurkish.hpp>
#include <TeeHungarian.hpp>
#include <TeeItalian.hpp>
#include <TeeArabic.hpp>
#include <TeeHebrew.hpp>
#include <TeeUkrainian.hpp>
#include <TeeKorean.hpp>
#include <TeeIndonesian.hpp>
#include <TeeGalician.hpp>
#include <TeeFinnish.hpp>
#include <TeeSlovak.hpp>
#include <TeeHellenic.hpp>
#include <TeeRomanian.hpp>
#include <TeeSerbian.hpp>
#include <TeeFarsi.hpp>
#include <TeeCzech.hpp>
#include <TeeHindi.hpp>
#include <TeeUrdu.hpp>

// TAskLanguage form class:
#include <TeeTranslate.hpp>

#include "Chart_MultiLanguage.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeConst"
#pragma link "TeeProCo"
#pragma link "TeeSpanish"
#pragma link "TeeGerman"
#pragma link "TeeCatalan"
#pragma link "TeeFrench"
#pragma link "TeeDanish"
#pragma link "TeeDutch"
#pragma link "TeeChinese"
#pragma link "TeeChineseSimp"
#pragma link "TeeBrazil"
#pragma link "TeeSwedish"
#pragma link "TeePortuguese"
#pragma link "TeeRussian"
#pragma link "TeeSlovene"
#pragma link "TeeNorwegian"
#pragma link "TeeJapanese"
#pragma link "TeePolish"
#pragma link "TeeTurkish"
#pragma link "TeeHungarian"
#pragma link "TeeItalian"
#pragma link "TeeArabic"
#pragma link "TeeHebrew"
#pragma link "TeeUkrainian"
#pragma link "TeeKorean"
#pragma link "TeeIndonesian"
#pragma link "TeeGalician"
#pragma link "TeeFinnish"
#pragma link "TeeSlovak"
#pragma link "TeeHellenic"
#pragma link "TeeRomanian"
#pragma link "TeeSerbian"
#pragma link "TeeFarsi"
#pragma link "TeeCzech"
#pragma link "TeeHindi"
#pragma link "TeeUrdu"

#pragma link "TeeEdit"
#pragma resource "*.dfm"
TChartMultiLanguage *ChartMultiLanguage;
//---------------------------------------------------------------------------
__fastcall TChartMultiLanguage::TChartMultiLanguage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void TChartMultiLanguage::ChangeLanguage(int ALanguage)
{
  // CHANGE LANGUAGE
  switch (ALanguage)
  {
    case 1: TeeSetBrazil(); break;
    case 2: TeeSetCatalan(); break;
    case 3: TeeSetChineseSimp(); break;
    case 4: TeeSetChinese(); break;
    case 5: TeeSetDanish(); break;
    case 6: TeeSetDutch(); break;
    case 7: TeeSetFrench(); break;
    case 8: TeeSetGerman(); break;
    case 9: TeeSetItalian(); break;
   case 10: TeeSetPortuguese(); break;
   case 11: TeeSetRussian(); break;
   case 12: TeeSetSpanish(); break;
   case 13: TeeSetSwedish(); break;
   case 14: TeeSetNorwegian(); break;
   case 15: TeeSetJapanese(); break;
   case 16: TeeSetPolish(); break;
   case 17: TeeSetSlovene(); break;
   case 18: TeeSetTurkish(); break;
   case 19: TeeSetHungarian(); break;
   case 20: TeeSetGalician(); break;
   case 21: TeeSetArabic(); break;
   case 22: TeeSetHebrew(); break;
   case 23: TeeSetUkrainian(); break;
   case 24: TeeSetKorean(); break;
   case 25: TeeSetIndonesian(); break;
   case 26: TeeSetFinnish(); break;
   case 27: TeeSetSlovak(); break;
   case 28: TeeSetHellenic(); break;
   case 29: TeeSetRomanian(); break;
   case 30: TeeSetSerbian(); break;
   case 31: TeeSetFarsi(); break;
   case 32: TeeSetCzech(); break;
   case 33: TeeSetHindi(); break;
   case 34: TeeSetUrdu(); break;
   default: TeeSetEnglish();      break; // default = English
  }
}
//---------------------------------------------------------------------------
void __fastcall TChartMultiLanguage::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex=0; // English = default

  // Fill series with sample random values
  Series1->FillSampleValues(Series1->NumSampleValues());
}
//---------------------------------------------------------------------------

void __fastcall TChartMultiLanguage::ComboBox1Change(TObject *Sender)
{

  ChangeLanguage((int)ComboBox1->Items->Objects[ComboBox1->ItemIndex]);

  // Translation Examples:

  // Translate the "Show Editor" button to the new selected
  // language using a constant string
  Button1->Caption=TeeMsg_EditChart;

  // Reset label caption to English
  Label1->Caption="&Choose a Language:";

  // Translate the "Choose a Language" label to the new language
  TeeTranslateControl(Label1);

  // Fill again the Series with translated values
  Series1->FillSampleValues(Series1->NumSampleValues());

  // A whole form can also be translated: TeeTranslateControl(Form1)
}
//---------------------------------------------------------------------------

void __fastcall TChartMultiLanguage::Button1Click(TObject *Sender)
{
  ChartEditor1->Execute();
}
//---------------------------------------------------------------------------

void __fastcall TChartMultiLanguage::FormCreate(TObject *Sender)
{
  TAskLanguage *tmpForm;
  Application->CreateForm(__classid(TAskLanguage), &tmpForm);
  try
  {
    this->ComboBox1->Items = tmpForm->LBLangs->Items;
  }
  __finally
  {
    delete tmpForm;
  }
}
//---------------------------------------------------------------------------

