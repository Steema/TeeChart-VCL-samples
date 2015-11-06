//---------------------------------------------------------------------------

#ifndef Pie_GradientH
#define Pie_GradientH
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
#include "TeeDonut.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPieGradientForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TDonutSeries *Series1;
    TCheckBox *CheckBox1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Panel1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieGradientForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieGradientForm *PieGradientForm;
//---------------------------------------------------------------------------
#endif
