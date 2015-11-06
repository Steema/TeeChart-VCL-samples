//---------------------------------------------------------------------------

#ifndef Marks_MultiH
#define Marks_MultiH
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
class TMarksMulti : public TBaseForm
{
__published:	// IDE-managed Components
        TBarSeries *Series1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TMarksMulti(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksMulti *MarksMulti;
//---------------------------------------------------------------------------
#endif
