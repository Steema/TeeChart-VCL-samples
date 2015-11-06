//---------------------------------------------------------------------------

#ifndef ValueList_ModifiedH
#define ValueList_ModifiedH
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
class TValueListModified : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        TFastLineSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TValueListModified(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TValueListModified *ValueListModified;
//---------------------------------------------------------------------------
#endif
