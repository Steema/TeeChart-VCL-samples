//---------------------------------------------------------------------------

#ifndef Property_AliasesH
#define Property_AliasesH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TPropertyAliases : public TForm
{
__published:	// IDE-managed Components
    TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TPropertyAliases(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPropertyAliases *PropertyAliases;
//---------------------------------------------------------------------------
#endif
