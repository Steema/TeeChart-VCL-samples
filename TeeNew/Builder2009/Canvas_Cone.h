//---------------------------------------------------------------------------

#ifndef Canvas_ConeH
#define Canvas_ConeH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TConesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TLabel *Label1;
        TScrollBar *ScrollBar1;
        TLabel *Label2;
        TRotateTool *ChartTool1;
        TComboBox *ComboBox1;
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall ScrollBar1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
        void __fastcall ComboBox1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TConesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TConesForm *ConesForm;
//---------------------------------------------------------------------------
#endif
