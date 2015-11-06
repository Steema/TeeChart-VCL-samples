//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Tool_AnnotationClick.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TAnnotationClickForm *AnnotationClickForm;
//---------------------------------------------------------------------------
__fastcall TAnnotationClickForm::TAnnotationClickForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TAnnotationClickForm::ChartTool1Click(TAnnotationTool *Sender,
      TMouseButton Button, TShiftState Shift, int X, int Y)
{
  ShowMessage(Sender->Text);
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationClickForm::FormCreate(TObject *Sender)
{
  ChartTool1->Cursor = crHandPoint;
  ChartTool2->Cursor = crCross;
  ChartTool3->Cursor = crHandPoint;

  Label1->Caption = "";
}
//---------------------------------------------------------------------------

void __fastcall TAnnotationClickForm::Chart1MouseMove(TObject *Sender,
      TShiftState Shift, int X, int Y)
{
  if (ChartTool1->Clicked(X,Y)) Label1->Caption = ChartTool1->Text;
  else if (ChartTool2->Clicked(X,Y)) Label1->Caption = ChartTool2->Text;
  else if (ChartTool3->Clicked(X,Y)) Label1->Caption = ChartTool3->Text;
  else Label1->Caption = "";
}
//---------------------------------------------------------------------------

