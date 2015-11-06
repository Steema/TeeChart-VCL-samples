//---------------------------------------------------------------------------

#ifndef Legend_FontColorH
#define Legend_FontColorH
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
class TLegendFontColor : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TPointSeries *Series1;
        TLineSeries *Series2;
        TLineSeries *Series3;
        TPointSeries *Series4;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendFontColor(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendFontColor *LegendFontColor;
//---------------------------------------------------------------------------
#endif
