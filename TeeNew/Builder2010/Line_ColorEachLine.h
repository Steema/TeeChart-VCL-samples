//---------------------------------------------------------------------------

#ifndef Line_ColorEachLineH
#define Line_ColorEachLineH
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
class TLineColorEachLine : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TLineSeries *Series1;
        TCheckBox *CheckBox2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TLineColorEachLine(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TLineColorEachLine *LineColorEachLine;
//---------------------------------------------------------------------------
#endif
