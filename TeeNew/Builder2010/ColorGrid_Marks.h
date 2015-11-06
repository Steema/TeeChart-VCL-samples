//---------------------------------------------------------------------------

#ifndef ColorGrid_MarksH
#define ColorGrid_MarksH
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
#include "TeeSurfa.hpp"
//---------------------------------------------------------------------------
class TColorGridMarks : public TBaseForm
{
__published:	// IDE-managed Components
    TColorGridSeries *Series1;
    TCheckBox *CheckBox1;
    TButton *Button1;
    TCheckBox *CheckBox2;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall CheckBox2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TColorGridMarks(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGridMarks *ColorGridMarks;
//---------------------------------------------------------------------------
#endif
