//---------------------------------------------------------------------------

#ifndef ChartListBox_RadioH
#define ChartListBox_RadioH
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
#include <TeeLisB.hpp>
//---------------------------------------------------------------------------
class TChartListBoxRadio : public TBaseForm
{
__published:	// IDE-managed Components
    TRadioGroup *RadioGroup1;
    TChartListBox *ChartListBox1;
    TBarSeries *Series1;
    TLineSeries *Series2;
    TAreaSeries *Series3;
    TPointSeries *Series4;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall RadioGroup1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartListBoxRadio(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartListBoxRadio *ChartListBoxRadio;
//---------------------------------------------------------------------------
#endif
