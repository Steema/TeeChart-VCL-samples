//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_GenFormat.h"
#include <TeeCustomShapeEditor.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksGenFormat *MarksGenFormat;
//---------------------------------------------------------------------------
__fastcall TMarksGenFormat::TMarksGenFormat(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksGenFormat::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(4);
}
//---------------------------------------------------------------------------

void __fastcall TMarksGenFormat::FormShow(TObject *Sender)
{
  InsertTeeObjectForm(PageControl1,Series1->Marks)->RefreshControls(Series1->Marks);
}
//---------------------------------------------------------------------------

