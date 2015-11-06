//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Function_PVO.h"
#include "EditChar.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "CandleCh"
#pragma link "TeePVOFunction"
#pragma resource "*.dfm"
TPVOFuncdemo *PVOFuncdemo;
//---------------------------------------------------------------------------
__fastcall TPVOFuncdemo::TPVOFuncdemo(TComponent* Owner)
  : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TPVOFuncdemo::Button1Click(TObject *Sender)
{
  EditSeriesDataSource(this,Series2);
}
//---------------------------------------------------------------------------

void __fastcall TPVOFuncdemo::FormCreate(TObject *Sender)
{
  Series1->FillSampleValues(100);
}
//---------------------------------------------------------------------------

