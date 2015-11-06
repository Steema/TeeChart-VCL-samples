//---------------------------------------------------------------------------

#ifndef Function_CurveFittingH
#define Function_CurveFittingH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCurveFittingForm : public TBaseForm
{
__published:	// IDE-managed Components
        TFastLineSeries *Data;
        TFastLineSeries *Curve1;
        TFastLineSeries *Curve2;
        TCurveFittingFunction *TeeFunction1;
        TCurveFittingFunction *TeeFunction2;
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TEdit *Edit2;
        TUpDown *UpDown2;
        TLabel *Label2;
        TTimer *Timer1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Timer1Timer(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TCurveFittingForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCurveFittingForm *CurveFittingForm;
//---------------------------------------------------------------------------
#endif
