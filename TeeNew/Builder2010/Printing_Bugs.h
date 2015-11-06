//---------------------------------------------------------------------------

#ifndef Printing_BugsH
#define Printing_BugsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TPrintingBugsForm : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TPrintingBugsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintingBugsForm *PrintingBugsForm;
//---------------------------------------------------------------------------
#endif
