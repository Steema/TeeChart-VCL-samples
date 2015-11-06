//---------------------------------------------------------------------------

#ifndef Release6_MiscH
#define Release6_MiscH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TMiscVersion6 : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
private:	// User declarations
public:		// User declarations
  __fastcall TMiscVersion6(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMiscVersion6 *MiscVersion6;
//---------------------------------------------------------------------------
#endif
