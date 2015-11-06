//---------------------------------------------------------------------------

#include <vcl.h>
#include <TeeBrushDlg.hpp>
#pragma hdrstop

#include "Brush_Styles.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TBrushStyleForm *BrushStyleForm;
//---------------------------------------------------------------------------
__fastcall TBrushStyleForm::TBrushStyleForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBrushStyleForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  GetTeeBrush(0,SpeedButton1->Glyph);
  GetTeeBrush(1,SpeedButton2->Glyph);
  GetTeeBrush(2,SpeedButton3->Glyph);
  GetTeeBrush(3,SpeedButton4->Glyph);
  GetTeeBrush(4,SpeedButton5->Glyph);
  GetTeeBrush(5,SpeedButton6->Glyph);
  GetTeeBrush(6,SpeedButton7->Glyph);
  GetTeeBrush(7,SpeedButton8->Glyph);
  GetTeeBrush(8,SpeedButton9->Glyph);
  GetTeeBrush(9,SpeedButton10->Glyph);
  GetTeeBrush(10,SpeedButton11->Glyph);
  GetTeeBrush(11,SpeedButton12->Glyph);

}
//---------------------------------------------------------------------------

void __fastcall TBrushStyleForm::SpeedButton1Click(TObject *Sender)
{
  Series1->BarBrush->Image->Assign(dynamic_cast<TSpeedButton*>(Sender)->Glyph);
}
//---------------------------------------------------------------------------

void __fastcall TBrushStyleForm::Button1Click(TObject *Sender)
{
  EditChartBrush(this,Series1->BarBrush);
}
//---------------------------------------------------------------------------

