//---------------------------------------------------------------------------

#ifndef Histogram_TransparencyH
#define Histogram_TransparencyH
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
#include "StatChar.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class THistogramTransp : public TBaseForm
{
__published:	// IDE-managed Components
    THistogramSeries *Series1;
    THistogramSeries *Series2;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THistogramTransp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THistogramTransp *HistogramTransp;
//---------------------------------------------------------------------------
#endif
