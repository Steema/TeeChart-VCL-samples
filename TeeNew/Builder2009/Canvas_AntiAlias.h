//---------------------------------------------------------------------------

#ifndef Canvas_AntiAliasH
#define Canvas_AntiAliasH
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
#include <ComCtrls.hpp>
#include <Series.hpp>
//---------------------------------------------------------------------------
class TCanvasAntiAlias : public TBaseForm
{
__published:	// IDE-managed Components
    TCheckBox *CheckBox1;
    TPieSeries *Series1;
    TLabel *Label1;
    TEdit *Edit1;
    TUpDown *UpDown1;
  void __fastcall CheckBox1Click(TObject *Sender);
  void __fastcall Chart1AfterDraw(TObject *Sender);
  void __fastcall Edit1Change(TObject *Sender);
private:	// User declarations
  bool InsideAntiAliasing;
public:		// User declarations
  __fastcall TCanvasAntiAlias(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCanvasAntiAlias *CanvasAntiAlias;
//---------------------------------------------------------------------------
#endif
