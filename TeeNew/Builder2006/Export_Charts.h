//---------------------------------------------------------------------------

#ifndef Export_ChartsH
#define Export_ChartsH
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
class TExportChartsForm : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TButton *Button1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TExportChartsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportChartsForm *ExportChartsForm;
//---------------------------------------------------------------------------
#endif
