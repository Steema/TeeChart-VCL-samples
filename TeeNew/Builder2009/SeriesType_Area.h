//---------------------------------------------------------------------------

#ifndef SeriesType_AreaH
#define SeriesType_AreaH
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
class TAreaSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TComboBox *ComboBox1;
        TButton *Button1;
        TMarksTipTool *ChartTool1;
        TAreaSeries *Series1;
        TAreaSeries *Series2;
        TAreaSeries *Series3;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TLabel *Label1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAreaSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAreaSeriesForm *AreaSeriesForm;
//---------------------------------------------------------------------------
#endif
