//---------------------------------------------------------------------------

#ifndef Export_PCXH
#define Export_PCXH
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
#include "TeePolar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPCXExportForm : public TBaseForm
{
__published:	// IDE-managed Components
        TRadarSeries *Series1;
        TButton *Button1;
        TButton *Button2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPCXExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPCXExportForm *PCXExportForm;
//---------------------------------------------------------------------------
#endif
