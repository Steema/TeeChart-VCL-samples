//---------------------------------------------------------------------------

#ifndef CustomersH
#define CustomersH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TTeeCustomers : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TTeeCustomers(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTeeCustomers *TeeCustomers;
//---------------------------------------------------------------------------
#endif
