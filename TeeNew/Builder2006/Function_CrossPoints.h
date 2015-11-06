//---------------------------------------------------------------------------

#ifndef Function_CrossPointsH
#define Function_CrossPointsH
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
#include "StatChar.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCrossPointsDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TCrossPointsFunction *TeeFunction1;
    TLineSeries *Series1;
    TLineSeries *Series2;
    TLineSeries *Series3;
    TCheckBox *CheckBox1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCrossPointsDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCrossPointsDemo *CrossPointsDemo;
//---------------------------------------------------------------------------
#endif
