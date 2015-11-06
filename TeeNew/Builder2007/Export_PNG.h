//---------------------------------------------------------------------------

#ifndef Export_PNGH
#define Export_PNGH
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
#include <GanttCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPNGExportForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TGanttSeries *Series1;
        TButton *Button2;
        TSaveDialog *SaveDialog1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPNGExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPNGExportForm *PNGExportForm;
//---------------------------------------------------------------------------
#endif
