//---------------------------------------------------------------------------

#ifndef Line_OutlineH
#define Line_OutlineH
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
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TLineOutline : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TButtonPen *ButtonPen1;
        TButtonPen *ButtonPen2;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLineOutline(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLineOutline *LineOutline;
//---------------------------------------------------------------------------
#endif
