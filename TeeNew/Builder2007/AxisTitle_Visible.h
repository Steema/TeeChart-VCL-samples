//---------------------------------------------------------------------------

#ifndef AxisTitle_VisibleH
#define AxisTitle_VisibleH
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
class TAxisTitleVisible : public TBaseForm
{
__published:	// IDE-managed Components
        TCheckBox *CheckBox1;
        TLabel *Label1;
        TEdit *Edit1;
        TPointSeries *Series1;
        void __fastcall CheckBox1Click(TObject *Sender);
        void __fastcall Edit1Change(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TAxisTitleVisible(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxisTitleVisible *AxisTitleVisible;
//---------------------------------------------------------------------------
#endif
