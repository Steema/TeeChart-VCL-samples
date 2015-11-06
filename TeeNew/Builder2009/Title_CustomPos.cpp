//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Title_CustomPos.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base_CustomPos"
#pragma resource "*.dfm"
TTitleCustomPos *TitleCustomPos;
//---------------------------------------------------------------------------
__fastcall TTitleCustomPos::TTitleCustomPos(TComponent* Owner)
        : TBaseCustomPos(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TTitleCustomPos::CheckBox1Click(TObject *Sender)
{
  Chart1->Title->CustomPosition = CheckBox1->Checked;
  TrackBar1->Enabled = CheckBox1->Checked;
  TrackBar2->Enabled = CheckBox1->Checked;
}
//---------------------------------------------------------------------------
void __fastcall TTitleCustomPos::FormCreate(TObject *Sender)
{
  Chart1->Title->CustomPosition =true;
  Chart1->Title->Left = 90;
  Chart1->Title->Top = 80;

  TrackBar1->Position = Chart1->Title->Left;
  TrackBar2->Position = Chart1->Title->Top;
}
//---------------------------------------------------------------------------
void __fastcall TTitleCustomPos::TrackBar1Change(TObject *Sender)
{
  Chart1->Title->Left = TrackBar1->Position;
}
//---------------------------------------------------------------------------
void __fastcall TTitleCustomPos::TrackBar2Change(TObject *Sender)
{
  Chart1->Title->Top = TrackBar2->Position;
}
//---------------------------------------------------------------------------
