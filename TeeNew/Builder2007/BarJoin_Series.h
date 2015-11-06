//---------------------------------------------------------------------------

#ifndef BarJoin_SeriesH
#define BarJoin_SeriesH
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
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TBarJoinForm : public TBaseForm
{
__published:	// IDE-managed Components
        TBarJoinSeries *Series1;
        TButtonPen *ButtonPen1;
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TBarJoinForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBarJoinForm *BarJoinForm;
//---------------------------------------------------------------------------
#endif
