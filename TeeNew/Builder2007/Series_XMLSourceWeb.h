//---------------------------------------------------------------------------

#ifndef Series_XMLSourceWebH
#define Series_XMLSourceWebH
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
//---------------------------------------------------------------------------
class TXMLSourceWeb : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TEdit *Edit1;
    TButton *Button1;
  void __fastcall Button1Click(TObject *Sender);
private:	// User declarations
  void __fastcall LoadXML(void);
public:		// User declarations
  __fastcall TXMLSourceWeb(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TXMLSourceWeb *XMLSourceWeb;
//---------------------------------------------------------------------------
#endif
