//---------------------------------------------------------------------------

#ifndef Changes_PackageH
#define Changes_PackageH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TChangesPackage : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TChangesPackage(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChangesPackage *ChangesPackage;
//---------------------------------------------------------------------------
#endif
