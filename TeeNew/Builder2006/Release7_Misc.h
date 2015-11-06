//---------------------------------------------------------------------------

#ifndef Release7_MiscH
#define Release7_MiscH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TMiscVersion7 : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
private:	// User declarations
public:		// User declarations
  __fastcall TMiscVersion7(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMiscVersion7 *MiscVersion7;
//---------------------------------------------------------------------------
#endif
