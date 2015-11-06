//---------------------------------------------------------------------------

#ifndef SeriesType_CandleH
#define SeriesType_CandleH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TCandleForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TMarksTipTool *ChartTool1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TButtonColor *ButtonColor1;
        TButtonColor *ButtonColor2;
        TButton *Button1;
        TLabel *Label1;
        TComboBox *ComboBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCandleForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCandleForm *CandleForm;
//---------------------------------------------------------------------------
#endif
