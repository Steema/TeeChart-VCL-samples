//---------------------------------------------------------------------------

#ifndef Tool_AnnotationClickH
#define Tool_AnnotationClickH
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
//---------------------------------------------------------------------------
class TAnnotationClickForm : public TBaseForm
{
__published:	// IDE-managed Components
  TAnnotationTool *ChartTool1;
  TAnnotationTool *ChartTool2;
  TAnnotationTool *ChartTool3;
  TLabel *Label1;
  void __fastcall ChartTool1Click(TAnnotationTool *Sender,
          TMouseButton Button, TShiftState Shift, int X, int Y);
  void __fastcall FormCreate(TObject *Sender);
  void __fastcall Chart1MouseMove(TObject *Sender, TShiftState Shift,
          int X, int Y);
private:	// User declarations
public:		// User declarations
  __fastcall TAnnotationClickForm(TComponent* Owner);
};
//---------------------------------------------------------------------------
extern PACKAGE TAnnotationClickForm *AnnotationClickForm;
//---------------------------------------------------------------------------
#endif
