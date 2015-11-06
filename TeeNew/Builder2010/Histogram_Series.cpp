//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Histogram_Series.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "StatChar"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
THistogramForm *HistogramForm;
//---------------------------------------------------------------------------
__fastcall THistogramForm::THistogramForm(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall THistogramForm::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(10);
  ButtonPen1->LinkPen(Series1->LinePen);
  ButtonPen2->LinkPen(Series1->LinesPen);
}
//---------------------------------------------------------------------------

