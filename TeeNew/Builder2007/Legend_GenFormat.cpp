//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Legend_GenFormat.h"
#include <TeeCustomShapeEditor.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeDonut"
#pragma resource "*.dfm"
TLegendGenFormat *LegendGenFormat;
//---------------------------------------------------------------------------
__fastcall TLegendGenFormat::TLegendGenFormat(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TLegendGenFormat::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
}
//---------------------------------------------------------------------------

void __fastcall TLegendGenFormat::FormShow(TObject *Sender)
{
  InsertTeeObjectForm(PageControl1,Chart1->Legend)->RefreshControls(Chart1->Legend);
}
//---------------------------------------------------------------------------

