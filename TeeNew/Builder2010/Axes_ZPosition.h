//---------------------------------------------------------------------------

#ifndef Axes_ZPositionH
#define Axes_ZPositionH
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
#include <TeCanvas.hpp>
//---------------------------------------------------------------------------
class TAxesZPosition : public TBaseForm
{
__published:	// IDE-managed Components
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TLabel *Label2;
    TLineSeries *Series1;
    TComboFlat *ComboBox1;
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ComboBox1Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TAxesZPosition(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAxesZPosition *AxesZPosition;
//---------------------------------------------------------------------------
#endif
