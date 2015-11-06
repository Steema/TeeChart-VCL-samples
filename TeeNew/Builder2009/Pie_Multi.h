//---------------------------------------------------------------------------

#ifndef Pie_MultiH
#define Pie_MultiH
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
class TPieMultiple : public TBaseForm
{
__published:	// IDE-managed Components
        TPieSeries *Series1;
        TPieSeries *Series2;
        TPieSeries *Series3;
        TPieSeries *Series4;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Series1BeforeDrawValues(TObject *Sender);
        void __fastcall Series2BeforeDrawValues(TObject *Sender);
        void __fastcall Series3BeforeDrawValues(TObject *Sender);
        void __fastcall Series4BeforeDrawValues(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPieMultiple(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieMultiple *PieMultiple;
//---------------------------------------------------------------------------
#endif
