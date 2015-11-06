//---------------------------------------------------------------------------

#ifndef Series_TextSourceH
#define Series_TextSourceH
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
#include "TeeURL.hpp"
#include <Series.hpp>
#include <TeeSeriesTextEd.hpp>
//---------------------------------------------------------------------------
class TSeriesTextSourceForm : public TBaseForm
{
__published:	// IDE-managed Components
        TSeriesTextSource *SeriesTextSource1;
        TBarSeries *Series1;
        TMemo *Memo2;
        TButton *Button1;
        TButton *Button2;
        TEdit *Edit1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        void __fastcall UpdateMemo();
        __fastcall TSeriesTextSourceForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesTextSourceForm *SeriesTextSourceForm;
//---------------------------------------------------------------------------
#endif
