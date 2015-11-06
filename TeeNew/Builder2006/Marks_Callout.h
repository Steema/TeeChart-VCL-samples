//---------------------------------------------------------------------------

#ifndef Marks_CalloutH
#define Marks_CalloutH
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
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TMarksCallouts : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TLabel *Label1;
    TComboFlat *CBArrowStyle;
    TButton *Button1;
    TCheckBox *CheckBox1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CBArrowStyleChange(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TMarksCallouts(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TMarksCallouts *MarksCallouts;
//---------------------------------------------------------------------------
#endif
