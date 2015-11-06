//---------------------------------------------------------------------------

#ifndef Series_ShapeH
#define Series_ShapeH
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
#include <TeeShape.hpp>
//---------------------------------------------------------------------------
class TShapeSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TChartShape *Series1;
        TChartShape *Series2;
        TChartShape *Series3;
        TChartShape *Series4;
        TChartShape *Series5;
        TCheckBox *CheckBox1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Series1Click(TChartSeries *Sender, int ValueIndex,
          TMouseButton Button, TShiftState Shift, int X, int Y);
private:	// User declarations
public:		// User declarations
        __fastcall TShapeSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TShapeSeriesForm *ShapeSeriesForm;
//---------------------------------------------------------------------------
#endif
