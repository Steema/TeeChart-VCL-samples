//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Surface_XYZFloat.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceFloatOther *SurfaceFloatOther;
//---------------------------------------------------------------------------
__fastcall TSurfaceFloatOther::TSurfaceFloatOther(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceFloatOther::FormCreate(TObject *Sender)
{
  Series1->IrregularGrid = true; // <-- IMPORTANT ! means X and Z are float
  for (int x=1;x<10;x++)
    for (int z=1;z<10;z++) Series1->AddXYZ( x/10.0, sqrt(x*z), z/5.0, "", clTeeColor);

  // set palette colors to "10, strong" ...
  Series1->UseColorRange = false;
  Series1->UsePalette = true;
  Series1->PaletteStyle = psStrong;
  Series1->PaletteSteps = 10;

  // adjust some axes properties...
  Chart1->DepthAxis->Visible = true;
  Chart1->DepthAxis->AxisValuesFormat ="0.#";
  Chart1->DepthAxis->Increment = 0.2;

  Chart1->BottomAxis->AxisValuesFormat = "0.#";
  Chart1->BottomAxis->Increment = 0.1;

  // visual properties...
  Chart1->Chart3DPercent =100;
  TView3DOptions *opt = Chart1->View3DOptions;
  opt->Orthogonal = false;
  opt->Perspective = 50;
  opt->Rotation = 327;
  opt->Elevation = 352;
  opt->Zoom =70;
}
//---------------------------------------------------------------------------

