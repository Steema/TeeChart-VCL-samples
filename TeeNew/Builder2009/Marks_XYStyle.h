//---------------------------------------------------------------------------

#ifndef Marks_XYStyleH
#define Marks_XYStyleH
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
class TMarksXYStyle : public TBaseForm
{
__published:	// IDE-managed Components
        TPointSeries *Series1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall Series1GetMarkText(TChartSeries *Sender,
          int ValueIndex, AnsiString &MarkText);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksXYStyle(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksXYStyle *MarksXYStyle;
//---------------------------------------------------------------------------
#endif
