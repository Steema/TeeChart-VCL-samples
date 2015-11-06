//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Chart_RoundPanel.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TChartRoundPanel *ChartRoundPanel;
//---------------------------------------------------------------------------
__fastcall TChartRoundPanel::TChartRoundPanel(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartRoundPanel::Edit1Change(TObject *Sender)
{
  Chart1->BorderRound = UpDown1->Position;
  CheckBox1->Enabled = UpDown1->Position>0;
  if (CheckBox1->Enabled) CheckBox1->Checked = false;
}
//---------------------------------------------------------------------------

void __fastcall TChartRoundPanel::FormCreate(TObject *Sender)
{
  ButtonPen1->LinkPen(Chart1->Border);
}
//---------------------------------------------------------------------------

void __fastcall TChartRoundPanel::CheckBox1Click(TObject *Sender)
{
  UpDown1->Position = 0;
  CheckBox1->Enabled = false;
}
//---------------------------------------------------------------------------

