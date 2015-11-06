//---------------------------------------------------------------------------

#ifndef Series_Bubble3DH
#define Series_Bubble3DH
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
#include "TeeOpenGL.hpp"
#include "TeePoin3.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TBubble3DSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
    TBubble3DSeries *Series1;
    TTeeOpenGL *TeeOpenGL1;
    TRotateTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBubble3DSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBubble3DSeriesForm *Bubble3DSeriesForm;
//---------------------------------------------------------------------------
#endif
