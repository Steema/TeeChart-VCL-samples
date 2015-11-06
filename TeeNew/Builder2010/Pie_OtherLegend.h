//---------------------------------------------------------------------------

#ifndef Pie_OtherLegendH
#define Pie_OtherLegendH
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
class TPieOtherLegend : public TBaseForm
{
__published:	// IDE-managed Components
    TPieSeries *Series1;
    TCheckBox *CheckBox1;
    TButton *Button1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Chart1AfterDraw(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieOtherLegend(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieOtherLegend *PieOtherLegend;
//---------------------------------------------------------------------------
#endif
