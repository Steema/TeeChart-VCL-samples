//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tools_Nearest.h"
#include <EditChar.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TNearestToolDemo *NearestToolDemo;
//---------------------------------------------------------------------------
__fastcall TNearestToolDemo::TNearestToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TNearestToolDemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(6);
}
//---------------------------------------------------------------------------

void __fastcall TNearestToolDemo::CheckBox1Click(TObject *Sender)
{
  ChartTool1->Active = CheckBox1->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TNearestToolDemo::ComboBox1Change(TObject *Sender)
{
  switch (ComboBox1->ItemIndex)
  {
    case 0: ChartTool1->Style = hsNone; break;
    case 1: ChartTool1->Style = hsCircle; break;
    case 2: ChartTool1->Style = hsRectangle; break;
    case 3: ChartTool1->Style = hsDiamond; break;
  }
}
//---------------------------------------------------------------------------

void __fastcall TNearestToolDemo::CheckBox2Click(TObject *Sender)
{
  ChartTool1->DrawLine = CheckBox2->Checked;
}
//---------------------------------------------------------------------------

void __fastcall TNearestToolDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,ChartTool1);
}
//---------------------------------------------------------------------------

void __fastcall TNearestToolDemo::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 1;
}
//---------------------------------------------------------------------------

