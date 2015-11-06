//---------------------------------------------------------------------------

#ifndef Tools_SeriesAnimH
#define Tools_SeriesAnimH
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
#include <Series.hpp>
//---------------------------------------------------------------------------
class TSeriesAnimDemo : public TBaseForm
{
__published:	// IDE-managed Components
    TBarSeries *Series1;
    TLabel *Label1;
    TButton *Button1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
    TButton *Button2;
    TSeriesAnimationTool *ChartTool1;
    TCheckBox *CheckBox1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall Button2Click(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TSeriesAnimDemo(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TSeriesAnimDemo *SeriesAnimDemo;
//---------------------------------------------------------------------------
#endif
