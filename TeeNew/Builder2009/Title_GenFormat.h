//---------------------------------------------------------------------------

#ifndef Title_GenFormatH
#define Title_GenFormatH
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
#include <ComCtrls.hpp>
//---------------------------------------------------------------------------
class TTitleGenFormat : public TBaseForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TTitleGenFormat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TTitleGenFormat *TitleGenFormat;
//---------------------------------------------------------------------------
#endif
