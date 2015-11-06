//---------------------------------------------------------------------------

#ifndef Order_InfoH
#define Order_InfoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TOrderInfo : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TOrderInfo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOrderInfo *OrderInfo;
//---------------------------------------------------------------------------
#endif
 