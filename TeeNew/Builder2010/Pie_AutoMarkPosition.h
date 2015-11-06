//---------------------------------------------------------------------------

#ifndef Pie_AutoMarkPositionH
#define Pie_AutoMarkPositionH
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
class TPieAutoMarkPos : public TBaseForm
{
__published:	// IDE-managed Components
    TPieSeries *Series1;
    TCheckBox *CheckBox1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieAutoMarkPos(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieAutoMarkPos *PieAutoMarkPos;
//---------------------------------------------------------------------------
#endif
