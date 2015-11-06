//---------------------------------------------------------------------------

#ifndef Commander_EditorH
#define Commander_EditorH
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
//---------------------------------------------------------------------------
class TCommanderEditorExample : public TBaseForm
{
__published:	// IDE-managed Components
    TTeeCommander *TeeCommander1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCommanderEditorExample(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCommanderEditorExample *CommanderEditorExample;
//---------------------------------------------------------------------------
#endif
