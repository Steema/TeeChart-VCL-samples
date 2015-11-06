//---------------------------------------------------------------------------

#ifndef Legend_ScrollbarH
#define Legend_ScrollbarH
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
#include "TeeLegendScrollBar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendScrollBarDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TPointSeries *Series1;
    TLegendScrollBar *ChartTool1;
    TLabel *Label1;
    TLabel *Label2;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ChartTool1Scrolled(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TLegendScrollBarDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendScrollBarDemo *LegendScrollBarDemo;
//---------------------------------------------------------------------------
#endif
