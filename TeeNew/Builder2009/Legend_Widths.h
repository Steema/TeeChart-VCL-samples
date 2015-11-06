//---------------------------------------------------------------------------

#ifndef Legend_WidthsH
#define Legend_WidthsH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendWidths : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TLabel *Label1;
        TLabel *Label2;
        TEdit *Edit1;
        TEdit *Edit2;
        TUpDown *UpDown1;
        TUpDown *UpDown2;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendWidths(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendWidths *LegendWidths;
//---------------------------------------------------------------------------
#endif
