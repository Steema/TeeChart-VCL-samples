//---------------------------------------------------------------------------

#ifndef Function_PerimeterH
#define Function_PerimeterH
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
class TPerimeterDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TPointSeries *Series1;
    TLineSeries *Series2;
    TButton *Button1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPerimeterDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPerimeterDemo *PerimeterDemo;
//---------------------------------------------------------------------------
#endif
