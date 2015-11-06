//---------------------------------------------------------------------------

#ifndef Release7_FixedBugsH
#define Release7_FixedBugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TRelease7Fixed : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
private:	// User declarations
public:		// User declarations
  __fastcall TRelease7Fixed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelease7Fixed *Release7Fixed;
//---------------------------------------------------------------------------
#endif
