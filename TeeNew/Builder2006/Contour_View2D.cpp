//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_View2D.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TContourView2D *ContourView2D;
//---------------------------------------------------------------------------
__fastcall TContourView2D::TContourView2D(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TContourView2D::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);
}
//---------------------------------------------------------------------------

void __fastcall TContourView2D::CheckBox1Click(TObject *Sender)
{
  Chart1->View3D = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

