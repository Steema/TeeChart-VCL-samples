//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Axis_Items.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAxisItemsDemo *AxisItemsDemo;
//---------------------------------------------------------------------------
__fastcall TAxisItemsDemo::TAxisItemsDemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAxisItemsDemo::AddCustomLabels(void)
{
  TChartAxis *axis = Chart1->Axes->Left;
  axis->Items->Clear();  // remove all custom labels
  // add custom labels
  axis->Items->Add(123,"Hello")->Format->Font->Size = 16;
  axis->Items->Add(466,"Good \n Bye")->Format->Transparent = false;
  axis->Items->Add(300);
  TAxisItem *axislabel = axis->Items->Add(-100);
  axislabel->Format->Transparent = false;
  axislabel->Format->Transparency = 50;
  axislabel->Format->Color = clBlue;
}
//---------------------------------------------------------------------------
void __fastcall TAxisItemsDemo::SetDemoControls(void)
{
  UpDown1->Enabled = Chart1->Axes->Left->Items->Count > 0;

  if (UpDown1->Enabled) UpDown1->Max = Chart1->Axes->Left->Items->Count-1;

  UpDown2->Enabled = UpDown1->Enabled;
  Edit1->Enabled = UpDown1->Enabled;
  Edit2->Enabled = UpDown1->Enabled;
  Button1->Enabled = UpDown1->Enabled;
}
//---------------------------------------------------------------------------
void __fastcall TAxisItemsDemo::FormCreate(TObject *Sender)
{
  double vals[8] = {200,0,123,300,260,-100,650,400};
  Series1->AddArray(vals,8);
  AddCustomLabels();
  SetDemoControls();
  UpDown2->Position = 123;
}
//---------------------------------------------------------------------------

void __fastcall TAxisItemsDemo::CheckBox1Click(TObject *Sender)
{
  if (CheckBox1->Checked) AddCustomLabels();
  else Chart1->Axes->Left->Items->Clear();

  SetDemoControls();
}
//---------------------------------------------------------------------------

void __fastcall TAxisItemsDemo::Edit1Change(TObject *Sender)
{
  if (Showing) Edit2->Text = FloatToStr(Chart1->Axes->Left->Items->Item[UpDown1->Position]->Value);

}
//---------------------------------------------------------------------------

void __fastcall TAxisItemsDemo::Edit2Change(TObject *Sender)
{
  if (Showing)
  {
    TAxisItem *axlab = Chart1->Axes->Left->Items->Item[UpDown1->Position];
    axlab->Value = StrToFloatDef(Edit2->Text,axlab->Value);
  }
}
//---------------------------------------------------------------------------

