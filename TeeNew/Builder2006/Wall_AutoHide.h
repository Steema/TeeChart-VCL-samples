//---------------------------------------------------------------------------

#ifndef Wall_AutoHideH
#define Wall_AutoHideH
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
class TWallAutoHide : public TBaseForm
{
__published:	// IDE-managed Components
    TScrollBar *ScrollBar1;
    TLabel *Label1;
    TFastLineSeries *Series1;
    TCheckBox *CheckBox1;
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TWallAutoHide(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TWallAutoHide *WallAutoHide;
//---------------------------------------------------------------------------
#endif
