//---------------------------------------------------------------------------

#ifndef Bar_StackGroupH
#define Bar_StackGroupH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBarStackGroup : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TBarSeries *Series3;
        TBarSeries *Series4;
        TBarSeries *Series5;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarStackGroup(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarStackGroup *BarStackGroup;
//---------------------------------------------------------------------------
#endif
