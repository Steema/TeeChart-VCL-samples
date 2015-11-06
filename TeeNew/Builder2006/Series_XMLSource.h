//---------------------------------------------------------------------------

#ifndef Series_XMLSourceH
#define Series_XMLSourceH
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
#include "TeeXML.hpp"
//---------------------------------------------------------------------------
class TXMLSourceDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TMemo *Memo2;
    TSplitter *Splitter1;
    TButton *Button1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Memo2Change(TObject *Sender);
private:	// User declarations
    TPointSeries *PointSeries;
    TTeeXMLSource *XML;
public:		// User declarations
  __fastcall TXMLSourceDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TXMLSourceDemo *XMLSourceDemo;
//---------------------------------------------------------------------------
#endif
