//---------------------------------------------------------------------------

#ifndef Donut_SeriesH
#define Donut_SeriesH
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
#include "TeeDonut.hpp"
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TDonutSeriesForm : public TBaseForm
{
__published:	// IDE-managed Components
        TDonutSeries *Series1;
        TLabel *Label1;
        TEdit *EDonut;
        TUpDown *UDDonut;
        void __fastcall EDonutChange(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TDonutSeriesForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TDonutSeriesForm *DonutSeriesForm;
//---------------------------------------------------------------------------
#endif
