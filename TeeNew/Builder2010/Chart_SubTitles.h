//---------------------------------------------------------------------------

#ifndef Chart_SubTitlesH
#define Chart_SubTitlesH
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
//---------------------------------------------------------------------------
class TSubTitles : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TCheckBox *CheckBox2;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TSubTitles(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSubTitles *SubTitles;
//---------------------------------------------------------------------------
#endif
