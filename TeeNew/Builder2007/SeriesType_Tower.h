//---------------------------------------------------------------------------

#ifndef SeriesType_TowerH
#define SeriesType_TowerH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TTowerSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
    TTowerSeries *Series1;
    TButton *Button1;
    TLabel *Label1;
    TComboFlat *ComboFlat1;
    TRotateTool *ChartTool1;
    TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboFlat1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTowerSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTowerSeriesForm *TowerSeriesForm;
//---------------------------------------------------------------------------
#endif
