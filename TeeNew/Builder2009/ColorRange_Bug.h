//---------------------------------------------------------------------------

#ifndef ColorRange_BugH
#define ColorRange_BugH
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
class TColorRangeBug : public TBaseForm
{
__published:	// IDE-managed Components
        TLineSeries *Series1;
        TButton *Button1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TColorRangeBug(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorRangeBug *ColorRangeBug;
//---------------------------------------------------------------------------
#endif
