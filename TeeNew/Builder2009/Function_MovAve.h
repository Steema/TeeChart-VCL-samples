//---------------------------------------------------------------------------

#ifndef Function_MovAveH
#define Function_MovAveH
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
#include "StatChar.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMovAveFunctionForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TLabel *Label2;
        TLabel *Label3;
        TCheckBox *CheckBox3;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TEdit *Edit2;
        TUpDown *UpDown2;
        TEdit *Edit3;
        TUpDown *UpDown3;
        TLineSeries *ExpAve1;
        TLineSeries *MovingAve1;
        TLineSeries *MovingAve2;
        TLineSeries *Curve1;
        TTimer *Timer1;
        TLineSeries *PriceLine;
        TExpAverageFunction *ExpAverageFunction1;
        TMovingAverageFunction *MovingAverageFunction1;
        TMovingAverageFunction *MovingAverageFunction2;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
        void __fastcall Edit3Change(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMovAveFunctionForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMovAveFunctionForm *MovAveFunctionForm;
//---------------------------------------------------------------------------
#endif
