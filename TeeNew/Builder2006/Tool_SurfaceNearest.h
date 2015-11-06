//---------------------------------------------------------------------------

#ifndef Tool_SurfaceNearestH
#define Tool_SurfaceNearestH
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
class TSurfaceNearestForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TSurfaceSeries *Series1;
    TLabel *Label1;
    TRotateTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
  void __fastcall AddSurfacePoints(void);
  void __fastcall ToolSelect(TObject *Sender);
public:		// User declarations
  __fastcall TSurfaceNearestForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceNearestForm *SurfaceNearestForm;
//---------------------------------------------------------------------------
#endif
