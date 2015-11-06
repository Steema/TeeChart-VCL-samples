//---------------------------------------------------------------------------

#ifndef Marks_DrawEveryH
#define Marks_DrawEveryH
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
class TMarksEvery : public TBaseForm
{
__published:	// IDE-managed Components
        TLabel *Label2;
        TEdit *Edit1;
        TUpDown *UpDown1;
        TLineSeries *Series1;
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksEvery(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksEvery *MarksEvery;
//---------------------------------------------------------------------------
#endif
