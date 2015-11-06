//---------------------------------------------------------------------------

#ifndef Tools_ColorBandH
#define Tools_ColorBandH
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
class TColorBandToolForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TColorBandTool *ChartTool1;
        TColorBandTool *ChartTool2;
        TColorBandTool *ChartTool3;
        TColorBandTool *ChartTool4;
        TColorBandTool *ChartTool5;
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        TCheckBox *CheckBox3;
        TCheckBox *CheckBox4;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
        void __fastcall CheckBox3Click(TObject *Sender);
        void __fastcall CheckBox4Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TColorBandToolForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorBandToolForm *ColorBandToolForm;
//---------------------------------------------------------------------------
#endif
