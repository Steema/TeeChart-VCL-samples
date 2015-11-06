//---------------------------------------------------------------------------

#ifndef Series_FunnelH
#define Series_FunnelH
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
#include <ComCtrls.hpp>
#include <TeeFunnel.hpp>
//---------------------------------------------------------------------------
class TFunnelSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1ClickSeries(TCustomChart *Sender,
          TChartSeries *Series, int ValueIndex, TMouseButton Button,
          TShiftState Shift, int X, int Y);
private:	// User declarations
public:		// User declarations
        TFunnelSeries *Funnel;
        __fastcall TFunnelSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFunnelSeriesForm *FunnelSeriesForm;
//---------------------------------------------------------------------------
#endif
