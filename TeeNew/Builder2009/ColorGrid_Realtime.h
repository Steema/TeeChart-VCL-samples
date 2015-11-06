//---------------------------------------------------------------------------

#ifndef ColorGrid_RealtimeH
#define ColorGrid_RealtimeH
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
class TColorGridRealtime : public TBaseForm
{
__published:	// IDE-managed Components
    TColorGridSeries *ColorGrid;
    TCheckBox *CheckBox5;
    TCheckBox *CheckBox1;
    TCheckBox *CheckBox6;
    TTimer *Timer1;
    TLabel *Label1;
  void __fastcall Timer1Timer(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall CheckBox5Click(TObject *Sender);
  void __fastcall CheckBox6Click(TObject *Sender);
private:	// User declarations
  static const int DemoPoints=200;
  int x;
  void __fastcall UpdateTheChart(void);
public:		// User declarations
  __fastcall TColorGridRealtime(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TColorGridRealtime *ColorGridRealtime;
//---------------------------------------------------------------------------
#endif
