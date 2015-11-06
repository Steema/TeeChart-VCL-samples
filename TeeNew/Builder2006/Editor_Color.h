//---------------------------------------------------------------------------

#ifndef Editor_ColorH
#define Editor_ColorH
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
class TEditorColor : public TBaseForm
{
__published:	// IDE-managed Components
        TButton *Button1;
        void __fastcall Button1Click(TObject *Sender);
        void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
        __fastcall TEditorColor(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TEditorColor *EditorColor;
//---------------------------------------------------------------------------
#endif
