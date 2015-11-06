//---------------------------------------------------------------------------

#ifndef Tool_LightingH
#define Tool_LightingH
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
#include "TeeLighting.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TLightToolForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TRotateTool *ChartTool1;
    TLightTool *ChartTool2;
    TLabel *Label1;
    TTowerSeries *Series1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TLightToolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLightToolForm *LightToolForm;
//---------------------------------------------------------------------------
#endif
