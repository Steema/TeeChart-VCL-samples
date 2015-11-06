//---------------------------------------------------------------------------

#ifndef SeriesType_LineH
#define SeriesType_LineH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLineSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TLineSeries *Series2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        TButton *Button1;
        TCheckBox *CheckBox5;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
        void __fastcall CheckBox5Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLineSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLineSeriesForm *LineSeriesForm;
//---------------------------------------------------------------------------
#endif
