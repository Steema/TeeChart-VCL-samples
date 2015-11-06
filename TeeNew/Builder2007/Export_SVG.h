//---------------------------------------------------------------------------

#ifndef Export_SVGH
#define Export_SVGH
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
#include "TeeTools.hpp"
#include <BubbleCh.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TSVGExportForm : public TBaseForm
{
__published:	// IDE-managed Components
    TButton *Button1;
    TButton *Button2;
    TBarSeries *Series1;
    TLineSeries *Series2;
    TPointSeries *Series3;
    TPieSeries *Series4;
    TLabel *Label1;
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Label1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSVGExportForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSVGExportForm *SVGExportForm;
//---------------------------------------------------------------------------
#endif
