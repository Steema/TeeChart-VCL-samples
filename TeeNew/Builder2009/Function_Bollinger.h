//---------------------------------------------------------------------------

#ifndef Function_BollingerH
#define Function_BollingerH
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
#include "CandleCh.hpp"
#include "OHLChart.hpp"
#include "StatChar.hpp"
#include "TeePenDlg.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TBollingerForm : public TBaseForm
{
__published:	// IDE-managed Components
        TCandleSeries *Series1;
        TBollingerFunction *TeeFunction1;
        TButtonPen *ButtonPen1;
        TEdit *Edit1;
        TLabel *Label1;
        TUpDown *UpDown1;
        TLabel *Label2;
        TEdit *Edit2;
        TUpDown *UpDown2;
        TCheckBox *CheckBox1;
        TFastLineSeries *Series2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall ButtonPen1Click(TObject *Sender);
        void __fastcall Edit2Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBollingerForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBollingerForm *BollingerForm;
//---------------------------------------------------------------------------
#endif
