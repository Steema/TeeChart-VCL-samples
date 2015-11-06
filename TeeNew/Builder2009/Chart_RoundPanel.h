//---------------------------------------------------------------------------

#ifndef Chart_RoundPanelH
#define Chart_RoundPanelH
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
#include <ComCtrls.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TChartRoundPanel : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TButtonPen *ButtonPen1;
    TCheckBox *CheckBox1;
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartRoundPanel(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartRoundPanel *ChartRoundPanel;
//---------------------------------------------------------------------------
#endif
