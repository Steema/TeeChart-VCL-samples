//---------------------------------------------------------------------------

#ifndef Legend_SymbolFlagsH
#define Legend_SymbolFlagsH
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
#include <ImgList.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TLegendSymbolDraw : public TBaseForm
{
__published:	// IDE-managed Components
    TPieSeries *Series1;
    TCheckBox *CheckBox1;
    TButtonPen *ButtonPen1;
    TImageList *ImageList1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
  void __fastcall LegendDraw(TObject *Sender,  TChartSeries *Series,
                         int ValueIndex, const TRect &R);

public:		// User declarations
  __fastcall TLegendSymbolDraw(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendSymbolDraw *LegendSymbolDraw;
//---------------------------------------------------------------------------
#endif
