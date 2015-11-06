//---------------------------------------------------------------------------

#ifndef PostScript_DemoH
#define PostScript_DemoH
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
#include <Dialogs.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPostScriptForm : public TBaseForm
{
__published:	// IDE-managed Components
  TLineSeries *Series1;
  TLineSeries *Series2;
  TLineSeries *Series3;
  TButton *Button1;
  TSaveDialog *SaveDialog1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPostScriptForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPostScriptForm *PostScriptForm;
//---------------------------------------------------------------------------
#endif
