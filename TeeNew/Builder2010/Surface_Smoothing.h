//---------------------------------------------------------------------------

#ifndef Surface_SmoothingH
#define Surface_SmoothingH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TSurfaceSmoothing : public TBaseForm
{
__published:	// IDE-managed Components
    TSurfaceSeries *Series1;
    TButton *Button1;
    TRotateTool *ChartTool1;
    TLabel *Label1;
    TTeeOpenGL *TeeOpenGL1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSurfaceSmoothing(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceSmoothing *SurfaceSmoothing;
//---------------------------------------------------------------------------
#endif
