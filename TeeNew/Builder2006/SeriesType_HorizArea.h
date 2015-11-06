//---------------------------------------------------------------------------

#ifndef SeriesType_HorizAreaH
#define SeriesType_HorizAreaH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class THorizAreaSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TComboBox *ComboBox1;
    TButton *Button1;
    TMarksTipTool *ChartTool1;
    THorizAreaSeries *Series1;
    THorizAreaSeries *Series3;
    THorizAreaSeries *Series2;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THorizAreaSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THorizAreaSeriesForm *HorizAreaSeriesForm;
//---------------------------------------------------------------------------
#endif
