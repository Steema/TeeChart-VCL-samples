//---------------------------------------------------------------------------

#ifndef Release6_FixedBugsH
#define Release6_FixedBugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TRelease6Fixed : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
private:	// User declarations
public:		// User declarations
  __fastcall TRelease6Fixed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelease6Fixed *Release6Fixed;
//---------------------------------------------------------------------------
#endif
