//---------------------------------------------------------------------------

#ifndef Surface_TransparencyH
#define Surface_TransparencyH
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
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TSurfaceTransp : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
    TSurfaceSeries *Series1;
    TRotateTool *ChartTool1;
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSurfaceTransp(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceTransp *SurfaceTransp;
//---------------------------------------------------------------------------
#endif
