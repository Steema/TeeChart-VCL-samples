//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop

#include "Export_Metafile.h"
#include "Clipbrd.hpp"
//---------------------------------------------------------------------------
#pragma package(smart_init)
#pragma resource "*.dfm"
TMetafileForm *MetafileForm;
//---------------------------------------------------------------------------
__fastcall TMetafileForm::TMetafileForm(TComponent* Owner)
        : TForm(Owner)
{
}
//---------------------------------------------------------------------------
void __fastcall TMetafileForm::FormCreate(TObject *Sender)
{
  BarSeries1->FillSampleValues(8);  // <-- some sample random bars
}
//---------------------------------------------------------------------------

void __fastcall TMetafileForm::BitBtn3Click(TObject *Sender)
{
  // This code copies Chart contents onto Windows Clipboard in Metafile Format
  /*    TeeClipWhenMetafiling:=True;  <--- FORCE CLIPPING WITH METAFILES
        CLIPPING WORKS FINE BUT DO NOT ALLOW MOVEABLE OR RESIZEABLE METAFILES
  */

  Chart1->CopyToClipboardMetafile(true);  // <--- Enhanced Metafile = true

  ShowMessage(AnsiString("Chart1 is now at Windows Clipboard in Metafile format.\n")+
              AnsiString("and will now be pasted HERE !"));
  // Now PASTE!
  Image1->Picture->Assign(Clipboard());
  Image1->Refresh();


}
//---------------------------------------------------------------------------

void __fastcall TMetafileForm::BitBtn2Click(TObject *Sender)
{
  // This button asks a filename and saves the Chart
  if (SaveDialog1->Execute())
  {
   // SAVE IT !!
   /*  CLIPPING WORKS FINE BUT DO NOT ALLOW MOVEABLE OR RESIZEABLE METAFILES
       TO FORCE CLIPPING WITH METAFILES UNCOMMENT THIS LINE:
   */
   // TeeClipWhenMetafiling = true;

   Chart1->SaveToMetafile(SaveDialog1->FileName);

   // THIS METHOD CAN BE USED TOO:
   /*
   Chart1->SaveToMetafileRect( SaveDialog1->FileName,
      Rect( 0,0, floor(21*37.8), floor(10*37.8)));
   //  this equals to 96 * 21 / 2.54 , 96 * 10 /2.54 )
   */

   // now it's loaded HERE !
   Image1->Picture->LoadFromFile(SaveDialog1->FileName);
   Image1->Refresh();
  }
}
//---------------------------------------------------------------------------

