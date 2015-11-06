//---------------------------------------------------------------------------

#ifndef Chart_ThemesH
#define Chart_ThemesH
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
class TChartThemes : public TBaseForm
{
__published:	// IDE-managed Components
    TListBox *ListBox1;
    TLabel *Label1;
    TButton *Button1;
    TBarSeries *Series1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Button1Click(TObject *Sender);
  void __fastcall ListBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TChartThemes(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TChartThemes *ChartThemes;
//---------------------------------------------------------------------------
#endif
