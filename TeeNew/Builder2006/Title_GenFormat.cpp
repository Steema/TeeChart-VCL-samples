//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Title_GenFormat.h"
#include <TeeCustomShapeEditor.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TTitleGenFormat *TitleGenFormat;
//---------------------------------------------------------------------------
__fastcall TTitleGenFormat::TTitleGenFormat(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTitleGenFormat::FormCreate(TObject *Sender)
{
  Chart1->Title->Transparent = false;
}
//---------------------------------------------------------------------------

void __fastcall TTitleGenFormat::FormShow(TObject *Sender)
{
  InsertTeeObjectForm(PageControl1,Chart1->Title)->RefreshControls(Chart1->Title);
}
//---------------------------------------------------------------------------

