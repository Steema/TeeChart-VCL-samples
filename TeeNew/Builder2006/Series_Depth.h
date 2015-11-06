//---------------------------------------------------------------------------

#ifndef Series_DepthH
#define Series_DepthH
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
#include "TeeComma.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TSeriesDepth : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TBarSeries *Series2;
        TLineSeries *Series3;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TCheckBox *CheckBox1;
        TTeeCommander *TeeCommander1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSeriesDepth(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesDepth *SeriesDepth;
//---------------------------------------------------------------------------
#endif
