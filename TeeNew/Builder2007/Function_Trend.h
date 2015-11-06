//---------------------------------------------------------------------------

#ifndef Function_TrendH
#define Function_TrendH
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
//---------------------------------------------------------------------------
class TTrendForm : public TBaseForm
{
__published:	// IDE-managed Components
        TAreaSeries *Series1;
        TLineSeries *Series2;
        TTrendFunction *TeeFunction1;
        TButton *Button1;
        TMarksTipTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTrendForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTrendForm *TrendForm;
//---------------------------------------------------------------------------
#endif
