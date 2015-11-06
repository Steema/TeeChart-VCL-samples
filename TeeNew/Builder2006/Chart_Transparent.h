//---------------------------------------------------------------------------

#ifndef Chart_TransparentH
#define Chart_TransparentH
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
class TChartTransparent : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TPieSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TChartTransparent(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartTransparent *ChartTransparent;
//---------------------------------------------------------------------------
#endif
