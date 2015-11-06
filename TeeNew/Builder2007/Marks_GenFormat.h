//---------------------------------------------------------------------------

#ifndef Marks_GenFormatH
#define Marks_GenFormatH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TMarksGenFormat : public TBaseForm
{
__published:	// IDE-managed Components
        TPageControl *PageControl1;
        TPointSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall FormShow(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksGenFormat(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksGenFormat *MarksGenFormat;
//---------------------------------------------------------------------------
#endif
