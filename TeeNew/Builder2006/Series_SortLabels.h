//---------------------------------------------------------------------------

#ifndef Series_SortLabelsH
#define Series_SortLabelsH
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
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TSeriesSortLabel : public TBaseForm
{
__published:	// IDE-managed Components
    TComboFlat *ComboFlat1;
    TBarSeries *Series1;
    TLabel *Label1;
    TLabel *Label2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ComboFlat1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSeriesSortLabel(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesSortLabel *SeriesSortLabel;
//---------------------------------------------------------------------------
#endif
