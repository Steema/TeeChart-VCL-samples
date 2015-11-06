//---------------------------------------------------------------------------

#ifndef Series_PolarBarH
#define Series_PolarBarH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPolarBarForm : public TBaseForm
{
__published:	// IDE-managed Components
    TPolarBarSeries *Series1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPolarBarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPolarBarForm *PolarBarForm;
//---------------------------------------------------------------------------
#endif
