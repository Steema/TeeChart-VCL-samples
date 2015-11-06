//---------------------------------------------------------------------------

#ifndef Function_PVOH
#define Function_PVOH
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
#include "TeePVOFunction.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPVOFuncdemo : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TVolumeSeries *Series1;
    TFastLineSeries *Series2;
    TPVOFunction *TeeFunction1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPVOFuncdemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPVOFuncdemo *PVOFuncdemo;
//---------------------------------------------------------------------------
#endif
