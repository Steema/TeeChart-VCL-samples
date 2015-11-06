//---------------------------------------------------------------------------

#ifndef SeriesType_BubbleH
#define SeriesType_BubbleH
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
#include <BubbleCh.hpp>
#include <Buttons.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBubbleSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TSpeedButton *ZoomInButton;
        TSpeedButton *ZoomOutButton;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox2;
        TComboBox *ComboBox1;
        TLabel *Label1;
        TBubbleSeries *Series1;
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        TSeriesPointerStyle __fastcall Series1GetPointerStyle(
          TChartSeries *Sender, int ValueIndex);
        void __fastcall ZoomInButtonClick(TObject *Sender);
        void __fastcall ZoomOutButtonClick(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBubbleSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBubbleSeriesForm *BubbleSeriesForm;
//---------------------------------------------------------------------------
#endif
