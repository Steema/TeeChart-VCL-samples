//---------------------------------------------------------------------------

#ifndef Print_PreviewDialogH
#define Print_PreviewDialogH
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
#include "TeeEdit.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPrintPreviewDialog : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TBarSeries *Series1;
        TChartPreviewer *ChartPreviewer1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPrintPreviewDialog(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintPreviewDialog *PrintPreviewDialog;
//---------------------------------------------------------------------------
#endif
