//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Contour_Foot.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
#pragma resource "Footdata.res"

TContourFoot *ContourFoot;
//---------------------------------------------------------------------------
__fastcall TContourFoot::TContourFoot(TComponent* Owner)
  : TBaseForm(Owner)
{
  // define custom color palette

  ColorPalette[0]  = (TColor) 0x000000;
  ColorPalette[1]  = (TColor) 0xff0000;
  ColorPalette[2]  = (TColor) 0xff8000;
  ColorPalette[3]  = (TColor) 0xffc000;
  ColorPalette[4]  = (TColor) 0xffff00;
  ColorPalette[5]  = (TColor) 0xc0ff00;
  ColorPalette[6]  = (TColor) 0x80ff00;
  ColorPalette[7]  = (TColor) 0x00ff00;
  ColorPalette[8]  = (TColor) 0x00ff80;
  ColorPalette[9]  = (TColor) 0x00ffff;
  ColorPalette[10] = (TColor) 0x00dfff;
  ColorPalette[11] = (TColor) 0x00c0ff;
  ColorPalette[12] = (TColor) 0x00a0ff;
  ColorPalette[13] = (TColor) 0x0080ff;
  ColorPalette[14] = (TColor) 0x0060ff;
  ColorPalette[15] = (TColor) 0x0000ff;
}
//---------------------------------------------------------------------------
void __fastcall TContourFoot::AddDataToSeries(TCustom3DGridSeries *ASeries, AnsiString fname)
{
  TResourceStream *r = new TResourceStream((int)HInstance, "FOOTDATA", RT_RCDATA);
  try
  {
    r->ReadBuffer(FootScanArray,r->Size);
  }
  __finally
  {
    delete r;
  }

  ASeries->Clear();
  ASeries->BeginUpdate();
  try
  {

    byte val;
    for (int len=0; len<BIGPADLENGTH; len++)
      for (int wid=0; wid<BIGPADWIDTH; wid++)
      {
        val = FootScanArray[len][wid];
        ASeries->AddXYZ( wid+1, val, len+1 );
      }
  }
  __finally
  {
    ASeries->EndUpdate();
    ASeries->Repaint();
  }
}
//---------------------------------------------------------------------------
void __fastcall TContourFoot::InitContourSeries(TContourSeries *ASeries)
{
  ASeries->NumLevels = MAXPALETTESTEPS;
  ASeries->CreateAutoLevels();
  ASeries->AutomaticLevels = false;
  ASeries->Pen->Visible = true;
  ASeries->Pen->Width = 5;
  for (int i=0; i<ASeries->Levels->Count; i++)
  {
    ASeries->Levels->Items[i]->Color = ColorPalette[i];
    ASeries->Levels->Items[i]->UpToValue = i + 0.5;
  }
}
//---------------------------------------------------------------------------
void __fastcall TContourFoot::InitSeries(TCustom3DGridSeries *ASeries)
{
  ASeries->UsePalette = true;
  ASeries->UseColorRange = false;

  ASeries->ClearPalette();
  for (int t=0; t<MAXPALETTESTEPS; t++)
    ASeries->AddPalette(t+0.5,ColorPalette[t]);

  ASeries->Repaint();
}
//---------------------------------------------------------------------------
void __fastcall TContourFoot::FormCreate(TObject *Sender)
{
  AddDataToSeries(Series1,"FootData.bin");

  InitSeries(Series1);
  RadioGroup1->ItemIndex = 1;
  RadioGroup1Click(this);
}
//---------------------------------------------------------------------------

void __fastcall TContourFoot::RadioGroup1Click(TObject *Sender)
{
  TChartSeries *tmp = Chart1->Series[0];
  switch (RadioGroup1->ItemIndex)
  {
    case 0 :{
              ChangeSeriesType(tmp,__classid(TContourSeries));
              InitContourSeries(dynamic_cast<TContourSeries*>(Chart1->Series[0]));
            } break;
    case 1 :{
              ChangeSeriesType(tmp,__classid(TColorGridSeries));
              Chart1->Series[0]->Pen->Visible = false;
            } break;
  }
}
//---------------------------------------------------------------------------

