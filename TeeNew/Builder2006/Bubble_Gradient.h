//---------------------------------------------------------------------------

#ifndef Bubble_GradientH
#define Bubble_GradientH
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
#include <BubbleCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBubbleGradient : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TButton *Button1;
    TButton *Button2;
    TBubbleSeries *Series1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TBubbleGradient(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBubbleGradient *BubbleGradient;
//---------------------------------------------------------------------------
#endif
