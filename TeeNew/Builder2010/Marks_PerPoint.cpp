//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Marks_PerPoint.h"
#include "TeeCustomShapeEditor.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TMarksPerPoint *MarksPerPoint;
//---------------------------------------------------------------------------
__fastcall TMarksPerPoint::TMarksPerPoint(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMarksPerPoint::Button2Click(TObject *Sender)
{
  // Remove custom marks (set all to default)
  Series1->Marks->Clear();
}
//---------------------------------------------------------------------------

void __fastcall TMarksPerPoint::Button1Click(TObject *Sender)
{
  EditTeeCustomShape(this,Series1->Marks->Item[UpDown1->Position]);
}
//---------------------------------------------------------------------------

void __fastcall TMarksPerPoint::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(7);

  // customize mark...
  TMarksItem *mark = Series1->Marks->Item[3];
  mark->Font->Size = 14;
  mark->Color = clSilver;
  // customize another mark...
  mark = Series1->Marks->Item[5];
  mark->Font->Size = 12;
  mark->Font->Color = clWhite;
  mark->Color = clNavy;
  mark->ShapeStyle = fosRoundRectangle;
  mark->Shadow->Size = 4;
  mark->Shadow->Transparency = 60;
  mark->Shadow->Color = clDkGray;

  UpDown1->Max = Series1->Count()-1;

  Label2->Caption = Series1->Labels->Labels[UpDown1->Position];
}
//---------------------------------------------------------------------------

void __fastcall TMarksPerPoint::Edit1Change(TObject *Sender)
{
  Label2->Caption = Series1->Labels->Labels[UpDown1->Position];
}
//---------------------------------------------------------------------------

