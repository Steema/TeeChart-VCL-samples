//---------------------------------------------------------------------------

#ifndef Map_SeriesH
#define Map_SeriesH
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
#include "TeeMapSeries.hpp"
#include "TeeSurfa.hpp"
#include <ActnList.hpp>
//---------------------------------------------------------------------------
class TMapSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TMapSeries *Series1;
        TButton *Button1;
        TActionList *ActionList1;
        TChartActionEdit *ChartActionEdit1;
        TCheckBox *CheckBox1;
        TChartActionAxes *ChartActionAxes1;
        TSeriesActionMarks *SeriesActionMarks1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
private:	// User declarations
        void __fastcall AddSampleShapes();
        void __fastcall AddShape(const int *X, int sizeX, const int *Y, int sizeY,
                        TColor AColor, const AnsiString AText);
public:		// User declarations
        __fastcall TMapSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMapSeriesForm *MapSeriesForm;
//---------------------------------------------------------------------------
#endif
