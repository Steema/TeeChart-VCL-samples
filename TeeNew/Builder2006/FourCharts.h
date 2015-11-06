//---------------------------------------------------------------------------

#ifndef FourChartsH
#define FourChartsH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include <Chart.hpp>
#include <Dialogs.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TFourChartsForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TChart *Chart1;
        TLineSeries *Winter;
        TLineSeries *Summer;
        TChart *Chart2;
        TBarSeries *BarSeries1;
        TPanel *Panel2;
        TChart *Chart3;
        TAreaSeries *South;
        TAreaSeries *North;
        TChart *Chart4;
        TPointSeries *Speaking;
        TPointSeries *Writing;
        TPointSeries *Reading;
        TPanel *Panel3;
        TButton *Button1;
        TSaveDialog *SaveDialog1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TFourChartsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFourChartsForm *FourChartsForm;
//---------------------------------------------------------------------------
#endif
