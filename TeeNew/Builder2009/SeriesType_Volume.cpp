//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "SeriesType_Volume.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TVolumeForm *VolumeForm;
//---------------------------------------------------------------------------
__fastcall TVolumeForm::TVolumeForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TVolumeForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);

  ButtonPen1->LinkPen(Series1->Pen);
}
//---------------------------------------------------------------------------

void __fastcall TVolumeForm::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
}
//---------------------------------------------------------------------------

void __fastcall TVolumeForm::ButtonPen1Click(TObject *Sender)
{
  Series1->SeriesColor = Series1->Pen->Color;
}
//---------------------------------------------------------------------------

