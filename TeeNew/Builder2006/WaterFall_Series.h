//---------------------------------------------------------------------------

#ifndef WaterFall_SeriesH
#define WaterFall_SeriesH
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
#include "TeePenDlg.hpp"
#include "TeeSurfa.hpp"
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TWaterFallForm : public TBaseForm
{
__published:	// IDE-managed Components
        TWaterFallSeries *Series1;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TWaterFallForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWaterFallForm *WaterFallForm;
//---------------------------------------------------------------------------
#endif
