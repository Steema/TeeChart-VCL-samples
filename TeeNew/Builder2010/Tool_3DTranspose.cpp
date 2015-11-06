//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_3DTranspose.h"
#include <math.h>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TTransposeToolDemo *TransposeToolDemo;
//---------------------------------------------------------------------------
__fastcall TTransposeToolDemo::TTransposeToolDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTransposeToolDemo::Button1Click(TObject *Sender)
{
  Tool->Transpose();
}
//---------------------------------------------------------------------------
double __fastcall TTransposeToolDemo::GetXZValue(int x,int z)
{
  double res = 0.5*pow(cos(x/0.4),2)+
                 pow(cos(z/0.6),2)-
                 cos(z/15.0);
  return res;
}
//---------------------------------------------------------------------------
void __fastcall TTransposeToolDemo::FormCreate(TObject *Sender)
{
  // This code is optional.  It can be done at design-time.
  // Create tool
  Tool = new TGridTransposeTool(this);

  // Set Series
  Tool->Series = Series1;

  // Add to chart
  Chart1->Tools->Add(Tool);

  // Fill Series with sample values
  for (int z=1; z<30; z++)
    for (int x=1; x<20; x++)
      Series1->AddXYZ(x,GetXZValue(x,z),z);

}
//---------------------------------------------------------------------------

