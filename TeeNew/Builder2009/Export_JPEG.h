//---------------------------------------------------------------------------

#ifndef Export_JPEGH
#define Export_JPEGH
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
#include <ArrowCha.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TJPEGExportForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TArrowSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TJPEGExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TJPEGExportForm *JPEGExportForm;
//---------------------------------------------------------------------------
#endif
