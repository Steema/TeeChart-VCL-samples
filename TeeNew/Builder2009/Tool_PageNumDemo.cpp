//---------------------------------------------------------------------------
#include <vcl.h>
#pragma hdrstop

#include "Tool_PageNumDemo.h"
#include "EditChar.hpp"
#include "TeeBrushDlg.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeNavigator"
#pragma link "TeeEdiGene"
#pragma resource "*.dfm"

TPageNumToolDemo *PageNumToolDemo;
TTeeCustomToolClass toolclass[1] = {__classid(TPageNumTool)};

//---------------------------------------------------------------------------
__fastcall TPageNumToolDemo::TPageNumToolDemo(TComponent* Owner)
        : TBaseForm(Owner)
{
}
__fastcall TPageNumToolDemo::~TPageNumToolDemo(void)
{
}
//---------------------------------------------------------------------------
void __fastcall TPageNumToolDemo::FormCreate(TObject *Sender)
{
  // RegisterTeeTools(toolclass,0);
  Series2->FillSampleValues(50);
  Series1->FillSampleValues(50);

  PageTool = new TPageNumTool(this);
  PageTool->ParentChart = Chart1;
  PageTool->Shape->Font->Color = clRed;
  PageTool->Shape->ShadowSize = 1;
  PageTool->Shape->ShadowColor = clDkGray;

  Edit1->Text = PageTool->Format;
}
//---------------------------------------------------------------------------

void __fastcall TPageNumToolDemo::Edit1Change(TObject *Sender)
{
  PageTool->Format = Edit1->Text;
}
//---------------------------------------------------------------------------

void __fastcall TPageNumToolDemo::ComboBox1Change(TObject *Sender)
{
  PageTool->Position = TAnnotationPosition(ComboBox1->ItemIndex);
}
//---------------------------------------------------------------------------

void __fastcall TPageNumToolDemo::Button1Click(TObject *Sender)
{
  EditChartTool(this,PageTool);
}
//---------------------------------------------------------------------------

void __fastcall TPageNumToolDemo::FormShow(TObject *Sender)
{
  ComboBox1->ItemIndex = 0;
}
//---------------------------------------------------------------------------


void __fastcall TPageNumToolDemo::FormDestroy(TObject *Sender)
{
  // UnRegisterTeeTools(toolclass,0);
}
//---------------------------------------------------------------------------

