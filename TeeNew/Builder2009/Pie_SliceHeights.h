//---------------------------------------------------------------------------

#ifndef Pie_SliceHeightsH
#define Pie_SliceHeightsH
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
#include "TeeDonut.hpp"
#include <Series.hpp>
//---------------------------------------------------------------------------
class TPieSliceHeights : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TDonutSeries *Series1;
    TLabel *Label1;
    TScrollBar *ScrollBar1;
    TScrollBar *ScrollBar2;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall ScrollBar2Change(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPieSliceHeights(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPieSliceHeights *PieSliceHeights;
//---------------------------------------------------------------------------
#endif
