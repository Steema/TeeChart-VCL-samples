//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "BackWall_Gradient.h"
#include <TeeEdiGrad.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBackWallGradient *BackWallGradient;
//---------------------------------------------------------------------------
__fastcall TBackWallGradient::TBackWallGradient(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBackWallGradient::CheckBox1Click(TObject *Sender)
{
  Chart1->BackWall->Gradient->Visible = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TBackWallGradient::Button1Click(TObject *Sender)
{
  EditTeeGradient(this,Chart1->BackWall->Gradient,false);
}
//---------------------------------------------------------------------------

void __fastcall TBackWallGradient::CheckBox2Click(TObject *Sender)
{
  Timer1->Enabled = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TBackWallGradient::FormCreate(TObject *Sender)
{
  DeltaR = 1;
  DeltaE = 1;
}
//---------------------------------------------------------------------------

void __fastcall TBackWallGradient::Timer1Timer(TObject *Sender)
{
  Timer1->Enabled = false;

  TView3DOptions *Opt = Chart1->View3DOptions;
  Opt->Rotation = Opt->Rotation + DeltaR;
  if (Opt->Rotation > 358 || Opt->Rotation < 272) DeltaR = - DeltaR;
  Opt->Elevation = Opt->Elevation + DeltaE;
  if (Opt->Elevation > 358 || Opt->Elevation < 272) DeltaE = - DeltaE;

  Timer1->Enabled =true;
}
//---------------------------------------------------------------------------

