//---------------------------------------------------------------------------

#ifndef Chart_OtherH
#define Chart_OtherH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
//---------------------------------------------------------------------------
class TChartOther : public TForm
{
__published:	// IDE-managed Components
        TMemo *Memo1;
private:	// User declarations
public:		// User declarations
        __fastcall TChartOther(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartOther *ChartOther;
//---------------------------------------------------------------------------
#endif
