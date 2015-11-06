//---------------------------------------------------------------------------

#ifndef Chart_ActionsH
#define Chart_ActionsH
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
#include "TeeChartActions.hpp"
#include <ActnList.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TChartActionsForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TActionList *ActionList1;
        TChartAction3D *ChartAction3D1;
        TChartActionAxes *ChartActionAxes1;
        TChartActionCopy *ChartActionCopy1;
        TChartActionEdit *ChartActionEdit1;
        TChartActionLegend *ChartActionLegend1;
        TChartActionPrint *ChartActionPrint1;
        TSeriesActionActive *SeriesActionActive1;
        TSeriesActionEdit *SeriesActionEdit1;
        TSeriesActionMarks *SeriesActionMarks1;
        TLabel *Label1;
        TLabel *Label2;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TButton *Button1;
        TButton *Button2;
        TCheckBox *CheckBox3;
        TButton *Button3;
        TCheckBox *CheckBox4;
        TCheckBox *CheckBox5;
        TButton *Button4;
        TCheckBox *CheckBox6;
        TChartActionGrid *ChartActionGrid1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartActionsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartActionsForm *ChartActionsForm;
//---------------------------------------------------------------------------
#endif
