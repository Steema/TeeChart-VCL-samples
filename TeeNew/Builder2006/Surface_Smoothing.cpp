//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Surface_Smoothing.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeOpenGL"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceSmoothing *SurfaceSmoothing;
//---------------------------------------------------------------------------
__fastcall TSurfaceSmoothing::TSurfaceSmoothing(TComponent* Owner)
  : TBaseForm(Owner)
{
  // Create a Surface with a small number of cells:
  Series1->FillSampleValues(5);   // 5 x 5 surface grid

  // Remove surface grid lines (they disturb when the surface has lots of cells)
  Series1->Pen->Hide();

  // Some speed tricks:
  Chart1->Axes->FastCalc = true;  // speed trick
  Series1->FastBrush = true; // speed trick (XP,2000 and 2003 only)
}
//---------------------------------------------------------------------------
void __fastcall SmoothGrid3D(TCustom3DGridSeries *Series)
{
  Series->BeginUpdate();
  try
  {
    double tmpX, tmpY, tmpZ;
    int tmpNumX = Series->NumXValues;
    int tmpNumZ = Series->NumZValues;
    for (int x=1; x<tmpNumX; x++)
    {
      for (int z=1; z<tmpNumZ; z++)
      {
        tmpX = 0.5*(Series->XValues->Value[Series->GridIndex[x][z]]+
          Series->XValues->Value[Series->GridIndex[x+1][z]]);

        tmpZ = 0.5*(Series->ZValues->Value[Series->GridIndex[x][z]]+
          Series->XValues->Value[Series->GridIndex[x][z+1]]);

        tmpY = 2*Series->YValues->Value[Series->GridIndex[x][z]];
        tmpY += Series->YValues->Value[Series->GridIndex[x+1][z]];
        tmpY += Series->YValues->Value[Series->GridIndex[x][z+1]];
        tmpY *= 0.25;
        Series->AddXYZ(tmpX,tmpY,tmpZ);

        Series->AddXYZ(Series->XValues->Value[Series->GridIndex[x][z]],
          0.5*(Series->YValues->Value[Series->GridIndex[x][z]]+
           Series->XValues->Value[Series->GridIndex[x][z+1]]),
           tmpZ);

        Series->AddXYZ( tmpX,
                (Series->YValues->Value[Series->GridIndex[x][z]]+ Series->YValues->Value[Series->GridIndex[x+1][z]] )*0.5,
                 Series->ZValues->Value[Series->GridIndex[x][z]]);
      }

      Series->AddXYZ((Series->XValues->Value[Series->GridIndex[x][tmpNumZ]]+Series->XValues->Value[Series->GridIndex[x+1][tmpNumZ]])*0.5,
                ( Series->YValues->Value[Series->GridIndex[x][tmpNumZ]]+ Series->YValues->Value[Series->GridIndex[x+1][tmpNumZ]] )*0.5,
                Series->ZValues->Value[Series->GridIndex[x][tmpNumZ]]);
    }

    for (int z=1; z<tmpNumZ; z++)
    {
      Series->AddXYZ(Series->XValues->Value[Series->GridIndex[tmpNumX][z]],
        (Series->YValues->Value[Series->GridIndex[tmpNumX][z]]+
          Series->YValues->Value[Series->GridIndex[tmpNumX][z+1]] )*0.5,
        ( Series->ZValues->Value[Series->GridIndex[tmpNumX][z]] +
          Series->ZValues->Value[Series->GridIndex[tmpNumX][z+1]] )*0.5);
    }

    Series->IrregularGrid = true;
  }
  __finally
  {
    Series->EndUpdate();
    Series->Repaint();
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSmoothing::Button1Click(TObject *Sender)
{
  // Smooth the surface !

  SmoothGrid3D(Series1);

  // Now re-calculate NumX and NumX to display at Label1.Caption
  Series1->FillGridIndex();

  // For more speed, set reuse
  Series1->ReuseGridIndex = CheckBox2->Checked;

  // Display new grid size at Label1
  Label1->Caption = "Grid size = "+
                        IntToStr(Series1->NumXValues)+" x "+
                        IntToStr(Series1->NumZValues);

}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSmoothing::CheckBox1Click(TObject *Sender)
{
  TeeOpenGL1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceSmoothing::CheckBox2Click(TObject *Sender)
{
  // For more speed, lets disable items:

  Chart1->AxisVisible = !CheckBox2->Checked;
  Chart1->Legend->Visible = !CheckBox2->Checked;
  Chart1->Title->Visible = !CheckBox2->Checked;


  if (CheckBox2->Checked) Chart1->BevelOuter = bvNone;
  else Chart1->BevelOuter = bvRaised;

  Chart1->ClipPoints = !CheckBox2->Checked;

  Chart1->Walls->Bottom->Transparent = CheckBox2->Checked;

  if (CheckBox2->Checked) Chart1->Walls->Size = 0;
  else Chart1->Walls->Size = 5;

  // Speed trick, as we know Surface data will not be modified anymore:
  Series1->ReuseGridIndex = CheckBox2->Checked;

  // "Palette" color mode is faster than "Range"
  Series1->UsePalette = CheckBox2->Checked;
  Series1->UseColorRange = !CheckBox2->Checked;
}
//---------------------------------------------------------------------------


