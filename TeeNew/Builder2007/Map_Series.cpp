//---------------------------------------------------------------------------

#include <vcl.h>
#include <stdio.h>
#pragma hdrstop

#include "Map_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeChartActions"
#pragma link "TeeMapSeries"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TMapSeriesForm *MapSeriesForm;
//---------------------------------------------------------------------------
__fastcall TMapSeriesForm::TMapSeriesForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMapSeriesForm::AddShape(const int *X, int sizeX, const int *Y, int sizeY,
        TColor AColor, const AnsiString AText)
{
  TTeePolygon *pg = Series1->Shapes->Add(); // <-- add a new empty shape...
  // add the XY coordinates
  for (int t= 0; t<sizeX; t++) pg->AddXY(X[t],Y[t]);
  // the shape color...
  pg->Color = AColor;
  // the shape text...
  pg->Text = AText;
  // the shape Value (Z)...
  pg->Z = random(1000)/1000.0;
}
//---------------------------------------------------------------------------
void __fastcall TMapSeriesForm::AddSampleShapes()
{
  const int AX[14] = {1,3,4,4,5,5,6,6,4,3,2,1,2,2};
  const int AY[14] = {7,5,5,7,8,9,10,11,11,12,12,11,10,8};
  const int BX[9] = {5,7,8,8,7,6,5,4,4};
  const int BY[9] = {4,4,5,6,7,7,8,7,5};
  const int CX[16] = {9,10,11,11,12,9,8,7,6,6,5,5,6,7,8,8};
  const int CY[16] = {5,6,6,7,8,11,11,12,11,10,9,8,7,7,6,5};
  const int DX[8] = {12,14,15,14,13,12,11,11};
  const int DY[8] = {5,5,6,7,7,8,7,6};
  const int EX[11] = {4,6,7,7,6,6,5,4,3,3,2};
  const int EY[11] = {11,11,12,13,14,15,16,16,15,14,13};
  const int FX[12] = {7,8,9,11,10,8,7,6,5,5,6,6};
  const int FY[12] = {13,14,14,16,17,17,18,18,17,16,15,14};
  const int GX[12] = {10,12,12,14,13,11,9,8,7,7,8,9};
  const int GY[12] = {10,12,13,15,16,16,14,14,13,12,11,11};
  const int HX[10] = {17,19,18,18,17,15,14,13,15,16};
  const int HY[10] = {11,13,14,16,17,15,15,14,12,12};
  const int IX[15] = {15,16,17,16,15,14,14,13,12,11,10,11,12,13,14};
  const int IY[15] = {6,6,7,8,8,9,10,11,12,11,10,9,8,7,7};
  const int JX[12] = {15,16,16,17,17,16,15,13,12,12,14,14};
  const int JY[12] = {8,8,9,10,11,12,12,14,13,12,10,9};
  const int KX[10] = {17,19,20,20,19,17,16,16,17,16};
  const int KY[10] = {5,5,6,8,8,10,9,8,7,6};
  const int LX[7] = {19,20,21,21,19,17,17};
  const int LY[7] = {8,8,9,11,13,11,10};

  AddShape(AX,13, AY, 13,clLime,"A");
  AddShape(BX, 8, BY, 8, clRed, "B");
  AddShape(CX, 15, CY, 15, clFuchsia, "C");
  AddShape(DX, 7, DY, 7, clAqua, "D");
  AddShape(EX, 10, EY, 10,clSilver, "E");
  AddShape(FX, 11, FY, 11,clAqua, "F");
  AddShape(GX, 11,GY, 11, clGreen, "G");
  AddShape(HX, 9, HY, 9, clTeal, "H");
  AddShape(IX, 14, IY, 14, clWhite, "I");
  AddShape(JX, 11, JY, 11, clRed, "J");
  AddShape(KX, 9, KY, 9, clBlue, "K");
  AddShape(LX, 6, LY, 6,clYellow, "L");
}
//---------------------------------------------------------------------------
void __fastcall TMapSeriesForm::FormCreate(TObject *Sender)
{
  // Add some shapes...
  Series1->Clear();
  AddSampleShapes();

  // Set the color palette "strong"
  Series1->PaletteStyle = psStrong;

  // Marks...
  Series1->Marks->Bevel = bvRaised;
  Series1->Marks->Color = clSilver;

}
//---------------------------------------------------------------------------

void __fastcall TMapSeriesForm::CheckBox3Click(TObject *Sender)
{
  // change the color palette style...
  if (CheckBox3->Checked)
  {
    Series1->UsePalette = true;
    Series1->UseColorRange = false;
  }
  else Series1->UseColorRange = true;
}
//---------------------------------------------------------------------------





