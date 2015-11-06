//---------------------------------------------------------------------------

#ifndef SeriesType_ClockH
#define SeriesType_ClockH
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
#include "TeePolar.hpp"
#include "TeeRose.hpp"
#include <ComCtrls.hpp>
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TClockSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TPanel *Panel2;
        TChart *Chart6;
        TClockSeries *Series5;
        TChart *Chart5;
        TClockSeries *Series4;
        TPanel *Panel3;
        TChart *Chart7;
        TClockSeries *Series6;
        TChart *Chart4;
        TClockSeries *Series3;
        TPanel *Panel4;
        TChart *Chart3;
        TClockSeries *Series2;
        TChart *Chart2;
        TClockSeries *Series1;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TLabel *Label2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Series2GetTime(TClockSeries *Sender,
          TDateTime &ATime);
private:	// User declarations
public:		// User declarations
        __fastcall TClockSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TClockSeriesForm *ClockSeriesForm;
//---------------------------------------------------------------------------
#endif
