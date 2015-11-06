//---------------------------------------------------------------------------

#ifndef Editor_FormattingH
#define Editor_FormattingH
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
class TFormatEditorDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TButton *Button1;
    TLineSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
  void __fastcall SetOtherFormats(void);
public:		// User declarations
  __fastcall TFormatEditorDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TFormatEditorDemo *FormatEditorDemo;
//---------------------------------------------------------------------------
#endif
