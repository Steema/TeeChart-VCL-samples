//---------------------------------------------------------------------------

#ifndef HighLow_SeriesH
#define HighLow_SeriesH
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
#include "ErrorBar.hpp"
#include "TeePenDlg.hpp"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class THighLowForm : public TBaseForm
{
__published:	// IDE-managed Components
        THighLowSeries *Series1;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        TButtonPen *ButtonPen3;
        TButton *Button1;
        TButton *Button2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THighLowForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THighLowForm *HighLowForm;
//---------------------------------------------------------------------------
#endif
