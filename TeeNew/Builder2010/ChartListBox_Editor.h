//---------------------------------------------------------------------------

#ifndef ChartListBox_EditorH
#define ChartListBox_EditorH
//---------------------------------------------------------------------------
#include <Classes.hpp>
#include <Controls.hpp>
#include <StdCtrls.hpp>
#include <Forms.hpp>
#include "ChartListBox_Radio.h"
#include <Chart.hpp>
#include <ExtCtrls.hpp>
#include <Series.hpp>
#include <TeeLisB.hpp>
#include <TeEngine.hpp>
#include <TeeProcs.hpp>
//---------------------------------------------------------------------------
class TChartListBoxEditor : public TChartListBoxRadio
{
__published:	// IDE-managed Components
    TCheckBox *CBEditor;
  void __fastcall CBEditorClick(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartListBoxEditor(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartListBoxEditor *ChartListBoxEditor;
//---------------------------------------------------------------------------
#endif
