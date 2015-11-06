//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_SVG.h"
#include "TeExport.hpp"
#include "TeeSVGCanvas.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSVGExportForm *SVGExportForm;
//---------------------------------------------------------------------------
__fastcall TSVGExportForm::TSVGExportForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSVGExportForm::Button1Click(TObject *Sender)
{
  TeeSavePanel(__classid(TSVGExportFormat),Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TSVGExportForm::Button2Click(TObject *Sender)
{
  TeeExport(this,Chart1);
}
//---------------------------------------------------------------------------

void __fastcall TSVGExportForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues();
  Series2->FillSampleValues();
  Series3->FillSampleValues();
  Series4->FillSampleValues();
}
//---------------------------------------------------------------------------

void __fastcall TSVGExportForm::Label1Click(TObject *Sender)
{
  TeeGotoURL((int)Handle, "http://www.adobe.com/svg/viewer/install/main.html");
}
//---------------------------------------------------------------------------

