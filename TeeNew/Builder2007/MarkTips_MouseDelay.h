//---------------------------------------------------------------------------

#ifndef MarkTips_MouseDelayH
#define MarkTips_MouseDelayH
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
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMarksTipMouseDelay : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TBarSeries *Series2;
    TBarSeries *Series3;
    TMarksTipTool *ChartTool1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TLabel *Label2;
    TComboBox *ComboBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksTipMouseDelay(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksTipMouseDelay *MarksTipMouseDelay;
//---------------------------------------------------------------------------
#endif
