//---------------------------------------------------------------------------

#ifndef ColorBand_ClickedH
#define ColorBand_ClickedH
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
//---------------------------------------------------------------------------
class TColorBandClicked : public TBaseForm
{
__published:	// IDE-managed Components
    TColorBandTool *ChartTool1;
    TLabel *Label1;
  void __fastcall ChartTool1Click(TObject *Sender, TMouseButton Button,
          TShiftState Shift, int X, int Y);
  void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
public:		// User declarations
  __fastcall TColorBandClicked(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorBandClicked *ColorBandClicked;
//---------------------------------------------------------------------------
#endif
