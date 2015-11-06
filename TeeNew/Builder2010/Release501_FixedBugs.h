//---------------------------------------------------------------------------

#ifndef Release501_FixedBugsH
#define Release501_FixedBugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TRelease501Fixed : public TForm
{
__published:	// IDE-managed Components
        TStringGrid *StringGrid1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRelease501Fixed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelease501Fixed *Release501Fixed;
//---------------------------------------------------------------------------
#endif
 