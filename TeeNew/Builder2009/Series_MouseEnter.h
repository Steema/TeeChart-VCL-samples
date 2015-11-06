//---------------------------------------------------------------------------

#ifndef Series_MouseEnterH
#define Series_MouseEnterH
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
class TSeriesMouseEnter : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TLineSeries *Series2;
    TLabel *Label1;
  void __fastcall Series1MouseEnter(TObject *Sender);
  void __fastcall Series1MouseLeave(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSeriesMouseEnter(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesMouseEnter *SeriesMouseEnter;
//---------------------------------------------------------------------------
#endif
