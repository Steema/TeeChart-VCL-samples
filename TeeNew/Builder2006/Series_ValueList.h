//---------------------------------------------------------------------------

#ifndef Series_ValueListH
#define Series_ValueListH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "Base.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDynArrays : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TFastLineSeries *Series1;
        TLabel *Label1;
        TEdit *Edit1;
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDynArrays(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDynArrays *DynArrays;
//---------------------------------------------------------------------------
#endif
