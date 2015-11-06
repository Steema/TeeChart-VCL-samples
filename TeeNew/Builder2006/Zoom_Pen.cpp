//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Zoom_Pen.h"
#include <TeeBrushDlg.hpp>
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma resource "*.dfm"
TZoomPen *ZoomPen;
//---------------------------------------------------------------------------
__fastcall TZoomPen::TZoomPen(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TZoomPen::FormCreate(TObject *Sender)
{
  Chart1->Zoom->Pen->Color = clWhite ;
  Chart1->Zoom->Brush->Style = bsSolid;
  Chart1->Zoom->Brush->Color = clBlue;

  ButtonPen1->LinkPen(Chart1->Zoom->Pen);

  Series1->FillSampleValues(200);
}
//---------------------------------------------------------------------------

void __fastcall TZoomPen::Button1Click(TObject *Sender)
{
  EditChartBrush(this,Chart1->Zoom->Brush);
}
//---------------------------------------------------------------------------

