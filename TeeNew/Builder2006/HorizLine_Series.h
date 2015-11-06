//---------------------------------------------------------------------------

#ifndef HorizLine_SeriesH
#define HorizLine_SeriesH
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
#include "TeeComma.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class THorizLineForm : public TBaseForm
{
__published:	// IDE-managed Components
        THorizLineSeries *Series1;
        TTeeCommander *TeeCommander1;
        TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall THorizLineForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE THorizLineForm *HorizLineForm;
//---------------------------------------------------------------------------
#endif
