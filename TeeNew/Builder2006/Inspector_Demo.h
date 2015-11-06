//---------------------------------------------------------------------------

#ifndef Inspector_DemoH
#define Inspector_DemoH
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
#include "TeeInspector.hpp"
#include <Grids.hpp>
//---------------------------------------------------------------------------
class TInspectorForm : public TBaseForm
{
__published:	// IDE-managed Components
    TTeeInspector *TeeInspector1;
    TSplitter *Splitter1;
    TCheckBox *CheckBox1;
        void __fastcall FormCreate(TObject *Sender);
        void __fastcall TeeInspector1Items0Change(TObject *Sender);
        void __fastcall TeeInspector1Items1Change(TObject *Sender);
        void __fastcall TeeInspector1Items2Change(TObject *Sender);
        void __fastcall TeeInspector1Items3Change(TObject *Sender);
        void __fastcall TeeInspector1Items4Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TInspectorForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TInspectorForm *InspectorForm;
//---------------------------------------------------------------------------
#endif
