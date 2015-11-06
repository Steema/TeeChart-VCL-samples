//---------------------------------------------------------------------------

#ifndef Export_EmailH
#define Export_EmailH
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
#include "ImaPoint.hpp"
#include <Graphics.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TExportEmailForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TDeltaPointSeries *Series1;
        TButton *Button2;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TExportEmailForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportEmailForm *ExportEmailForm;
//---------------------------------------------------------------------------
#endif
