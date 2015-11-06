//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_DownSampling.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TDownSampling *DownSampling;
//---------------------------------------------------------------------------
__fastcall TDownSampling::TDownSampling(TComponent* Owner)
  : TBaseForm(Owner)
{
  // create and connect downsample function to series 2
  Series1->FillSampleValues(200);

  ComboBox1->ItemIndex = 0;

  DownSampleFun = new TDownSamplingFunction(Chart1);
  Series2->SetFunction(DownSampleFun);

  DownSampleFun->Tolerance  = 4;
  DownSampleFun->DownSampleMethod = dsAverage;

  Series2->DataSource = Series1;
}
//---------------------------------------------------------------------------
void __fastcall TDownSampling::ComboBox1Change(TObject *Sender)
{
  DownSampleFun->DownSampleMethod = (TDownSampleMethod)ComboBox1->ItemIndex;
  Label4->Caption = "Number of reduced points: "+IntToStr(DownSampleFun->ReducedSize);

}
//---------------------------------------------------------------------------

void __fastcall TDownSampling::Edit1Change(TObject *Sender)
{
  int NumPoints = StrToIntDef(Edit1->Text,200);
  Series1->FillSampleValues(NumPoints);
  UpDown1->Position = NumPoints;
  Series2->Clear();
  Label4->Caption = "";
}
//---------------------------------------------------------------------------


void __fastcall TDownSampling::Edit2Change(TObject *Sender)
{
  DownSampleFun->Tolerance = StrToIntDef(Edit2->Text,4);
  UpDown2->Position = (int)DownSampleFun->Tolerance;
  Label4->Caption = "Number of reduced points: "+IntToStr(DownSampleFun->ReducedSize);
}
//---------------------------------------------------------------------------

void __fastcall TDownSampling::Button1Click(TObject *Sender)
{
  Series2->CheckDataSource();
  Label4->Caption = "Number of reduced points: "+IntToStr(DownSampleFun->ReducedSize);
}
//---------------------------------------------------------------------------

void __fastcall TDownSampling::FormShow(TObject *Sender)
{
  Series2->CheckDataSource();
  Label4->Caption = "Number of reduced points: "+IntToStr(DownSampleFun->ReducedSize);
}
//---------------------------------------------------------------------------

