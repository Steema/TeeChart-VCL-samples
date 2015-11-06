//---------------------------------------------------------------------------

#ifndef Chart_ScrollBarH
#define Chart_ScrollBarH
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
#include "TeeScroB.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartScrollBarForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartScrollBar *ChartScrollBar1;
        TFastLineSeries *Series1;
        TButton *Button1;
        TButton *Button2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall ChartScrollBar1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartScrollBarForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartScrollBarForm *ChartScrollBarForm;
//---------------------------------------------------------------------------
#endif
