//---------------------------------------------------------------------------

#ifndef Release503_FixedBugsH
#define Release503_FixedBugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TRelease503Fixed : public TForm
{
__published:	// IDE-managed Components
        TStringGrid *StringGrid1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRelease503Fixed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelease503Fixed *Release503Fixed;
//---------------------------------------------------------------------------
#endif
