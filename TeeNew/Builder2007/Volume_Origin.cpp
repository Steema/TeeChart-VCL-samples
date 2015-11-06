//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Volume_Origin.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma resource "*.dfm"
TVolumeOrigin *VolumeOrigin;
//---------------------------------------------------------------------------
__fastcall TVolumeOrigin::TVolumeOrigin(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TVolumeOrigin::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(50);
}
//---------------------------------------------------------------------------

void __fastcall TVolumeOrigin::Edit1Change(TObject *Sender)
{
  Series1->YOrigin=UpDown1->Position;
}
//---------------------------------------------------------------------------

void __fastcall TVolumeOrigin::CheckBox1Click(TObject *Sender)
{
  Series1->UseYOrigin=CheckBox1->Checked;
  Edit1->Enabled=CheckBox1->Checked;
  UpDown1->Enabled=CheckBox1->Checked;
}
//---------------------------------------------------------------------------

