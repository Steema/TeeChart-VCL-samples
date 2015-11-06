//---------------------------------------------------------------------------

#ifndef Canvas_RotatedEllipseH
#define Canvas_RotatedEllipseH
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
#include <Graphics.hpp>
//---------------------------------------------------------------------------
class TCanvasRotatedEllipse : public TBaseForm
{
__published:	// IDE-managed Components
    TScrollBar *ScrollBar1;
    TLabel *Label1;
    TRotateTool *ChartTool1;
    TLabel *Label2;
    TCheckBox *CheckBox1;
  void __fastcall Chart1AfterDraw(TObject *Sender);
  void __fastcall ScrollBar1Change(TObject *Sender);
  void __fastcall CheckBox1Click(TObject *Sender);
private:	// User declarations
public:		// User declarations
  __fastcall TCanvasRotatedEllipse(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TCanvasRotatedEllipse *CanvasRotatedEllipse;
//---------------------------------------------------------------------------
#endif
