//---------------------------------------------------------------------------

#ifndef Series_GroupsH
#define Series_GroupsH
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
#include "TeeEdit.hpp"
#include <TeCanvas.hpp>
#include <TeeLisB.hpp>
//---------------------------------------------------------------------------
class TSeriesGroupsForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TChartEditor *ChartEditor1;
    TChartListBox *ChartListBox1;
    TComboFlat *ComboFlat1;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall ComboFlat1Change(TObject *Sender);
private:	// User declarations
    TSeriesGroup *Group1;
    TSeriesGroup *Group2 ;
public:		// User declarations
  __fastcall TSeriesGroupsForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesGroupsForm *SeriesGroupsForm;
//---------------------------------------------------------------------------
#endif
