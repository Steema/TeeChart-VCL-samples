//---------------------------------------------------------------------------

#ifndef Series3D_AddArrayH
#define Series3D_AddArrayH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TAddArray3D : public TBaseForm
{
__published:	// IDE-managed Components
    TColorGridSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TAddArray3D(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAddArray3D *AddArray3D;
//---------------------------------------------------------------------------
#endif
