//---------------------------------------------------------------------------

#ifndef Axis_LabelsAlternateH
#define Axis_LabelsAlternateH
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
class TAlternateAxisLabels : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TRadioGroup *RadioGroup1;
    TCheckBox *CheckBox1;
    TLineSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall RadioGroup1Click(TObject *Sender);
private:	// User declarations
  TChartAxis* __fastcall TheAxis(void);
  void __fastcall Highlight(void);
  void __fastcall HighlightAxis(TChartAxis *Axis);
public:		// User declarations
  __fastcall TAlternateAxisLabels(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAlternateAxisLabels *AlternateAxisLabels;
//---------------------------------------------------------------------------
#endif
