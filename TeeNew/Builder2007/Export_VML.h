//---------------------------------------------------------------------------

#ifndef Export_VMLH
#define Export_VMLH
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
#include <Dialogs.hpp>
#include <Series.hpp>
#include <TeeAbout.hpp>
#include <TeExport.hpp>
#include <TeeVMLCanvas.hpp>
//---------------------------------------------------------------------------
class TExportVMLForm : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TBarSeries *Series2;
    TBarSeries *Series3;
    TBarSeries *Series4;
    TButton *Button1;
    TSaveDialog *SaveDialog1;
    TButton *Button2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
        void __fastcall ShowSavedFile(void);
public:		// User declarations
        __fastcall TExportVMLForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TExportVMLForm *ExportVMLForm;
//---------------------------------------------------------------------------
#endif
