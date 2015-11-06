//---------------------------------------------------------------------------

#ifndef Wall_TransparencyH
#define Wall_TransparencyH
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
#include "TeeEdit.hpp"
#include "TeeOpenGL.hpp"
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TWallTransparency : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TButton *Button1;
    TRotateTool *ChartTool1;
    TSurfaceSeries *Series1;
    TScrollBar *ScrollBar1;
    TChartEditor *ChartEditor1;
    TLabel *Label2;
    TTeeOpenGL *TeeOpenGL1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
  double __fastcall Calc(double x, double y);
public:		// User declarations
  __fastcall TWallTransparency(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWallTransparency *WallTransparency;
//---------------------------------------------------------------------------
#endif
