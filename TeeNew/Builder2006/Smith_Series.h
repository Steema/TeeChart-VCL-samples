//---------------------------------------------------------------------------

#ifndef Smith_SeriesH
#define Smith_SeriesH
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
#include "TeeSmith.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TSmithForm : public TBaseForm
{
__published:	// IDE-managed Components
        TSmithSeries *Series1;
        TButton *Button1;
        TCheckBox *CheckBox1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSmithForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSmithForm *SmithForm;
//---------------------------------------------------------------------------
#endif
