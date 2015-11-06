//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "TeeChartWizardDemo.h"
#pragma link "TeeExpForm"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TChartWizardDemo *ChartWizardDemo;
//---------------------------------------------------------------------------
__fastcall TChartWizardDemo::TChartWizardDemo(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------

void __fastcall TChartWizardDemo::FormShow(TObject *Sender)
{
  TTeeDlgWizard *f=new TTeeDlgWizard(this);
  f->BorderStyle=bsNone;
  f->BorderIcons.Clear();
  f->CancelBtn->Visible=false;
  f->HelpButton->Visible=false;
  f->Position=poDefault;
  f->Align=alClient;
  f->Parent=this;
  f->Show();
}
//---------------------------------------------------------------------------
