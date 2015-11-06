//---------------------------------------------------------------------------

#ifndef Series_HorizHistoH
#define Series_HorizHistoH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class THorizHistoForm : public TBaseForm
{
__published:	// IDE-managed Components
    THorizHistogramSeries *Series1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall THorizHistoForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THorizHistoForm *HorizHistoForm;
//---------------------------------------------------------------------------
#endif
