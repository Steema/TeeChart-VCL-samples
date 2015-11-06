//---------------------------------------------------------------------------

#ifndef CurveFitting_CoefH
#define CurveFitting_CoefH
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
#include "CurvFitt.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
#include <TeeShape.hpp>
//---------------------------------------------------------------------------
class TCurveFittingCoef : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Series1;
        TCurveFittingFunction *TeeFunction1;
        TFastLineSeries *Series2;
        TLabel *Label1;
        TLabel *Label2;
        TChartShape *Series3;
        TMarksTipTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
        void __fastcall ShowFunction(void);
public:		// User declarations
        __fastcall TCurveFittingCoef(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCurveFittingCoef *CurveFittingCoef;
//---------------------------------------------------------------------------
#endif
