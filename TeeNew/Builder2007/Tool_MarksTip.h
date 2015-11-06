//---------------------------------------------------------------------------

#ifndef Tool_MarksTipH
#define Tool_MarksTipH
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
class TMarkTipsToolDemo : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TBarSeries *Series1;
        TButton *Button1;
        TMarksTipTool *ChartTool1;
        TComboBox *ComboBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TUpDown *UpDown1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarkTipsToolDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarkTipsToolDemo *MarkTipsToolDemo;
//---------------------------------------------------------------------------
#endif
