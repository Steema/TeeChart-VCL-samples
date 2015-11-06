//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BackWall_Image.h"
#include <TeeBrushDlg.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBackWallImage *BackWallImage;
//---------------------------------------------------------------------------
__fastcall TBackWallImage::TBackWallImage(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBackWallImage::FormCreate(TObject *Sender)
{
  Chart1->BackWall->Transparent = false;
  Chart1->BackWall->Brush->Image->Assign(Image1->Picture);
  Chart1->BackWall->Brush->Color = clGreen;
}
//---------------------------------------------------------------------------

void __fastcall TBackWallImage::CheckBox1Click(TObject *Sender)
{
  Chart1->BackWall->Transparent = (! CheckBox1->Checked);
}
//---------------------------------------------------------------------------

void __fastcall TBackWallImage::Button1Click(TObject *Sender)
{
  EditChartBrush(this,Chart1->BackWall->Brush);
}
//---------------------------------------------------------------------------

