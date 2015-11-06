//---------------------------------------------------------------------------

#ifndef Release502_FixedBugsH
#define Release502_FixedBugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TRelease502Fixed : public TForm
{
__published:	// IDE-managed Components
        TStringGrid *StringGrid1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TRelease502Fixed(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TRelease502Fixed *Release502Fixed;
//---------------------------------------------------------------------------
#endif
 