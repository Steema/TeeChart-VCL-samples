//---------------------------------------------------------------------------

#ifndef Series_PointFigureH
#define Series_PointFigureH
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
#include "OHLChart.hpp"
#include "TeePointFigure.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPointFigureDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TPointFigureSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPointFigureDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPointFigureDemo *PointFigureDemo;
//---------------------------------------------------------------------------
#endif
