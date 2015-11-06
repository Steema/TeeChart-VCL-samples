//---------------------------------------------------------------------------

#ifndef Commander_CustomEditorH
#define Commander_CustomEditorH
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
#include "TeeEdit.hpp"
//---------------------------------------------------------------------------
class TCommanderCustomEditor : public TBaseForm
{
__published:	// IDE-managed Components
    TTeeCommander *TeeCommander1;
    TChartEditor *ChartEditor1;
    TChartPreviewer *ChartPreviewer1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ChartEditor1Show(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCommanderCustomEditor(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCommanderCustomEditor *CommanderCustomEditor;
//---------------------------------------------------------------------------
#endif
