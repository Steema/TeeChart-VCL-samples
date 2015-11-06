//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_Lighting.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeLighting"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TLightToolForm *LightToolForm;
//---------------------------------------------------------------------------
__fastcall TLightToolForm::TLightToolForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLightToolForm::Button1Click(TObject *Sender)
{
  EditChartTool(this, ChartTool2);
}
//---------------------------------------------------------------------------

void __fastcall TLightToolForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
}
//---------------------------------------------------------------------------

