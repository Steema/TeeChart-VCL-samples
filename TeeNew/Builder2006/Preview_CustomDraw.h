//---------------------------------------------------------------------------

#ifndef Preview_CustomDrawH
#define Preview_CustomDrawH
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
#include "TeePreviewPanel.hpp"
//---------------------------------------------------------------------------
class TPreviewCustomDraw : public TBaseForm
{
__published:	// IDE-managed Components
    TTeePreviewPanel *TeePreviewPanel1;
    TCheckBox *CheckBox1;
  void __fastcall TeePreviewPanel1AfterDraw(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TPreviewCustomDraw(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TPreviewCustomDraw *PreviewCustomDraw;
//---------------------------------------------------------------------------
#endif
