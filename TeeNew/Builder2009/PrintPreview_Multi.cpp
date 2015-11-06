//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "PrintPreview_Multi.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePreviewPanel"
#pragma resource "*.dfm"
TPrintPreviewMulti *PrintPreviewMulti;
//---------------------------------------------------------------------------
__fastcall TPrintPreviewMulti::TPrintPreviewMulti(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPrintPreviewMulti::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(8);
  Series2->FillSampleValues(8);

  // change margins
  FirstChart->PrintProportional = false;
  SecondChart->PrintProportional = false;

  FirstChart->PrintMargins =Rect(2,2,60,60);
  SecondChart->PrintMargins =Rect(60,60,2,2);

  // add to preview
  TeePreviewPanel1->Panels->Add(FirstChart);
  TeePreviewPanel1->Panels->Add(SecondChart);
}
//---------------------------------------------------------------------------

void __fastcall TPrintPreviewMulti::CheckBox1Click(TObject *Sender)
{
  TeePreviewPanel1->Panels->Clear();
  if (CheckBox1->Checked) TeePreviewPanel1->Panels->Add(FirstChart);
  if (CheckBox2->Checked) TeePreviewPanel1->Panels->Add(SecondChart);
  TeePreviewPanel1->Repaint();
}
//---------------------------------------------------------------------------

void __fastcall TPrintPreviewMulti::ComboBox1Change(TObject *Sender)
{
  if (ComboBox1->ItemIndex == 0) TeePreviewPanel1->Orientation = ppoLandscape;
  else TeePreviewPanel1->Orientation = ppoPortrait;
}
//---------------------------------------------------------------------------

void __fastcall TPrintPreviewMulti::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------

