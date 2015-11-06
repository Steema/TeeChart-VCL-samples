//---------------------------------------------------------------------------

#ifndef Gallery_AlternateH
#define Gallery_AlternateH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeGalleryAlternate.hpp"
#include "TeePenDlg.hpp"
//---------------------------------------------------------------------------
class TGalleryAlternate : public TForm
{
__published:	// IDE-managed Components
  void __fastcall FormShow(TObject *Sender);
  void __fastcall FormDestroy(TObject *Sender);
private:	// User declarations
public:		// User declarations
    TTeeGalleryForm *Gallery;
  __fastcall TGalleryAlternate(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGalleryAlternate *GalleryAlternate;
//---------------------------------------------------------------------------
#endif
