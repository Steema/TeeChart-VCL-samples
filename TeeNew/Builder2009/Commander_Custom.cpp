//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Commander_Custom.h"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma link "Base"
#pragma link "TeeComma"
#pragma resource "*.dfm"
TCommanderCustom *CommanderCustom;
//---------------------------------------------------------------------------
__fastcall TCommanderCustom::TCommanderCustom(TComponent* Owner)
        : TBaseForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TCommanderCustom::FormCreate(TObject *Sender)
{
//  const TeeCommanderControls Buttons[]={ tcbRotate, tcbSeparator, tcb3D };
//  TeeCommander1->CreateControls(EXISTINGARRAY(Buttons));
}
//---------------------------------------------------------------------------


void __fastcall TCommanderCustom::ButtonClick(TObject *Sender)
{
  ShowMessage("Hello Custom Button !");
}

void __fastcall TCommanderCustom::FormShow(TObject *Sender)
{
  // add a new custom button to TeeCommander
  TSpeedButton *tmpButton=TeeCommander1->CreateButton(100, &ButtonClick, "Customize","",0);

  // set the custom button bitmap
  tmpButton->Glyph->Assign(SpeedButton1->Glyph);
  tmpButton->NumGlyphs=SpeedButton1->NumGlyphs; // 2 images in button
}
//---------------------------------------------------------------------------

