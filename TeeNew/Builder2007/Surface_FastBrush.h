//---------------------------------------------------------------------------

#ifndef Surface_FastBrushH
#define Surface_FastBrushH
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
class TSurfaceFastBrush : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TButton *Button1;
    TLabel *LabelTime;
    TSurfaceSeries *Series1;
    TRotateTool *ChartTool1;
    TCheckBox *CheckBox2;
    TCheckBox *CheckBox3;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
  void __fastcall CheckBox3Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSurfaceFastBrush(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSurfaceFastBrush *SurfaceFastBrush;
//---------------------------------------------------------------------------
#endif
