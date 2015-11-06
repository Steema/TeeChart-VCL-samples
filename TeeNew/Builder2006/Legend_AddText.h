//---------------------------------------------------------------------------

#ifndef Legend_AddTextH
#define Legend_AddTextH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TLegendAddText : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Chart1AfterDraw(TObject *Sender);
        void __fastcall Chart1GetLegendPos(TCustomChart *Sender, int Index,
          int &X, int &Y, int &XColor);
        void __fastcall Chart1GetLegendRect(TCustomChart *Sender,
          TRect &Rect);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLegendAddText(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLegendAddText *LegendAddText;
//---------------------------------------------------------------------------
#endif
