//---------------------------------------------------------------------------

#ifndef BoxSeries_CustomValuesH
#define BoxSeries_CustomValuesH
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
#include "TeeBoxPlot.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TBoxCustomForm : public TBaseForm
{
__published:	// IDE-managed Components
    TBoxSeries *Series1;
    TCheckBox *CheckBox1;
    TLabel *Label1;
    TLabel *Label2;
    TLabel *Label3;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
    void __fastcall UpdateDisplay(void);
public:		// User declarations
  __fastcall TBoxCustomForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TBoxCustomForm *BoxCustomForm;
//---------------------------------------------------------------------------
#endif
