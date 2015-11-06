//---------------------------------------------------------------------------

#ifndef Bar_TickLinesH
#define Bar_TickLinesH
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
#include "TeePenDlg.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TBarTickLines : public TBaseForm
{
__published:	// IDE-managed Components
    TButtonPen *ButtonPen1;
    TBarSeries *Series1;
    TCheckBox *CheckBox1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBarTickLines(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarTickLines *BarTickLines;
//---------------------------------------------------------------------------
#endif
