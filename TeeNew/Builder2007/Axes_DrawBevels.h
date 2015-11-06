//---------------------------------------------------------------------------

#ifndef Axes_DrawBevelsH
#define Axes_DrawBevelsH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TBeveledAxes : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
    TComboFlat *ComboFlat1;
    TBarSeries *Series1;
  void __fastcall Chart1AfterDraw(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
  void __fastcall ComboFlat1Change(TObject *Sender);

private:	// User declarations
  void __fastcall AdjustAxisOffsets(void);
public:		// User declarations
  __fastcall TBeveledAxes(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBeveledAxes *BeveledAxes;
//---------------------------------------------------------------------------
#endif
