//---------------------------------------------------------------------------

#ifndef ChartListBox_DemoH
#define ChartListBox_DemoH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "TeeComma.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeeLisB.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TListBoxForm : public TForm
{
__published:	// IDE-managed Components
        TPanel *Panel1;
        TMemo *Memo1;
        TTeeCommander *TeeCommander1;
        TChartListBox *ChartListBox1;
        TChart *Chart1;
        TLineSeries *Series1;
        TBarSeries *Series2;
        TPointSeries *Series3;
        TFastLineSeries *Series4;
        TLineSeries *Series6;
        TLineSeries *Series7;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TListBoxForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TListBoxForm *ListBoxForm;
//---------------------------------------------------------------------------
#endif
