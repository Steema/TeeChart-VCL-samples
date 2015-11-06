//---------------------------------------------------------------------------

#include <vcl.h>
#include <math.h>
#pragma hdrstop

#include "Surface_Hole.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "TeeComma"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TSurfaceHolesForm *SurfaceHolesForm;
//---------------------------------------------------------------------------
__fastcall TSurfaceHolesForm::TSurfaceHolesForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TSurfaceHolesForm::BitBtn1Click(TObject *Sender)
{
  double tmp;

  CheckBox1->Enabled = true;
  Series1->Clear();
  for (int x = 1; x<11; x++)
    for (int z = 1; z<11; z++)
    {
      tmp = cos(x/10.0)*sin(z/10.0);
      Series1->AddXYZ( x, tmp, z, "", clTeeColor );
    }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceHolesForm::BitBtn2Click(TObject *Sender)
{
  double tmp;

  CheckBox1->Enabled = true;
  Series1->Clear();
  for (int x=1; x<11; x++)
    for (int z=1; z<11; z++)
    {
      tmp = cos(x/10.0)*sin(z/10.0);
      // apply hole at cells (5,5) to (6,6)
      if ((x==5 || x==6) && (z==5 || z==6)) Series1->AddXYZ( x, tmp, z, "", clNone );  // <-- NULL cell
      else Series1->AddXYZ( x, tmp, z, "", clTeeColor );
    }
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceHolesForm::FormCreate(TObject *Sender)
{
  Angle = 0;
  Delta3D = 1;
  Series1->NumXValues = 10;
  Series1->NumZValues = 10;
  Chart1->LeftAxis->Increment = 0.1;
  Chart1->BottomAxis->Increment = 1.0;
  Chart1->BottomAxis->LabelsSeparation = 0;
  Chart1->DepthAxis->Visible = true;
  Chart1->DepthAxis->Increment = 1.0;
  BitBtn2Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceHolesForm::Timer1Timer(TObject *Sender)
{
  Angle += 5;
  if (Angle>359) Angle = 0;
  Chart1->Chart3DPercent += Delta3D;
  if (Chart1->Chart3DPercent < 5 || Chart1->Chart3DPercent>60) Delta3D = -Delta3D;

  TChartValueList *vals = Series1->XValues;
  double tmpX = sin(Angle*M_PI/180.0);
  Chart1->BottomAxis->SetMinMax(vals->MinValue-tmpX,vals->MaxValue-tmpX);

  vals = Series1->YValues;
  double tmpY = cos(Angle*M_PI/180.0)*((vals->MaxValue-vals->MinValue)/10.0);
  Chart1->LeftAxis->SetMinMax(vals->MinValue-tmpY,vals->MaxValue-tmpY);
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceHolesForm::CheckBox1Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TSurfaceHolesForm::CheckBox2Click(TObject *Sender)
{
  Chart1->BackWall->Transparent = !CheckBox2->Checked;
}
//---------------------------------------------------------------------------

