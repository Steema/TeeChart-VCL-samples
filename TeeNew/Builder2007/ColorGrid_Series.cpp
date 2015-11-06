//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "ColorGrid_Series.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeePenDlg"
#pragma link "TeeSurfa"
#pragma resource "*.dfm"
TColorGrid *ColorGrid;
//---------------------------------------------------------------------------
__fastcall TColorGrid::TColorGrid(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TColorGrid::SetGridControls()
{
  CheckBox1->Checked = Series1->Pen->Visible;
  ButtonPen1->Enabled = Series1->Pen->Visible;
}
//---------------------------------------------------------------------------
void __fastcall TColorGrid::CheckBox1Click(TObject *Sender)
{
  Series1->Pen->Visible = CheckBox1->Checked;
  ButtonPen1->Enabled = Series1->Pen->Visible;
}
//---------------------------------------------------------------------------

void __fastcall TColorGrid::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(20);

  ButtonPen1->LinkPen(Series1->Pen);
  ButtonPen1->Enabled = Series1->Pen->Visible;

  Series1->Pen->Color = clWhite;
  Series1->UsePalette = true;
  Series1->UseColorRange = false;
}
//---------------------------------------------------------------------------

void __fastcall TColorGrid::Button1Click(TObject *Sender)
{
  EditSeries(this,Series1);
  SetGridControls();
}
//---------------------------------------------------------------------------

void __fastcall TColorGrid::ButtonPen1Click(TObject *Sender)
{
  SetGridControls();
}
//---------------------------------------------------------------------------

void __fastcall TColorGrid::Edit1Change(TObject *Sender)
{
  if (this->Showing)
  {
    Series1->FillSampleValues(UpDown1->Position);
    if (UpDown1->Position > 30)
    {
      CheckBox1->Checked = false;
      Series1->Pen->Visible = false;
    }
  }
}
//---------------------------------------------------------------------------

