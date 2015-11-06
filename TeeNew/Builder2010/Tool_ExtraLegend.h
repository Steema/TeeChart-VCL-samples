//---------------------------------------------------------------------------

#ifndef Tool_ExtraLegendH
#define Tool_ExtraLegendH
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
#include "TeeExtraLegendTool.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExtraLegendDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TLineSeries *Series1;
    TLineSeries *Series2;
    TButton *Button1;
    TExtraLegendTool *ChartTool1;
    TButton *Button2;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
    void __fastcall AlignLegend(void);
public:		// User declarations
  __fastcall TExtraLegendDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExtraLegendDemo *ExtraLegendDemo;
//---------------------------------------------------------------------------
#endif
