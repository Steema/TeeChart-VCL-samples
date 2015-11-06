//---------------------------------------------------------------------------

#ifndef Function_OBVH
#define Function_OBVH
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
#include "TeeOBVFunction.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TOBVFuncDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TOBVFunction *TeeFunction1;
    TCandleSeries *Series1;
    TVolumeSeries *Series2;
    TLineSeries *Series3;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TOBVFuncDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TOBVFuncDemo *OBVFuncDemo;
//---------------------------------------------------------------------------
#endif
