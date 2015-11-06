//---------------------------------------------------------------------------

#ifndef CurveFitting_DynamicH
#define CurveFitting_DynamicH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "CurvFitt.hpp"
#include "TeeComma.hpp"
#include "TeeTools.hpp"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TDynamicTrend : public TForm
{
__published:	// IDE-managed Components
        TChart *Chart1;
        TFastLineSeries *Series1;
        TTimer *Timer1;
        TAreaSeries *Series2;
        TLineSeries *Series3;
        TCurveFittingFunction *TeeFunction2;
        TPanel *Panel2;
        TGroupBox *GroupBox1;
        TLabel *Label1;
        TLabel *Label2;
        TScrollBar *ScrollBar3;
        TScrollBar *ScrollBar4;
        TGroupBox *GroupBox2;
        TLabel *Label3;
        TLabel *Label4;
        TScrollBar *ScrollBar1;
        TScrollBar *ScrollBar2;
        TCurveFittingFunction *TeeFunction1;
        TTeeCommander *TeeCommander1;
        TRotateTool *ChartTool1;
        void __fastcall ScrollBar2Change(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall ScrollBar3Change(TObject *Sender);
        void __fastcall ScrollBar4Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
        void __fastcall ResizeFunction(TCustomFittingFunction *AFunction, int APos);
        void __fastcall MoveFunction(TCustomFittingFunction *AFunction, int APos);
public:		// User declarations
        __fastcall TDynamicTrend(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDynamicTrend *DynamicTrend;
//---------------------------------------------------------------------------
#endif
