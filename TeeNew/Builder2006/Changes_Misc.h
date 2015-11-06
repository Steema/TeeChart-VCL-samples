//---------------------------------------------------------------------------

#ifndef Changes_MiscH
#define Changes_MiscH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TChangesMisc : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TChangesMisc(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChangesMisc *ChangesMisc;
//---------------------------------------------------------------------------
#endif
