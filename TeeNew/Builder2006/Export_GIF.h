//---------------------------------------------------------------------------

#ifndef Export_GIFH
#define Export_GIFH
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
#include <BubbleCh.hpp>
#include <Dialogs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TGIFExportForm : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TButton *Button2;
        TSaveDialog *SaveDialog1;
        TBubbleSeries *Series1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall Button2Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TGIFExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TGIFExportForm *GIFExportForm;
//---------------------------------------------------------------------------
#endif
