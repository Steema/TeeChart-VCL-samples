//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_AverageNulls.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma resource "*.dfm"
TAverageFunctionNulls *AverageFunctionNulls;
//---------------------------------------------------------------------------
__fastcall TAverageFunctionNulls::TAverageFunctionNulls(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAverageFunctionNulls::SetLabelAverage()
{
  double tmp = 0.0;
  int tmpCount = 0;
  // calculate the sum and number of points...
  for (int t=0; t< Series1->Count(); t++)
  {
    // consider or not null points...
    if (TeeFunction1->IncludeNulls || !Series1->IsNull(t))
    {
      tmp = tmp + Series1->YValues->Value[t];
      tmpCount ++;
    }
  }

  LabelAverage->Caption = FloatToStr(tmp)+" / "+
                        IntToStr(tmpCount)+" = "+
                        FloatToStr(tmp/tmpCount);
}
//---------------------------------------------------------------------------
void __fastcall TAverageFunctionNulls::CheckBox1Click(TObject *Sender)
{
  TeeFunction1->IncludeNulls = CheckBox1->Checked;

  SetLabelAverage();
}
//---------------------------------------------------------------------------

void __fastcall TAverageFunctionNulls::FormCreate(TObject *Sender)
{
  // Add some points and one null point...

  Series1->Clear();
  Series1->Add( 10 ,"One", clRed );
  Series1->Add( 20 ,"Two", clRed );
  Series1->AddNull("Three");
  Series1->Add( 40 ,"Four", clRed );
  Series1->Add( 50 ,"Five", clRed );

  Series1->Marks->Style = smsValue;

  SetLabelAverage();
}
//---------------------------------------------------------------------------

