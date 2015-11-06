//---------------------------------------------------------------------------

#ifndef Series_BarSizeH
#define Series_BarSizeH
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
#include "TeeBarSizeSeries.h"
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TBarSizeSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label3;
    TLabel *Label4;
    TLabel *Label5;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TScrollBar *ScrollBar1;
    TScrollBar *ScrollBar2;
    TAnnotationTool *ChartTool1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall ScrollBar2Change(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall Chart1ClickSeries(TCustomChart *Sender,
          TChartSeries *Series, int ValueIndex, TMouseButton Button,
          TShiftState Shift, int X, int Y);
private:	// User declarations
    TBarSizeSeries *Series1;
    void __fastcall RefreshAnnotation(void);
public:		// User declarations
  __fastcall TBarSizeSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarSizeSeriesForm *BarSizeSeriesForm;
//---------------------------------------------------------------------------
#endif
