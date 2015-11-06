//---------------------------------------------------------------------------

#ifndef Series_MyPointH
#define Series_MyPointH
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
#include "MyPoint.hpp"
#include "TeePenDlg.hpp"
#include "TeeTools.hpp"
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TMyPointSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TMyPointSeries *Series1;
        TButtonPen *ButtonPen1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        TMarksTipTool *ChartTool1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMyPointSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMyPointSeriesForm *MyPointSeriesForm;
//---------------------------------------------------------------------------
#endif
