//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ChartEditor_PageNum.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeNavigator"
#pragma link "EditChar"
#pragma link "TeeEditCha"
#pragma link "TeeEdiGene"
#pragma resource "*.dfm"
TChartEditorPageNum *ChartEditorPageNum;
//---------------------------------------------------------------------------
__fastcall TChartEditorPageNum::TChartEditorPageNum(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TChartEditorPageNum::FormCreate(TObject *Sender)
{
  // fill 20 values...
  Series1->FillSampleValues(20);
  Series1->ColorEachPoint=true;

  // divide chart in 4 pages, 5 points per page
  Chart1->MaxPointsPerPage=5;
}
//---------------------------------------------------------------------------

void __fastcall TChartEditorPageNum::Button1Click(TObject *Sender)
{
  // show the Chart editor, starting at Paging tab...
  EditChartPage(this, Chart1, teeEditPagingPage);
}
//---------------------------------------------------------------------------

