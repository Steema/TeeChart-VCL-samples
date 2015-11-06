/* The SurfaceSeries can now accept XYZ floating point values.

  The "grid" of cells defined by X and Z dimensions is still
  used, but now the X and Z values do not need to be rounded
  integers.

  To distinguish between a normal integer "grid" and this new
  code, the following property must be set to TRUE:

    SurfaceSeries1.IrregularGrid:=True;

    This must be done before adding points to the series.
*/
//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Surface_Irregular.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TSurfaceFloat *SurfaceFloat;
double *xval;
double *zval;
//---------------------------------------------------------------------------
__fastcall TSurfaceFloat::TSurfaceFloat(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceFloat::FormCreate(TObject *Sender)
{
  xval = new double[10];
  zval = new double[10];
  double y;
  Series1->IrregularGrid = true;   // <---------- VERY IMPORTANT !!!

  Series1->GetVertAxis->SetMinMax(-2,2);  // axis scale for Y values
  // Arrays of X and Z values with sample points...
  // The values have floating point decimals and define an irregular grid

  xval[0] = 0.1;
  xval[1] = 0.2;
  xval[2] = 0.3;
  xval[3] = 0.5;
  xval[4] = 0.8;
  xval[5] = 1.1;
  xval[6] = 1.5;
  xval[7] = 2.0;
  xval[8] = 2.2;
  xval[9] = 3.0;
  zval[0] = 0.5;
  zval[1] = 0.6;
  zval[2] = 0.7;
  zval[3] = 0.75;
  zval[4] = 0.8;
  zval[5] = 1.1;
  zval[6] = 1.5;
  zval[7] = 2.0;
  zval[8] = 2.2;
  zval[9] = 5.6;
  // Now add all "Y" points...
  Series1->Clear();

  // An irregular grid of 10 x 10 cells
  Series1->NumXValues = 10;
  Series1->NumZValues = 10;

  for (int x=0;x<9;x++) // = 10 rows
    for (int z=0;z<9;z++) // = 10 columns
    {
      y =sin(z*M_PI/10.0)*cos(x*M_PI/5.0);  // example Y value
      Series1->AddXYZ(xval[x],y,zval[z], "", clTeeColor);
    }

}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFloat::CheckBox1Click(TObject *Sender)
{
  Series1->IrregularGrid = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFloat::CheckBox2Click(TObject *Sender)
{
  if (CheckBox2->Checked)
  {
    Chart1->View3DOptions->Elevation = 270;
    Chart1->View3DOptions->Rotation = 360;
  }
  else
  {
    Chart1->View3DOptions->Elevation = 345;
    Chart1->View3DOptions->Rotation = 345;
  }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceFloat::FormDestroy(TObject *Sender)
{
  delete [] xval;
  delete [] zval;
}
//---------------------------------------------------------------------------

