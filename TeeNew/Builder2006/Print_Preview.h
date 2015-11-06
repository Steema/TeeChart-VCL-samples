//---------------------------------------------------------------------------

#ifndef Print_PreviewH
#define Print_PreviewH
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
#include "TeePreviewPanel.hpp"

//---------------------------------------------------------------------------
class TPrintPreviewForm : public TBaseForm
{
__published:	// IDE-managed Components
    TTeePreviewPanel *TeePreviewPanel1;
    TSplitter *Splitter1;
    TButton *Button1;
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TPrintPreviewForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPrintPreviewForm *PrintPreviewForm;
//---------------------------------------------------------------------------
#endif
