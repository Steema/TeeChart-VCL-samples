//---------------------------------------------------------------------------

#ifndef Bar_3DDepthH
#define Bar_3DDepthH
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
#include "TeeTools.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBar3DDepth : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TBarSeries *Series2;
    TBarSeries *Series3;
    TBarSeries *Series4;
    TBarSeries *Series5;
    TLabel *Label1;
    TLabel *Label2;
    TScrollBar *ScrollBar1;
    TScrollBar *ScrollBar2;
    TRotateTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall ScrollBar2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBar3DDepth(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBar3DDepth *Bar3DDepth;
//---------------------------------------------------------------------------
#endif
