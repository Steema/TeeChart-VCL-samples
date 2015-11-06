//---------------------------------------------------------------------------

#ifndef Chart_ListBoxH
#define Chart_ListBoxH
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
#include <BubbleCh.hpp>
#include <Series.hpp>
#include <TeeLisB.hpp>
//---------------------------------------------------------------------------
class TChartListBoxForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartListBox *ChartListBox1;
        TLineSeries *Series1;
        TPointSeries *Series2;
        TFastLineSeries *Series3;
        TBubbleSeries *Series4;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TCheckBox *CheckBox5;
        TCheckBox *CheckBox6;
        TCheckBox *CheckBox7;
        TCheckBox *CheckBox8;
        TCheckBox *CheckBox9;
        TLabel *Label1;
        TGroupBox *GroupBox1;
        TSplitter *Splitter1;
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
        void __fastcall CheckBox6Click(TObject *Sender);
        void __fastcall CheckBox8Click(TObject *Sender);
        void __fastcall CheckBox9Click(TObject *Sender);
        void __fastcall CheckBox7Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartListBoxForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartListBoxForm *ChartListBoxForm;
//---------------------------------------------------------------------------
#endif
