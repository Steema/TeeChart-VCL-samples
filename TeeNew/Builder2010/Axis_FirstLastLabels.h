//---------------------------------------------------------------------------

#ifndef Axis_FirstLastLabelsH
#define Axis_FirstLastLabelsH
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
class TFirstLastLabels : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TLineSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
  void __fastcall BottomAxisDrawLabel(TChartAxis *Sender, int &X, int &Y, int &Z,
    AnsiString &Text, bool &DrawLabel);
public:		// User declarations
  __fastcall TFirstLastLabels(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFirstLastLabels *FirstLastLabels;
//---------------------------------------------------------------------------
#endif
