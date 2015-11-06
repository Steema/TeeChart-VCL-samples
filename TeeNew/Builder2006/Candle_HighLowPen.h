//---------------------------------------------------------------------------

#ifndef Candle_HighLowPenH
#define Candle_HighLowPenH
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
#include "TeePenDlg.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TCandleHighLowPen : public TBaseForm
{
__published:	// IDE-managed Components
    TButtonPen *ButtonPen1;
    TButtonPen *ButtonPen2;
    TCandleSeries *Series1;
    TCheckBox *CheckBox1;
  void __fastcall ButtonPen2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCandleHighLowPen(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleHighLowPen *CandleHighLowPen;
//---------------------------------------------------------------------------
#endif
