//---------------------------------------------------------------------------

#ifndef FastLine_NullsH
#define FastLine_NullsH
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
class TFastLineNulls : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox2;
    TCheckBox *CheckBox3;
    TFastLineSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall CheckBox3Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TFastLineNulls(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFastLineNulls *FastLineNulls;
//---------------------------------------------------------------------------
#endif
