//---------------------------------------------------------------------------

#ifndef Axes_GridBandsH
#define Axes_GridBandsH
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
#include "TeeTools.hpp"
//---------------------------------------------------------------------------
class TAxesGridBands : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TButton *Button2;
    TLineSeries *Series1;
    TCheckBox *CheckBox1;
    TButtonPen *ButtonPen1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
    TGridBandTool *BandTool;
public:		// User declarations
  __fastcall TAxesGridBands(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxesGridBands *AxesGridBands;
//---------------------------------------------------------------------------
#endif
