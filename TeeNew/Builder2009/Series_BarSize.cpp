//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Series_BarSize.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeTools"
#pragma resource "*.dfm"
TBarSizeSeriesForm *BarSizeSeriesForm;
//---------------------------------------------------------------------------
__fastcall TBarSizeSeriesForm::TBarSizeSeriesForm(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TBarSizeSeriesForm::RefreshAnnotation(void)
{
  ChartTool1->Text = IntToStr(UpDown1->Position);
  ChartTool1->Shape->Top = Chart1->Height-28;
  ChartTool1->Shape->Left = Series1->CalcXPosValue(Series1->XValues->Items[UpDown1->Position])-8;
}
//---------------------------------------------------------------------------
void __fastcall TBarSizeSeriesForm::FormCreate(TObject *Sender)
{
  Series1 = new TBarSizeSeries(this);
  Series1->ParentChart = Chart1;
  Series1->FillSampleValues(5);
  Series1->Marks->Visible = false;
  Series1->Cursor = crHandPoint;

  Series1->SizeValues->Items[0] = 0.4;
  Series1->SizeValues->Items[2] = 0.1;
  Series1->SizeValues->Items[4] = 1.1;

  Series1->XValues->Items[3] = 2.8;

  Series1->ValueColor[1] = clBlue;
  Series1->ValueColor[4] = clYellow;

  ScrollBar1->Max = Series1->Count()*100;
  ScrollBar1->Min = -ScrollBar1->Max;

  UpDown1->Max = Series1->Count()-1;
}
//---------------------------------------------------------------------------

void __fastcall TBarSizeSeriesForm::ScrollBar1Change(TObject *Sender)
{
  Series1->XValues->Items[UpDown1->Position] = ScrollBar1->Position/100.0;
  Series1->Repaint();
  Label4->Caption = FormatFloat("0.##",Series1->XValues->Items[UpDown1->Position]);

  RefreshAnnotation();
}
//---------------------------------------------------------------------------

void __fastcall TBarSizeSeriesForm::ScrollBar2Change(TObject *Sender)
{
  Series1->SizeValues->Items[UpDown1->Position] = ScrollBar2->Position/100.0;
  Series1->Repaint();
  Label5->Caption = FormatFloat("0.##",Series1->SizeValues->Items[UpDown1->Position]);
}
//---------------------------------------------------------------------------

void __fastcall TBarSizeSeriesForm::Edit1Change(TObject *Sender)
{
  ScrollBar1->Position = Series1->XValues->Items[UpDown1->Position]*100;
  ScrollBar2->Position = Series1->SizeValues->Items[UpDown1->Position]*100;

  RefreshAnnotation();
}
//---------------------------------------------------------------------------

void __fastcall TBarSizeSeriesForm::Chart1ClickSeries(TCustomChart *Sender,
      TChartSeries *Series, int ValueIndex, TMouseButton Button,
      TShiftState Shift, int X, int Y)
{
  if (ValueIndex>=0) UpDown1->Position = ValueIndex;
}
//---------------------------------------------------------------------------

