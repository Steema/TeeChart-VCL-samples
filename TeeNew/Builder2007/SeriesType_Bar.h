//---------------------------------------------------------------------------

#ifndef SeriesType_BarH
#define SeriesType_BarH
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
class TBarSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TBarSeries *Series2;
        TBarSeries *Series3;
        TLabel *Label1;
        TComboBox *ComboBox1;
        TLabel *Label2;
        TComboBox *ComboBox2;
        TButton *Button1;
        TMarksTipTool *ChartTool1;
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall ComboBox2Change(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarSeriesForm *BarSeriesForm;
//---------------------------------------------------------------------------
#endif
