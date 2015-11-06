//---------------------------------------------------------------------------

#ifndef Legend_SymbolH
#define Legend_SymbolH
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
#include "TeeSurfa.hpp"
#include "TeeTools.hpp"
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TLegendSymbolForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label1;
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TComboBox *ComboBox1;
        TContourSeries *Series1;
        TCheckBox *CheckBox1;
        TRotateTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendSymbolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendSymbolForm *LegendSymbolForm;
//---------------------------------------------------------------------------
#endif
